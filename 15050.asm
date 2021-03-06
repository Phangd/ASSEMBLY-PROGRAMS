		#INCLUDE		CMS6052D.H           
;***********************************************************************;
;***********************************************************************;
		OUT_FAN			EQU 	P1,0
		OUT_OSC			EQU	P5,4
		SW_POW			EQU 	P1,2
		SW_OSC			EQU 	P1,3
		
		PIN_ZERO		EQU	P1,1			;过零
;***********************************************************************;
		FLAG0			EQU 	?
		T2MS_TIMER		EQU 	?
		POWER_DELAY1		EQU	?
		POWER_DELAY2		EQU	?
		ERR_CNT			EQU	?
		OK_CNT			EQU	?
		COUNTER			EQU	?
		T_OUTPUT		EQU	?
		KEY_DELAY1		EQU	?
		KEY_DELAY2		EQU	?
		KEY_VALUE		EQU	?
		KEY_VALUE0		EQU	?
		OSC_BUF			EQU	?
		SPEED			EQU	?
		ZERO_CNT		EQU	?
		PULSE_TIME		EQU	?
;***********************************************************************;
		F_ONOFF			EQU 	FLAG0,0
		F_OUTPUT		EQU 	FLAG0,1
		F_ZERO_UP		EQU	FLAG0,2
		F_ZERO_ERR		EQU 	FLAG0,3
		F_ONKEY			EQU 	FLAG0,4
;***********************************************************************;
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
;***********************************************************************;
INT_SERIVE:											;定时中断程序(50us)
		PUSH
		SNZB			INTRQ,TC0IRQ
		JP			EXIT_INT
		CLRB    		INTRQ,TC0IRQ
;-----------------------------------------------------------------------;
TIMER:									
		SZINCR			T2MS_TIMER			
		NOP							
END_TIMER:
;-----------------------------------------------------------------------;
ZERO_PRC:											;过零检测
		LD			A,ZERO_CNT
		HSUBIA			D'250'
		SNZB			STATUS,C
		SZINCR			ZERO_CNT
		NOP	
		SNZB			PIN_ZERO
		JP			ZERO_NPULSE
ZERO_PPULSE:										;正
		SZB			F_ZERO_UP
		JP			END_ZERO_PRC
		LD			A,ZERO_CNT
		HSUBIA			D'7'
		SNZB			STATUS,C
		JP			END_ZERO_PRC
		SETB			F_ZERO_UP
		CLR			ZERO_CNT
		JP			END_ZERO_PRC
ZERO_NPULSE:										;负
		SNZB			F_ZERO_UP
		JP			END_ZERO_PRC
		LD			A,ZERO_CNT
		HSUBIA			D'7'
		SNZB			STATUS,C
		JP			END_ZERO_PRC
		CLRB			F_ZERO_UP
		CLR			ZERO_CNT
END_ZERO_PRC:
;-----------------------------------------------------------------------;
TRACE_PRC:											;可控硅驱动
		SNZB			F_ONOFF
		JP			TRACE_OFF
		LD			A,SPEED
		XORIA			D'1'
		SNZB			STATUS,Z
		JP			OUT_SPEED_LOW		
		LDIA			D'40'						;GAO档
		LD			PULSE_TIME,A
		JP			OUT_TRACE
OUT_SPEED_LOW:		
		LD			A,SPEED
		XORIA			D'2'
		SNZB			STATUS,Z
		JP			TRACE_OFF
		LDIA			D'74'						;DI档
		LD			PULSE_TIME,A
OUT_TRACE:		
		LD			A,ZERO_CNT			
		HSUBA			PULSE_TIME
		SNZB			STATUS,C
		JP			TRACE_OFF
		LD			A,ZERO_CNT
		HSUBA			PULSE_TIME
		HSUBIA			D'50'
		SZB			STATUS,C
		JP			TRACE_OFF
TRACE_ON:		
		SETB			OUT_FAN
		JP			END_TRACE_PRC
TRACE_OFF:		
		CLRB			OUT_FAN
END_TRACE_PRC:
;-----------------------------------------------------------------------;
EXIT_INT:
		POP
		RETI
;***********************************************************************;
RESET:
		CLRWDT
		NOP
		CLRB			STKP,GIE
		CLR			INTEN

		LDIA			B'00000001'					;P1.0 OUTPUT P1.1/2/3 INPUT
		LD			P1M,A
		LDIA			B'00010000'					;P5.4 OUTPUT
		LD			P5M,A
		
		LDIA			B'00001100'
		LD			P1UR,A
		LDIA			B'00000000'
		LD			P5UR,A
		
		LDIA			B'00001100'
		LD			P1,A
		LDIA			B'00000000'
		LD			P5,A
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
;-----------------------------------------------------------------------;
		CLR			FSRH
		LDIA			30H
		LD			FSRL,A
CLR_RAM:
		SZDECR			FSRL
		NOP
		CLR 			INDF
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
		SZINCR			POWER_DELAY2
		NOP
		LD			A,POWER_DELAY2
		HSUBIA			D'3'
		SNZB			STATUS,C
		JP			POWER_ON_DELAY
		CLR			POWER_DELAY2
