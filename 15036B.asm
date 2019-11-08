		#INCLUDE		CMS6052D.H 
;******************************************************************;
		FLAG0			EQU		?
		FLAG1			EQU		?
		TIME_2MS		EQU		?
		REMOTE_NUM      	EQU		?
		CODE1          	 	EQU		?
		CODE2           	EQU		?
		TN			EQU		?
		REMOTE_DATA1		EQU		?
		REMOTE_DATA2		EQU		?
		T_OUTPUT		EQU		?
		POWER_DELAY1		EQU		?
		TIMER_TIMEOUT		EQU		?
		TIMER_250MS		EQU		?
;******************************************************************;
;		Bit Flag Definition				   ;
;******************************************************************;
		F_2MS			EQU		TIME_2MS,4
			
		F_ONOFF			EQU		FLAG0,6
		F_OSC			EQU		FLAG0,5
		F_ION			EQU		FLAG0,4
		F_HIG			EQU		FLAG0,3
		F_MID           	EQU		FLAG0,2
		F_LOW           	EQU		FLAG0,1
		F_SLOW          	EQU		FLAG0,0
		
		F_PLUSE			EQU		FLAG1,0
		F_REMOTE		EQU		FLAG1,1
		F_T1S           	EQU		FLAG1,2
		F_OUTPUT		EQU		FLAG1,3
;******************************************************************;
		OUT_HIG			EQU		P0,0
		OUT_MID			EQU		P1,0
		OUT_LOW			EQU		P5,4
		OUT_SLOW		EQU		P1,2
		OUT_OSC			EQU		P1,3
		OUT_ION			EQU		P2,0
		REMOTE			EQU		P1,1
;******************************************************************;
		ORG			0000H
		JP			RESET
		NOP	
		NOP	
		JP			RESET
		JP			RESET
		NOP	
		NOP	
		JP			RESET
		ORG			0008H
		JP			INT_SERIVE
;******************************************************************;	
INT_SERIVE:
		PUSH
		SNZB			INTRQ,TC0IRQ
		JP			EXIT_INT
		CLRB			INTRQ,TC0IRQ
;------------------------------------------------------------------;	
TIMER:
		SZINCR			TIME_2MS
		NOP
;------------------------------------------------------------------;
; SEND_STATUS:								;有过零检测中可添加电源板状态检测代码段
		; LD			A,SEND_DELAY		
		; HSUBIA		D'40'
		; SZB			STATUS,C
		; JP			REMOTE_RECEIVE
		; SETB			P2M,2
		; NOP	
		; NOP	
		; SNZB			F_ZERO_ERR			;过零检测错误标志位
		; SETB			REMOTE				
		; SZB			F_ZERO_ERR
		; CLRB			REMOTE				;检测有问题则将REM_PORT置0
		; JP			END_REMOTE_RECEIVE
REMOTE_RECEIVE:
		; CLRB			P2M,2				;将端口置回输入
		LD			A,TN
		HSUBIA			D'200'
		SNZB			STATUS,C
		SZINCR			TN
		NOP
		SNZB			REMOTE				;初值为1
		JP			DECEND_PLUSE	
RISE_PLUSE:								;上升沿
		SZB			F_PLUSE
		JP			END_REMOTE_RECEIVE
		SETB			F_PLUSE
		JP			VALUE_JUD
DECEND_PLUSE:								;下降沿
		SNZB			F_PLUSE
		JP			END_REMOTE_RECEIVE
		CLRB			F_PLUSE
VALUE_JUD:		
		LD			A,TN
		HSUBIA			D'2'
		SNZB			STATUS,C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA			D'16'
		SZB			STATUS,C
		JP			ERROR_REMOTE
		RLCR			CODE2				;CODE2收满8位后,再左移则CODE2.7移到C中
		RLCR			CODE1				;通过C可将CODE2.7移到CODE1.0中,接收到的16位数据最头部在CODE1中
		LD			A,TN
		HSUBIA			D'9'
		SZB			STATUS,C
		JP			RECEIVE1
RECEIVE0:
		CLRB			CODE2,0
		JP			BIT_COUNT
RECEIVE1:
		SETB			CODE2,0
BIT_COUNT:
		SZINCR			REMOTE_NUM
		NOP
		LD			A,REMOTE_NUM
		HSUBIA			D'16'				;根据需要，选择储存的数据位数
		SNZB			STATUS,C
		JP			END_BIT_JUD
		LD			A,CODE1
		LD			REMOTE_DATA1,A			;接收完16位数据,REMOTE_DATA1储存载波前8位
		LD			A,CODE2
		LD			REMOTE_DATA2,A			;REMOTE_DATA2储存载波后8位
		SETB			F_REMOTE			;主板信号标志位
ERROR_REMOTE:
		CLR			REMOTE_NUM
		CLR			CODE1
		CLR			CODE2		
END_BIT_JUD:
		CLR			TN
END_REMOTE_RECEIVE:
;------------------------------------------------------------------;
EXIT_INT:
		POP
		RETI
