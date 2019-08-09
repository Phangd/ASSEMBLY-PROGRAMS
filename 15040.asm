;**********************************************
			#INCLUDE	CMS6052D.H            
;**********************************************
;**********************************************
			OUT_FAN				EQU P0,0
			OUT_OSC				EQU P1,0
			LED_POW				EQU P1,2
			KEY_OSC				EQU P5,4
			KEY_POW				EQU P1,3
			PIN_ZERO			EQU	P1,1
;**********************************************
			FLAG1				EQU ?
			T1MS_TIMER			EQU ?
			T250MS_TIMER		EQU	?
			POWER_DELAY1		EQU	?
			ERR_CNT				EQU	?
			OK_CNT				EQU	?
			LEDN				EQU	?
			T_OUTPUT			EQU	?
			KEY_DELAY1			EQU	?
    		KEY_DELAY2			EQU	?
			KEY_VALUE			EQU	?
			KEY_VALUE0			EQU	?
			OSC_BUF				EQU	?
			SPEED				EQU	?
			ZERO_CNT			EQU	?
			PULSE_TIME			EQU	?
;*****************FLAG1************************
			F_ONOFF				EQU FLAG1,0
			F_OUTPUT			EQU FLAG1,1
			F_ZERO_UP			EQU	FLAG1,2
			F_ZERO_ERR			EQU FLAG1,3
			F_ONKEY				EQU FLAG1,4
;**********************************************
			F_T1MS				EQU	T1MS_TIMER,3
;**********************************************
			ORG		0000H
			JP		RESET
			NOP	
			NOP	
			JP		RESET
			JP		RESET
			NOP	
			NOP	
			JP		RESET
			ORG		0008H
			JP		INIT_TIMER0
;**********************************************
;**********************************************	
INIT_TIMER0:							;定时中断程序(125us)
			PUSH
			SNZB	INTRQ,TC0IRQ
			JP		EXIT_INT
			CLRB    INTRQ,TC0IRQ
;---------------- 1ms TIMER -------------------
TIMER0:									
			SZINCR	T1MS_TIMER			;T1MS_TIMER每8次自增,第三位0->1->0
			NOP							
ENDTINT:
;----------------------------------------------
ZERO_PRC:								;过零检测
			LD		A,ZERO_CNT
			HSUBIA	D'250'
			SNZB	STATUS,C
			SZINCR	ZERO_CNT
			NOP
			SNZB	PIN_ZERO			;过零口会0->1->0不断改变
			JP		ZERO_NPULSE
ZERO_PPULSE:							;正输出脉冲
			SZB		F_ZERO_UP
			JP		END_ZERO_PRC
			LD		A,ZERO_CNT
			HSUBIA	D'3'				;经过3次中断后ZERO_CNT清零
			SNZB	STATUS,C
			JP		END_ZERO_PRC
			SETB	F_ZERO_UP
			CLR		ZERO_CNT
			JP		END_ZERO_PRC
ZERO_NPULSE:							;负输出脉冲
			SNZB	F_ZERO_UP
			JP		END_ZERO_PRC
			LD		A,ZERO_CNT
			HSUBIA	D'3'
			SNZB	STATUS,C
			JP		END_ZERO_PRC
			CLRB	F_ZERO_UP
			CLR		ZERO_CNT
END_ZERO_PRC:
;----------------------------------------------
TRACE_PRC:								;可控硅驱动
			SNZB	F_ONOFF
			JP		TRACE_OFF
			LD		A,SPEED
			XORIA	D'1'
			SNZB	STATUS,Z
			JP		OUT_SPEED_MED
			LDIA	D'24'
			LD		PULSE_TIME,A
			JP		OUT_TRACE
OUT_SPEED_MED:
			LD		A,SPEED
			XORIA	D'2'
			SNZB	STATUS,Z
			JP		OUT_SPEED_LOW
			LDIA	D'26'
			LD		PULSE_TIME,A
			JP		OUT_TRACE
OUT_SPEED_LOW:
			LD		A,SPEED
			XORIA	D'3'
			SNZB	STATUS,Z
			JP		TRACE_OFF
			LDIA	D'29'
			LD		PULSE_TIME,A