INIT_RAM:
		LDIA			B'01110100'					;禁止TC0定时器，TC0 fcpu/2，内部时钟
		LD			TC0M,A						;TC0自动装载，P5/4输出口，禁止PWM输出
		LDIA			D'206'
		LD			TC0R,A						;
		LD			TC0C,A						;
		CLRB			INTRQ,TC0IRQ				;清TC0中断请求标志位
		SETB			INTEN,TC0IEN				;使能TC0中断
		SETB			STKP,GIE					;使能全局中断
		SETB			TC0M,TC0ENB					;使能TC0定时器
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
MAINLOOP:
		LD			A,T2MS_TIMER
		HSUBIA			D'40'
		SNZB			STATUS,C
		JP			MAINLOOP
		CLR 			T2MS_TIMER
		CLRWDT
		CALL			SCANKEY
		CALL			WORK_SUB
		JP			MAINLOOP
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
WORK_SUB:
		SZINCR			COUNTER
		NOP
		SZB			F_ZERO_ERR
		JP			WORK_STOP
		SZB  			F_ONOFF
		JP			WORKING
WORK_STOP:	
		CLRB			F_ONOFF
		CLRB			OUT_FAN
		CLRB			OUT_OSC
		JP			ZERO_CHECK					;检测过零信号是否正常
WORKING:
		SZB			OSC_BUF,0
		SETB			OUT_OSC
		SNZB			OSC_BUF,0
		CLRB			OUT_OSC
;-----------------------------------------------------------------------;
ZERO_CHECK:
		SZB			COUNTER,0
		JP			END_ZERO_CHECK
		LD			A,ZERO_CNT
		HSUBIA			D'200'
		SNZB			STATUS,C
		JP			ZERO_OK
		CLR			OK_CNT
		SZINCR			ERR_CNT
		NOP		
		LD			A,ERR_CNT
		HSUBIA			D'200'
		SNZB			STATUS,C
		JP			END_ZERO_CHECK
ZERO_ERR:
		SETB			F_ZERO_ERR					;异常
		JP			END_ZERO_CHECK
ZERO_OK:											;正常
		CLR			ERR_CNT				
		SZINCR			OK_CNT
		NOP		
		LD			A,OK_CNT
		HSUBIA			D'50'
		SZB			STATUS,C
		CLRB			F_ZERO_ERR		
END_ZERO_CHECK:
;-----------------------------------------------------------------------;
END_WORK_SUB:
		RET
;***********************************************************************;
SCANKEY:
		LDIA			B'00000001'					;P1.0 OUTPUT P1.1 ZERO P1.2/3 INPUT
		LD			P1M,A
		LDIA			B'00001100'
		LD			P1UR,A
		
		CLR			KEY_VALUE
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
		NOP
		NOP
		NOP
		NOP
		NOP
		SNZB			SW_POW
		SETB			KEY_VALUE,0
		SNZB			SW_OSC
		SETB			KEY_VALUE,1
		NOP
		NOP
		NOP
		NOP
		NOP
;------------------------------------------------------------------;		
END_KEY_JUDG:		
		LD			A,KEY_VALUE
		HSUBIA  		D'1'
		SZB  			STATUS,C
		JP     			ON_KEY
NO_KEY:
		LD   			A,KEY_DELAY2
		HSUBIA 			D'10'
		SZB  			STATUS,C
		JP      		NO_KEY1
		SZINCR  		KEY_DELAY2
		NOP
		JP      		END_SCANKEY
NO_KEY1:	
		CLRB  			F_ONKEY
		CLR     		KEY_DELAY1
		CLR     		KEY_VALUE0
		JP    			END_SCANKEY
ON_KEY:	
		LD			A,KEY_VALUE
		XORA			KEY_VALUE0
		SZB			STATUS,Z
		JP    			ON_KEY1
		CLR     		KEY_DELAY1
		LD			A,KEY_VALUE
		LD			KEY_VALUE0,A
		JP    			END_SCANKEY
ON_KEY1:	
		LD   			A,KEY_DELAY1
		HSUBIA  		D'5'
		SZB  			STATUS,C
		JP      		KEY_JUD
		SZINCR  		KEY_DELAY1
		NOP	
		JP      		END_SCANKEY
KEY_JUD:	
		SZB  			F_ONKEY
		JP      		OLDKEY
		LD   			A,KEY_DELAY2
		HSUBIA  		D'3'
		SNZB  			STATUS,C
		JP      		ILLEGAL_KEY
		CLR     		KEY_DELAY2
		SETB  			F_ONKEY
		
		LD			A,KEY_VALUE
		XORIA			01H
		SZB			STATUS,Z
		JP    			KEY_ONOFF

		LD			A,KEY_VALUE
		XORIA			02H
		SZB			STATUS,Z
		JP    			OSC_ONOFF
OLDKEY:
		JP			END_SCANKEY					;NO LONG PRESS
KEY_ONOFF:
		SZB  			F_ONOFF
		JP			SPEED_CHANGE
		SETB			F_ONOFF
		CLR			OSC_BUF
		LDIA			D'1'
		LD			SPEED,A
		JP			END_SCANKEY
SPEED_CHANGE:
		SZINCR			SPEED
		NOP
		LD			A,SPEED
		HSUBIA			D'3'
		SNZB			STATUS,C
		JP			END_SCANKEY
		CLR			SPEED
		CLRB			F_ONOFF
		CLR 			OSC_BUF
		JP			END_SCANKEY
OSC_ONOFF:
		SNZB  			F_ONOFF
		JP      		END_SCANKEY
		SZINCR			OSC_BUF
		NOP
		JP			END_SCANKEY
ILLEGAL_KEY:
		CLR     		KEY_DELAY2
		CLR			KEY_VALUE
END_SCANKEY:
		RET
;***********************************************************************;
;***********************************************************************;
;***********************************************************************;
		JP			RESET
		END