;******************************************************************;
RESET:
		CLRWDT
		CLR			STATUS
		CLRB			STKP,GIE
		OPTION
		LDIA			B'11111111'
		LD			P0,A
		LD			P1,A
		LD			P5,A
		
		LDIA			B'11111101'
		LD			P0M,A
		LD			P1M,A
		LD			P5M,A
		
		LDIA			B'00000000'
		LD			P0UR,A
		LD			P1UR,A
		LD			P5UR,A
		NOP
		NOP
		NOP
		NOP
		NOP
;------------------------------------------------------------------;
		CLR			FSRH
		LDIA			30H
		LD			FSRL,A
CLR_RAM:
		SZDECR			FSRL
		NOP
		CLR			INDF
		LD			A,FSRL
		HSUBIA			D'1'
		SZB			STATUS,C
		JP			CLR_RAM
		CLR			INDF
POWER_ON_DELAY:
		SZINCR			POWER_DELAY1
		NOP
		LD			A,POWER_DELAY1
		HSUBIA			D'250'
		SNZB			STATUS,C
		JP			POWER_ON_DELAY
		CLR			POWER_DELAY1
		CLRWDT
INIT_TIMER:
		CLRB			INTRQ,TC0IRQ
		LDIA			B'01110100'						;Fcpu/2
		LD			TC0M,A
		LDIA			D'131'
		LD			TC0C,A
		LD			TC0R,A
		SETB			STKP,GIE
		SETB			INTEN,TC0IEN
		SETB			TC0M,TC0ENB
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
MAINLOOP:
		SNZB			F_2MS
		JP			MAINLOOP
		CLRB			F_2MS
		CLRWDT
		CALL			WORK_SUB
		CALL			TIMER_SUB
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
WORK_SUB:
		LD			A,FLAG0
		XORA			REMOTE_DATA1
		SZB			STATUS,Z
		JP			WORK_JUD
		LD			A,REMOTE_DATA1
		LD			FLAG0,A
		CLRB			F_OUTPUT
		CLR			T_OUTPUT
WORK_JUD:
		SNZB			F_ONOFF
		JP			WORK_STOP
		SZB			F_HIG
		JP			FAN_HIG
		SZB			F_MID
		JP			FAN_MID
		SZB			F_LOW
		JP			FAN_LOW
		SZB			F_SLOW
		JP			FAN_SLOW
		JP			WORK_STOP
FAN_HIG:
		SETB			OUT_MID
		SETB			OUT_LOW
		SETB			OUT_SLOW
		SZB	    		F_OUTPUT
		CLRB			OUT_HIG
		JP			OSC_JUD
FAN_MID:
		SETB			OUT_HIG
		SETB			OUT_LOW
		SETB			OUT_SLOW
		SZB	    		F_OUTPUT
		CLRB			OUT_MID
		JP			OSC_JUD
FAN_LOW:
		SETB			OUT_MID
		SETB			OUT_HIG
		SETB			OUT_SLOW
		SZB	    		F_OUTPUT
		CLRB			OUT_LOW
		JP			OSC_JUD
FAN_SLOW:
		SETB			OUT_MID
		SETB			OUT_LOW
		SETB			OUT_HIG
		SZB	    		F_OUTPUT
		CLRB			OUT_SLOW
OSC_JUD:
		SNZB			F_OSC
		CLRB			OUT_OSC
		SZB			F_OSC
		SETB			OUT_OSC
		JP			END_WORK_SUB
WORK_STOP:
		SETB			OUT_HIG
		SETB			OUT_MID
		SETB			OUT_LOW
		SETB			OUT_SLOW
		SETB			OUT_OSC
END_WORK_SUB:
		RET
;******************************************************************;
TIMER_SUB:
		SZINCR			TIMER_250MS
		NOP
		LD			A,TIMER_250MS
		HSUBIA			D'125'
		SNZB			STATUS,C
		JP			TIMER_SUB1
		CLR			TIMER_250MS
		LD			A,TIMER_TIMEOUT
		HSUBIA			D'200'
		SNZB			STATUS,C
		SZINCR			TIMER_TIMEOUT
		NOP
		SNZB			F_REMOTE
		JP			TIMER_SUB1
		CLRB			F_REMOTE
		CLR			TIMER_TIMEOUT
TIMER_SUB1:
		SNZB			F_ONOFF
		JP			STATUS_TIMEOUT
		SZINCR			T_OUTPUT
		NOP
		LD			A,T_OUTPUT
		HSUBIA			D'25'				;换挡间隔50ms
		SZB			STATUS,C
		SETB			F_OUTPUT
		LD			A,T_OUTPUT
		HSUBIA			D'250'
		SNZB			STATUS,C
		JP			STATUS_TIMEOUT
		CLR			T_OUTPUT
		;CLRB			F_OUTPUT
STATUS_TIMEOUT:
		LD			A,TIMER_TIMEOUT
		HSUBIA			D'20'				;超时没接收到主板信号,5S关闭电源
		SZB			STATUS,C
		CLRB			F_ONOFF
END_TIMER_SUB:
		RET
;******************************************************************;
		JP			RESET
		END