OUT_TRACE:
			LD		A,ZERO_CNT			
			HSUBA	PULSE_TIME			;A=A-PULSE_TIME 影响C
			SNZB	STATUS,C
			JP		TRACE_OFF
			LD		A,ZERO_CNT
			HSUBA	PULSE_TIME
			HSUBIA	D'20'
			SZB		STATUS,C
			JP		TRACE_OFF
TRACE_ON:
			SETB	OUT_FAN
			JP		END_TRACE_PRC
TRACE_OFF:
			CLRB	OUT_FAN
END_TRACE_PRC:
;----------------------------------------------
EXIT_INT:
			POP
			RETI
;**********************************************
;**********************************************
RESET:
			CLRWDT
			NOP
			CLRB	STKP,GIE					;关闭中断总开关	
			CLR		INTEN						;禁止所有中断
			
			LDIA	B'00000000'            			
			LD		P0,A
			LDIA	B'00000100'
			LD		P1,A
			LDIA	B'00000000'
			LD		P5,A
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
												;设置IO口输入/输出
			SETB	P0M,P00M
			SETB	P1M,P10M
			SETB	P1M,P12M
												;设置IO口上/下拉电阻
			CLRB	P0UR,P00R
			CLRB	P1UR,P10R
			CLRB	P1UR,P12R
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			LDIA	B'00000000'            			
			LD		P0,A
			LDIA	B'00000100'
			LD		P1,A
			LDIA	B'00000000'
			LD		P5,A

;------------------清寄存器--------------------
			CLR		FSRH					;清专用寄存器
			LDIA	30H
			LD		FSRL,A					;清指针寄存器
CLR_RAM:
			SZDECR	FSRL					;FSRL--;
			NOP
			CLR 	INDF					;清间接寻址寄存器
			LD		A,FSRL
			HSUBIA	D'1'
			SZB		STATUS,C
			JP		CLR_RAM
			CLR		INDF
POWER_ON_DELAY:
			SZINCR	POWER_DELAY1
			NOP
			LD		A,POWER_DELAY1
			HSUBIA	D'250'
			SNZB	STATUS,C
			JP		POWER_ON_DELAY
			CLR		POWER_DELAY1
			CLRWDT
INIT_RAM:
			LDIA	B'01100100'			;禁止TC0定时器，TC0 4分频，内部时钟，TC0自动装载，P5/4输入口，禁止PWM输出
			LD		TC0M,A				;设置TC0工作模式
			LDIA	D'131'				;装初值
			LD		TC0R,A				;数据存入自动装载寄存器
			LD		TC0C,A				;清计数寄存器
			CLRB	INTRQ,TC0IRQ		;清TC0中断请求标志位
			SETB	INTEN,TC0IEN		;使能TC0中断
			SETB	STKP,GIE			;使能全局中断
			SETB	TC0M,TC0ENB			;使能TC0定时器
;**********************************************
;**********************************************
MAINLOOP:
			SNZB  	F_T1MS				;F_T1MS=1则为定时器溢出了一次,即1ms,SNZB为判断其是否为1
			JP		MAINLOOP			;F_T1MS为1则跳过这条指令，为0则跳回主循环开头
			CLRB  	F_T1MS				;1ms执行循环一次
			CLRWDT
			CALL	SCANKEY
			CALL	DISPLAY
			CALL	WORK_SUB
			JP		MAINLOOP
;**********************************************
;******************工作模式********************
WORK_SUB:
			SZB		F_ZERO_ERR
			JP		WORK_STOP
			SZB  	F_ONOFF				;判断F_ONOFF是否大于0
			JP		WORKING
WORK_STOP:
			CLRB	F_ONOFF
			CLRB	OUT_FAN
			CLRB	OUT_OSC
			JP		END_WORK_SUB
WORKING:
			SZB		OSC_BUF,0
			SETB	OUT_OSC
			SNZB	OSC_BUF,0
			CLRB	OUT_OSC
END_WORK_SUB:
        	RET
;----------------------------------------------
;*******************显示***********************
;**********************************************
DISPLAY:
			SETB	LED_POW				;POW低电平有效
			SZINCR	LEDN
			NOP
			SZB		F_ONOFF
			CLRB	LED_POW				;POWER亮
ZERO_CHECK:								;检测过零信号是否正常
			SZB		LEDN,0
			JP		END_ZERO_CHECK
			LD		A,ZERO_CNT
			HSUBIA	D'200'
			SNZB	STATUS,C
			JP		ZERO_OK
			CLR		OK_CNT
			SZINCR	ERR_CNT
			NOP
			LD		A,ERR_CNT
			HSUBIA	D'200'
			SNZB	STATUS,C
			JP		END_ZERO_CHECK
ZERO_ERR:
			SETB	F_ZERO_ERR			;异常
			JP		END_ZERO_CHECK
ZERO_OK:								;正常
			CLR		ERR_CNT				
			SZINCR	OK_CNT
			NOP
			LD		A,OK_CNT
			HSUBIA	D'50'
			SZB		STATUS,C
			CLRB	F_ZERO_ERR		
END_ZERO_CHECK:
;------------------------------------------------
END_DISPLAY:
        	RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;       		按键扫描子程序                     ;
;                                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCANKEY:
									;设置IO口输入/输出
			CLRB	P1M,P13M		;KEYOSC，输入
			CLRB	P5M,P54M		;KEYOSC，输入
									;设置IO口上下拉电阻
			SETB	P1UR,P13R		;KEYOSC，需要上拉
			SETB	P5UR,P54R		;KEYOSC，需要上拉
			
			CLR		KEY_VALUE
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			SNZB	KEY_POW
			SETB	KEY_VALUE,1
			SNZB	KEY_OSC
			SETB	KEY_VALUE,4
			NOP
			NOP
			NOP
			NOP
END_KEY_JUDG:		
        	LD		A,KEY_VALUE
        	HSUBIA  D'1'
        	SZB  	STATUS,C
        	JP      ON_KEY
NO_KEY:
        	LD   	A,KEY_DELAY2
        	HSUBIA  D'10'
        	SZB  	STATUS,C
        	JP      NO_KEY1
        	SZINCR  KEY_DELAY2
			NOP
        	JP      ENDKEY
NO_KEY1:
        	CLRB  	F_ONKEY
        	CLR     KEY_DELAY1
        	CLR     KEY_VALUE0
			JP    	ENDKEY
ON_KEY:
			LD		A,KEY_VALUE
			XORA	KEY_VALUE0
			SZB		STATUS,Z
			JP    	ON_KEY1
			CLR     KEY_DELAY1
			LD		A,KEY_VALUE
			LD		KEY_VALUE0,A
			JP    	ENDKEY
ON_KEY1:
        	LD   	A,KEY_DELAY1
        	HSUBIA  D'5'
        	SZB  	STATUS,C
        	JP      KEY_JUD
        	SZINCR  KEY_DELAY1
			NOP
        	JP      ENDKEY
KEY_JUD:
        	SZB  	F_ONKEY
        	JP      OLDKEY
        	LD   	A,KEY_DELAY2
        	HSUBIA  D'3'
        	SNZB  	STATUS,C
        	JP      ENDKEY0
        	CLR     KEY_DELAY2
        	SETB  	F_ONKEY
			
			LD		A,KEY_VALUE
			XORIA	02H
			SZB		STATUS,Z
			JP    	KEY_ONOFF

			LD		A,KEY_VALUE
			XORIA	10H
			SZB		STATUS,Z
			JP    	OSC_ONOFF
OLDKEY:
			JP		ENDKEY
KEY_ONOFF:
        	SZB  	F_ONOFF
        	JP      POWER_OFF
POWER_ON:
        	SETB  	F_ONOFF
			CLR		OSC_BUF
			LDIA	D'1'
			LD		SPEED,A
			JP		ENDKEY
POWER_OFF:
			SZINCR	SPEED
			NOP
			LD		A,SPEED
			HSUBIA	D'4'
			SNZB	STATUS,C
			JP		ENDKEY
			CLR		SPEED
			CLRB  	F_ONOFF
			CLR		OSC_BUF
			JP		ENDKEY
OSC_ONOFF:
         	SNZB  	F_ONOFF
        	JP      ENDKEY
			SZINCR	OSC_BUF
			NOP
			JP		ENDKEY
ENDKEY0:
        	CLR     KEY_DELAY2
			CLR		KEY_VALUE
        	JP      ENDKEY
ENDKEY:
			RET
;**********************************************
;**********************************************
;----------------------------------------------
			JP		RESET
			END
		
