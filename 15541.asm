		IAR				EQU	00H
		TMR0			EQU 01H
		PCL				EQU 02H
		FLAGS			EQU 03H
		C				EQU	FLAGS,0
		Z				EQU	FLAGS,2
		MP				EQU 04H
		P0				EQU 05H
		P1				EQU 06H
		P2  			EQU	07H
		P0CL  			EQU	09H
		P0CH  			EQU	0AH
		P1CL  			EQU	0BH
		P1CH  			EQU	0CH
		P2C  			EQU	0DH
		SYS_GEN			EQU	10H
		ADC_EN			EQU	1
		INT_GEN			EQU	0
		INT_EN 			EQU	11H
		EN_T1			EQU	3
		INT_FLAG		EQU	12H
		F_T1			EQU	3
		INT_EXT			EQU	13H
		ADDATA 			EQU	14H
		ADCON 			EQU	15H
		CONV  			EQU	0
		EOC				EQU	3
		TMR1 			EQU	16H
		TMR1C 			EQU	17H
		TON				EQU	4
		T2CNT 			EQU	18H
		T2CON 			EQU	19H
		T2DATA 			EQU	1AH
		PWM8DATA		EQU	1CH
		PWM8CON			EQU	1DH
		PWM10CON		EQU	1EH
		PWM10DATA		EQU	1FH
		COMPCON			EQU	20H
		BUZCON 			EQU	21H
		TABLE_SPH		EQU	22H
		TABLE_SPL		EQU	23H
		TABLE_DATAH		EQU	24H
;************************************************
						        ;69F116C
		OUT_BUZ			EQU	P0,0
		OUT_LOW			EQU	P0,1
		OUT_HIG			EQU	P0,2
		REMOTE			EQU	P0,3
		I2C_CLK			EQU	P0,4
		I2C_SDA			EQU	P0,5
		NTC				EQU	P0,6
		;NC				EQU	P0,7
	
	    SW_OSC	     	EQU P1,0
		SW_TIMER 		EQU	P1,1
	    SW_POWER      	EQU P1,2
	    ZERO_IN     	EQU P1,3
	    SW_DOWN      	EQU P1,4
	    SW_UP	 		EQU P1,5
		SW_SPEED		EQU	P1,6

		;NC				EQU	P2,0
		OUT_FAN  		EQU	P2,1
		OUT_OSC			EQU	P2,2
;************************************************
;************************************************
		ACC_BUF			EQU	30H
		STATUS_BUF		EQU	31H
		FLAG1			EQU	32H	
    	FLAG2			EQU	33H
    	FLAG3			EQU	34H
    	HEAT_SETUP		EQU	35H
    	T_ROOM_BUF		EQU	36H
    	T250MS_TIMER1	EQU	37H
		T_SETUP_F    	EQU	38H
    	T_SETUP_C    	EQU	39H
    	T1MS_TIMER		EQU	3AH
    	T250MS_TIMER	EQU	3BH
    	T_TEMP_HOLD0	EQU	3CH
    	T_TEMP_HOLD		EQU	3DH
    	T_FAN_DELAY		EQU	3EH
		CODE5			EQU	3FH
    	T_SEC			EQU	40H
    	T_MIN			EQU	41H
    	T_HOUR 			EQU	42H
    	T_MIN0			EQU	43H
    	T_FLASH			EQU	44H
    	T_HEAT_ON		EQU	45H
		FLAG4			EQU	46H
    	;T_DELAY_MIN		EQU	47H
    	T_BUZ			EQU	48H
    	BITNUM			EQU	49H
    	DISP_NUM		EQU	4AH
    	LEDTR1			EQU	4BH
    	LEDTR2			EQU	4CH
		LEDTR3			EQU	4DH
		;T_REMOTE1       EQU	4EH
    	T_ADC_DELAY		EQU	4FH
    	LIGHON			EQU	50H   
    	KEY_DELAY		EQU	51H
    	KEY_TIMER		EQU	52H
    	KEY_VALUE		EQU	53H
    	KEY_VALUE0		EQU	54H
    	TN				EQU	55H
    	REMOTE_NUM		EQU	56H
    	CODE0			EQU	57H
   		CODE1			EQU	58H
    	CODE2			EQU	59H
    	CODE3			EQU	5AH
    	CODE4			EQU	5BH
    	T_ROOM_F		EQU	5CH
    	T_ROOM_REAL		EQU	5DH
		LOSE_TIME3		EQU	5EH
    	;ZERO_NUM	    EQU	5FH
    	;T_DELAY_SEC     EQU	60H
    	ADC_NUM			EQU	61H
    	NTC_RAM1		EQU	62H
    	NTC_RAM2		EQU	63H
    	LED_BUF1		EQU	64H
    	LED_BUF2		EQU	65H	
	    OVER_CNT1		EQU	66H
	    OVER_CNT2		EQU	67H
    	OVER_CNT3		EQU	68H
    	OVER_CNT4		EQU	69H
    	OVER_CNT5		EQU	6AH
    	HEAT_WORK		EQU	6BH
    	HEAT_WORK_BUF	EQU	6CH
    	T_SEC0			EQU	6DH
    	T_SETUP_MAX     EQU	6EH
    	T_SETUP_LOW     EQU	6FH
    	;T_REMOTE3       EQU	70H
    	LOSE_TIME1		EQU	71H
    	LOSE_TIME2  	EQU	72H		
		T_NPULSE_BUF	EQU	73H
		T_NPULSE		EQU	74H
		NTC_RAM			EQU	75H
		T_ZERO			EQU	76H
		T_ROOM_DISP		EQU	77H
		;T_OUTPUT		EQU	78H
		DSP_BUF3		EQU	79H
		CODE6			EQU	7AH
		DSP_BUF2		EQU	7BH
		DSP_BUF1		EQU	7CH
		DSP_BUF			EQU	7DH
		WAIT_TIME1		EQU	7EH
;-------------------FLAG1----------------------
		;FLAG1
		F_T1MS	        EQU	T1MS_TIMER,3

		F_ONOFF	        EQU	FLAG1,0
		F_TIMER_OFF		EQU	FLAG1,1
		;F_TR_OUT       	EQU	FLAG1,2
		F_AUTO			EQU	FLAG1,3
		F_OSC			EQU	FLAG1,4
		;F_OUTPUT		EQU	FLAG1,5
		F_YK_FIRST		EQU	FLAG1,6
		F_KEY_MODE		EQU	FLAG1,7
		
		;FLAG2
		F_BUZ			EQU	FLAG2,0
		F_ONKEY			EQU	FLAG2,1
		F_REMOTE		EQU	FLAG2,2
		F_PROTECT   	EQU	FLAG2,3
		F_RISE_YK		EQU	FLAG2,4
	    F_FAST			EQU	FLAG2,5
	    F_TEMP_MODE		EQU	FLAG2,6
	    F_TEMP_130F		EQU	FLAG2,7
	    	
		;FLAG3
		F_TEMP_SET		EQU	FLAG3,0
		F_TIMER_SET		EQU	FLAG3,1
		F_ZERO_RISE		EQU	FLAG3,2
		F_POWER_LOW     EQU FLAG3,3
		F_TEMP_HOLD		EQU FLAG3,4
		F_ADC_FIRST		EQU	FLAG3,5
		F_CHANGE		EQU	FLAG3,6
		F_NOPOWER		EQU	FLAG3,7

		;FLAG4
		F_TEMP_FIRST	EQU	FLAG4,0

		F_LED_1A	EQU	LEDTR1,7
		F_LED_1B	EQU	LEDTR1,6
		F_LED_1C	EQU	LEDTR1,5
		F_LED_1D	EQU	LEDTR1,4
		F_LED_1E	EQU	LEDTR1,3
		F_LED_1F	EQU	LEDTR1,2
		F_LED_1G	EQU	LEDTR1,1

		F_LED_2A	EQU	LEDTR2,7
		F_LED_2B	EQU	LEDTR2,6
		F_LED_2C	EQU	LEDTR2,5
		F_LED_2D	EQU	LEDTR2,4
		F_LED_2E	EQU	LEDTR2,3
		F_LED_2F	EQU	LEDTR2,2
		F_LED_2G	EQU	LEDTR2,1

		F_LED_AUTO	EQU	LEDTR3,0
		F_LED_TIMER	EQU	LEDTR3,1
		F_LED_HIG	EQU	LEDTR3,2
		F_LED_LOW	EQU	LEDTR3,3
		F_LED_ECO	EQU	LEDTR3,4
;******************************************************
;******************************************************
			ORG		00H
			JP		RESET
			ORG		01H
			JP		INT_TIMER0
;******************************************************
;******************************************************
INT_TIMER0:						; 定时中断程序(125us)
			LD		ACC_BUF,A
			SWAPR	ACC_BUF
			SWAPA	FLAGS
			LD		STATUS_BUF,A
			CLRB    INT_FLAG,F_T1
;------------------- BUZZER -----------------------
			SNZB	F_BUZ
			JP		BUZZ_OFF
BUZZ:		
			LDIA	01H
			XORR	P0
			JP		END_BUZZ
BUZZ_OFF:
			CLRB	OUT_BUZ
END_BUZZ:	          
;------------------- 1ms TIMER --------------------
TIMER0:		
			INCR	T1MS_TIMER			;1ms定时
ENDTINT:
;------------------- REMOTE -----------------------
REMOTE_RECEIVE:   
			LD		A,TN
			HSUBIA	D'200'
			SNZB	C
			INCR 	TN
			SZB  	F_REMOTE
        	JP		END_REMOTE
			SNZB	REMOTE
			JP		YK_NPULSE
YK_PPULSE:								; 上升沿
  	    	SZB		F_RISE_YK
			JP    	END_REMOTE
			SETB	F_RISE_YK
			SNZB	F_YK_FIRST
			JP    	YK_PPULSE1
			LD		A,TN		  		; >1ms
			HSUBIA	D'10'
			SZB		C
			JP    	ERROR_REMOTE
			CLR    	TN
			JP    	END_REMOTE
YK_PPULSE1:
  	    	LD		A,TN
			HSUBIA	D'60'		    	; >7.6ms?
			SNZB	C
			JP    	ERROR_REMOTE
			LD		A,TN
			HSUBIA	D'90'		    	; <11ms?
			SZB		C
			JP    	ERROR_REMOTE
			CLR    	TN					; 9ms 头码
			CLR		REMOTE_NUM
			CLR		CODE0
			JP		END_REMOTE
YK_NPULSE:								; 下降沿
  	    	SNZB	F_RISE_YK
			JP    	END_REMOTE
			CLRB	F_RISE_YK
			SZB		F_YK_FIRST
			JP		YK_NPULSE1
			LD		A,TN
			HSUBIA	D'50'		  		; <6ms?
			SZB		C
			JP    	ERROR_REMOTE
			LD		A,TN		   		; >3.5ms?
			HSUBIA	D'28'
			SNZB	C
			JP    	ERROR_REMOTE
			SETB	F_YK_FIRST			; 4.5ms 头码
			CLR		TN
			CLR		REMOTE_NUM
			CLR		CODE0
			JP		END_REMOTE
YK_NPULSE1:	
        	RLCR	CODE0
			RLCR	CODE2
			RLCR	CODE3
			RLCR	CODE4
			RLCR    CODE5
			RLCR    CODE6
			LD		A,TN				; >2ms?
			HSUBIA	D'21'
			SZB		C
			JP		ERROR_REMOTE
			LD		A,TN		     	; 1ms?
			HSUBIA	D'9'
			SZB		C
			JP		YK_BIT1
			LD		A,TN
			HSUBIA  D'2'
			SNZB	C
			JP    	ERROR_REMOTE
YK_BIT0:
  	    	CLRB	CODE0,0
			JP		YK_BITJUD
YK_BIT1:
			SETB	CODE0,0
YK_BITJUD:
  	    	CLR    	TN
			INCR 	REMOTE_NUM
			LD		A,REMOTE_NUM
			HSUBIA	D'48'
			SNZB	C
			JP		END_REMOTE
			LD		A,CODE0
			LD		CODE1,A
			SETB	F_REMOTE
ERROR_REMOTE:
  	    	CLR		TN
			CLR    	CODE0
			CLR		REMOTE_NUM
			CLRB	F_YK_FIRST
END_REMOTE:
;----------------------------------------------
ZERO_PLUSE:									;过零信号
			LD		A,T_ZERO
			HSUBIA	D'253'
			SNZB	C
			INCR	T_ZERO
			SNZB	ZERO_IN
			JP		NPLUSE
PPLUSE:
			INCR	T_NPULSE_BUF
			SZB		F_ZERO_RISE
			JP		END_ZERO_PULSE
			SETB	F_ZERO_RISE				; 上升沿
			JP		END_ZERO_PULSE
;------------------------------------------------------
NPLUSE:	
			SNZB	F_ZERO_RISE
			JP		END_ZERO_PULSE
			CLRB	F_ZERO_RISE
			LD		A,T_NPULSE_BUF
			LD		T_NPULSE,A
			CLR		T_NPULSE_BUF			;下降沿处理
			CLR		T_ZERO
END_ZERO_PULSE:
;------------------------------------------------------
EXIT_INT:
			SWAPA	STATUS_BUF	            ; 现场恢复
			LD		FLAGS,A
			SWAPA	ACC_BUF
			RETI
;******************************************************
;******************************************************
RESET:
			CLRWDT
			LDIA	B'00000110'            	; 端口设置及初始化
			LD		P0,A
			LDIA	B'00000000'
			LD		P1,A
			LDIA	B'00000110'
			LD		P2,A

			LDIA    B'01101010'
			LD      P0CL,A
			LDIA    B'00111010'
			LD      P0CH,A
			LDIA    B'01000000'
			LD      P1CL,A
			LDIA	B'00000000'
			LD      P1CH,A
			LDIA    B'10010000'
			LD      P2C,A

			LDIA	B'00000110'            	; 端口设置及初始化
			LD		P0,A
			LDIA	B'00000000'
			LD		P1,A
			LDIA	B'00000110'
			LD		P2,A

			CLRA	
			OPTION
			CLRB	TMR1C,TON
			CLRB	INT_EN,EN_T1
			CLRB	INT_FLAG,F_T1		        ;内部8M晶振。
			LDIA	81H	     		        	;TMR1初值=256-（TMR0的中断间隔时间*TMR0的输入时钟）
			LD		TMR1C,A	                    ;    =256-(125us*8M/4/2)
			LDIA	83H		                	;	 =256-125
			LD		TMR1,A	                    ;	 =131.(83h)
			CLRB	INT_FLAG,F_T1
CLR_RAM:
			LDIA	2FH
			LD  	MP,A
CLR_LOOP:
			INCR	MP							;清掉从	30H-7FH 地址的RAM
			CLR 	IAR
			LDIA	07FH
			SUBA	MP
			SNZB	C
			JP  	CLR_LOOP
INIT_RAM:
			SETB	INT_EN,EN_T1
			SETB	SYS_GEN,INT_GEN
			SETB	TMR1C,TON
			  
			LDIA    D'75'
			LD   	T_SETUP_F,A
			LD   	T_SETUP_LOW,A
			LD		T_SETUP_MAX,A
			LDIA    D'2'
			ADDR    T_SETUP_MAX
			LDIA	D'24'
			LD		T_SETUP_C,A

			LDIA	D'30'
			LD		OVER_CNT1,A
			LDIA	D'250'
			LD		T_ADC_DELAY,A
			SETB	F_POWER_LOW
			CLRB	F_PROTECT
;******************************************************
;******************************************************
MAINLOOP:
			CALL    ADC_GET
			SNZB  	F_T1MS
			JP		MAINLOOP
			CLRB  	F_T1MS
			CLRWDT
			CALL	DISPLAY_DATA
			CALL	DISPLAY
			CALL    TIMER_SUB
MAIN_LOOP2: 
			CALL	SENSOR_SUB
			CALL    SCANKEY
			CALL    WORK_SUB
			JP      MAINLOOP
;******************************************************
;******************************************************
WORK_SUB:
			LD		A,DISP_NUM
			XORIA	D'3'
			SNZB	Z
			JP		END_WORK_SUB
			SZB		F_NOPOWER
			JP		SHUT_OFF
			SZB		F_POWER_LOW
			JP    	WORK_OFF
			SZB  	F_PROTECT
			JP      WORK_OFF
			SZB  	F_ONOFF
			JP		WORK_JUD
WORK_OFF:
			CLRB	F_ONOFF
SHUT_OFF:
			SETB	OUT_HIG
			SETB  	OUT_LOW
			SETB  	OUT_FAN
			SETB	OUT_OSC
			CLR		T_HEAT_ON
			JP		END_WORK_SUB        
;----------------------------------------------
WORK_JUD:
			SZB  	F_AUTO
			JP		WORK_AUTO
WORK_NORMAL:
			LD   	A,HEAT_SETUP
			ADDR	PCL	
			JP		WORK_HIG
			JP		WORK_LOW
WORK_AUTO:							; AUTO模式
			LD		A,HEAT_WORK
			ADDR	PCL	
			JP		WORK_HIG
			JP		WORK_LOW
			JP		WORK_STOP
WORK_STOP:
			SETB	OUT_HIG
			SETB	OUT_LOW
			SETB	OUT_OSC
			CLR		T_HEAT_ON
			LD		A,T_FAN_DELAY	; 风扇延时15秒关闭
			HSUBIA	D'150'
			SZB		C
			SETB  	OUT_FAN
			JP      END_WORK_SUB
WORK_LOW:							; 低档工作
			SETB	OUT_HIG
			CLRB	OUT_FAN
			LD		A,T_HEAT_ON
			HSUBIA	D'10';4
			SNZB	C
			JP		END_WORK_SUB
			CLRB	OUT_LOW
			CLR		T_FAN_DELAY
			JP		WORK_OSC_MODE
WORK_HIG:							; 高档工作
			CLRB	OUT_FAN
			LD		A,T_HEAT_ON
			HSUBIA	D'10';10
			SNZB	C
			JP		END_WORK_SUB
			CLRB	OUT_LOW
			CLR		T_FAN_DELAY
			LD		A,T_HEAT_ON
			HSUBIA	D'50';50
			SNZB	C
			JP		WORK_OSC_MODE
			CLRB	OUT_HIG
WORK_OSC_MODE:
			SZB		F_OSC
			CLRB	OUT_OSC
			SNZB	F_OSC
			SETB	OUT_OSC
			JP		END_WORK_SUB
;----------------------------------------------
END_WORK_SUB:
        	RET
;***********************************************************		
;***********************************************************
TIMER_SUB:
			LD		A,DISP_NUM
			XORIA	D'5'
			SNZB	Z
			JP		TIMER_SUB0
ZERO_JUD:								; 8ms
			LD		A,T_ZERO
			HSUBIA	D'250'
			SZB		C
			JP		ZERO_JUD1;3			; OVER 32ms NO ZERO PULSE
			LD		A,T_NPULSE
			HSUBIA	D'95'				; VOLT<85V?
			SNZB	C
			JP    	ZERO_JUD2
ZERO_JUD1:
			CLR     LOSE_TIME2
			CLR		LOSE_TIME3
			INCR   	LOSE_TIME1
			NOP
			LD   	A,LOSE_TIME1
			HSUBIA  D'60';'125'
			SZB  	C
			SETB	F_POWER_LOW
			JP      END_ZERO_JUD
ZERO_JUD3:
			CLR		LOSE_TIME1
			CLR		LOSE_TIME2
			INCR	LOSE_TIME3
			NOP
			LD		A,LOSE_TIME3
			HSUBIA	D'5'
			SNZB	C
			JP		END_ZERO_JUD
			SETB	F_NOPOWER
			SETB	OUT_FAN
			SETB  	OUT_HIG
			SETB  	OUT_LOW
			SETB	OUT_OSC
			JP		END_ZERO_JUD
ZERO_JUD2:
			CLR		LOSE_TIME1
			CLR		LOSE_TIME3
			INCR	LOSE_TIME2
			NOP
			LD		A,LOSE_TIME2
			HSUBIA	D'60'
			SNZB	C
			JP		END_ZERO_JUD
			CLRB	F_NOPOWER
			SNZB	F_POWER_LOW
			JP		END_ZERO_JUD
POWER_ON:								; 上电
			CLR		T_BUZ
			SETB	F_BUZ
			CLRB	F_POWER_LOW
END_ZERO_JUD:
;----------------------------------------------
TIMER_SUB0:								; 1ms
			INCR	T250MS_TIMER
			LD   	A,T250MS_TIMER
			HSUBIA  D'100';250
			SNZB  	C
			JP      T1
T_05SEC:								; 0.1s
			CLR     T250MS_TIMER
			
			INCR    T_FLASH
			LD   	A,T_FLASH			; 时间设定闪烁5s
			HSUBIA  D'50';20
			SZB  	C
			CLRB	F_TIMER_SET
			LD   	A,T_FLASH			; 温度设定闪烁10s
			HSUBIA  D'100';40
			SZB  	C
			CLRB	F_TEMP_SET
T_05SEC1:
			LD   	A,T_SEC0
			HSUBIA  D'250'
			SNZB  	C
			INCR   	T_SEC0
        	
			LD   	A,T_HEAT_ON
			HSUBIA  D'250'
			SNZB  	C
			INCR    T_HEAT_ON

			LD		A,T_FAN_DELAY
			HSUBIA	D'250'
			SNZB	C
			INCR	T_FAN_DELAY
T_05SEC2:
			INCR	T_TEMP_HOLD0
			LD		A,T_TEMP_HOLD0
			HSUBIA	D'10';4
			SNZB	C
			JP		T_05SEC3
			CLR		T_TEMP_HOLD0
			INCR	T_TEMP_HOLD
			NOP
T_05SEC3:
;*******************************************************
TIMER_JUD:
			INCR    T_SEC
			LD   	A,T_SEC
			HSUBIA  D'180';240
			SNZB  	C
			JP      END_TIMER_JUD
			CLR     T_SEC				; 18S
			INCR    T_MIN
			LD   	A,T_MIN
			HSUBIA  D'200';60
			SNZB  	C
			JP      END_TIMER_JUD
			CLR     T_MIN				;1H
			LD   	A,T_HOUR
			HSUBIA  D'1'
			SNZB  	C
			JP     	END_TIMER_JUD
			DECR   	T_HOUR
			LD   	A,T_HOUR
			HSUBIA  D'1'
			SZB  	C
			JP      END_TIMER_JUD
			CLRB  	F_ONOFF
			CLRB	F_TIMER_OFF
			CLRB  	F_AUTO
END_TIMER_JUD:
;**************************************************
T1:
			INCR    T250MS_TIMER1
			LD   	A,T250MS_TIMER1
			HSUBIA  D'250'
			SNZB  	C
			JP      END_T1
			CLR     T250MS_TIMER1
			INCR    LIGHON
			SETB	F_ADC_FIRST
END_T1:
;***************************************************
BUZ_TIMER:
			SNZB	F_BUZ
			JP		END_BUZ_TIMER
			INCR   	T_BUZ
			LD   	A,T_BUZ
			HSUBIA  D'160'
			SZB  	C
			CLRB  	F_BUZ
END_BUZ_TIMER:
;---------------------------------------------------------
END_TIMER_SUB:
			RET
;*********************************************************
;************************DISPLAY**************************
DISPLAY_DATA:
			INCR    DISP_NUM
			LD   	A,DISP_NUM
			HSUBIA  D'8'
			SNZB  	C
			JP      END_DISP_DATA
			CLR     DISP_NUM
			CLR     LEDTR1
			CLR     LEDTR2
			CLR     LEDTR3
DISP_DATA:
			SZB		F_NOPOWER
			JP      END_DISP_DATA
			SZB		F_POWER_LOW
			JP      END_DISP_DATA
			SNZB  	F_PROTECT
			JP      DISP_DATA1
			SZB  	LIGHON,1			;温度保护显示			
			JP      END_DISP_DATA
DISP_ERR:
			LDIA    0FEH
			LD   	LEDTR1,A
			LD   	LEDTR2,A
			SETB	F_LED_HIG			;超温保护HIG和LOW灯闪烁
			SETB	F_LED_LOW
			JP      END_DISP_DATA
;----------------------------------------------
DISP_DATA1:
			SNZB  	F_ONOFF
			JP      END_DISP_DATA
			SZB  	F_TEMP_SET
			JP      DISP_DATA2
			SZB		F_TIMER_SET
			JP      DISP_DATA3        
DISP_DATA10:
			LD   	A,T_ROOM_DISP
			LD   	LED_BUF2,A
			CALL    CALL_TABLE
			LD   	A,LED_BUF1
			LD   	LEDTR1,A
			LD  	A,LED_BUF2
			LD   	LEDTR2,A
			JP		DISP_DATA4
;----------------------------------------------
DISP_DATA2:							;温度设置显示
			SZB  	LIGHON,1
			JP      DISP_DATA4
			SZB   	F_TEMP_MODE
			JP      DISP_DATA22
DISP_DATA21:						; F
			LD  	A,T_SETUP_F
			LD   	LED_BUF2,A
			CALL    CALL_TABLE
			LD   	A,LED_BUF1
			LD   	LEDTR1,A
			LD   	A,LED_BUF2
			LD   	LEDTR2,A
			JP      DISP_DATA4
DISP_DATA22:						; C
			LD  	A,T_SETUP_C
			LD   	LED_BUF2,A
			CALL    CALL_TABLE
			LD   	A,LED_BUF1
			LD   	LEDTR1,A
			LD   	A,LED_BUF2
			LD   	LEDTR2,A
			JP      DISP_DATA4        
;----------------------------------------------
DISP_DATA3:							;时间设置显示
			SZB  	LIGHON,1
			JP      DISP_DATA4  
			LD   	A,T_HOUR
			LD   	LED_BUF2,A
			CALL    CALL_TABLE
			LD   	A,LED_BUF2
			LD   	LEDTR1,A
			LDIA    2EH
			LD   	LEDTR2,A
;-----------------------------------------------
DISP_DATA4:
			SZB  	F_AUTO
			JP		DISP_DATA42		;自动模式HIG灯亮
			LD   	A,HEAT_SETUP
			ADDR	PCL	
			JP		DISP_DATA42
			JP		DISP_DATA41
DISP_DATA41:						; H1--LOW
			SETB	F_LED_LOW
			JP      DISP_DATA5
DISP_DATA42:						; H3--HIG
			SETB	F_LED_HIG
;-------------------------------------------------
DISP_DATA5:
			LD		A,T_HOUR
			HSUBIA	D'1'
			SZB		C
			SETB	F_LED_TIMER
DISP_DATA6:
			SZB  	F_AUTO
			SETB	F_LED_AUTO
;-------------------------------------------------
END_DISP_DATA:
			RET
;*************************************************
;**********************DISPLAY********************
DISPLAY:
			LD		A,DISP_NUM
			XORIA	D'1'
			SNZB	Z
			JP		END_DISPLAY
			CLR		DSP_BUF1
			CLR		DSP_BUF2
			CLR		DSP_BUF3
			SZB		LEDTR1,7
			SETB	DSP_BUF1,5
			SZB		LEDTR1,6
			SETB	DSP_BUF1,4
			SZB		LEDTR1,5
			SETB	DSP_BUF1,3
			SZB		LEDTR1,4
			SETB	DSP_BUF1,1
			SZB		LEDTR1,3
			SETB	DSP_BUF1,2
			SZB		LEDTR1,2
			SETB	DSP_BUF1,6
			SZB		LEDTR1,1
			SETB	DSP_BUF1,7

			SZB		LEDTR2,7
			SETB	DSP_BUF2,5
			SZB		LEDTR2,6
			SETB	DSP_BUF2,4
			SZB		LEDTR2,5
			SETB	DSP_BUF2,3
			SZB		LEDTR2,4
			SETB	DSP_BUF2,1
			SZB		LEDTR2,3
			SETB	DSP_BUF2,2
			SZB		LEDTR2,2
			SETB	DSP_BUF2,6
			SZB		LEDTR2,1
			SETB	DSP_BUF2,7
		
			SZB		F_LED_AUTO
			SETB	DSP_BUF3,3
			SZB		F_LED_TIMER	
			SETB	DSP_BUF3,4
			SZB		F_LED_HIG
			SETB	DSP_BUF3,5
			SZB		F_LED_LOW
			SETB	DSP_BUF3,1
DISP_LED:
			CLRB	I2C_CLK
			CLRB	I2C_SDA
			LDIA	B'00001000'
			ORR		P0CH
			NOP
			NOP
			CALL	I2C_START
			LDIA	68H
			CALL	TRANSING
			LD		A,DSP_BUF3
			CALL	TRANSING
			CALL	I2C_STOP
			CALL	I2C_START
			LDIA	6AH
			CALL	TRANSING
			LD		A,DSP_BUF2
			CALL	TRANSING			
			CALL	I2C_STOP
			CALL	I2C_START
			LDIA	6CH
			CALL	TRANSING
			LD		A,DSP_BUF1
			CALL	TRANSING
			CALL	I2C_STOP
			CALL	I2C_START
			LDIA	48H
			CALL	TRANSING
			LDIA	41H
			CALL	TRANSING			
			CALL	I2C_STOP			
;----------------------------------------------
END_DISPLAY:
        	RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           AIP650写指令/数据处理子程序	      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TRANSING:
			LD		DSP_BUF,A
			LDIA	D'8'
			LD		BITNUM,A
LBITL:
			CLRB	I2C_CLK
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			RLCR	DSP_BUF
			SZB		C
			JP		LBIT1
LBIT0:
			CLRB	I2C_SDA
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			JP		LRL
LBIT1:  
			SETB	I2C_SDA
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
LRL:              
			SETB	I2C_CLK
			NOP
			NOP
			DECR	BITNUM
			NOP
			LD		A,BITNUM
			HSUBIA	D'1'
			SZB		C
			JP		LBITL
			CLRB	I2C_CLK
			LDIA	B'11110011'
			ANDR	P0CH
			NOP
			NOP
			NOP
			NOP
TRANSING1:
			SNZB	I2C_SDA
			JP		END_TRANSING
			INCR	WAIT_TIME1
			NOP
			LD		A,WAIT_TIME1
			HSUBIA	D'20'
			SNZB	C
			JP		TRANSING1
			CLR		WAIT_TIME1
END_TRANSING:
			CLR     DSP_BUF
			SETB	I2C_CLK
			LDIA	B'00001000'
			ORR		P0CH
			RET
;****************************************************
I2C_START:						; 数据传输开始
			CLRB		I2C_CLK
			SETB		I2C_SDA
			SETB		I2C_CLK
			NOP
			NOP
			NOP
			NOP
			CLRB		I2C_SDA
			NOP
			NOP
			CLRB		I2C_CLK
			RET
;--------------------------------------------------
I2C_STOP:						; 数据传输结束
			CLRB		I2C_CLK
			CLRB		I2C_SDA
			SETB		I2C_CLK
			NOP
			NOP
			NOP
			NOP
			SETB		I2C_SDA
			NOP
			NOP
			CLRB		I2C_CLK
			RET
;**************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         		  按键扫描子程序                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;**************************************************
SCANKEY:	
			LD		A,DISP_NUM
			XORIA	D'6'
			SNZB	Z
			JP		ENDKEY
			LDIA	B'11000000'
			ANDR	P1CL
			LDIA	B'00000000'
			ANDR	P1CH
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
			NOP
			SNZB	SW_POWER
			SETB	KEY_VALUE,0
			SNZB	SW_SPEED
			SETB	KEY_VALUE,1
			SNZB	SW_UP
			SETB	KEY_VALUE,4
			SNZB	SW_DOWN
			SETB	KEY_VALUE,5
			SNZB	SW_TIMER
			SETB	KEY_VALUE,3
			SNZB	SW_OSC
			SETB	KEY_VALUE,6
			NOP
			NOP		
KEY_JUD:
			LD		A,KEY_VALUE
			XORA	KEY_VALUE0
			SZB		Z
			JP		KEY_JUD1
			CLR     KEY_DELAY
			LD		A,KEY_VALUE
			LD		KEY_VALUE0,A
KEY_JUD1:
			LD   	A,KEY_DELAY
			HSUBIA  D'5'
			SZB  	C
			JP      KEY_JUD2
			INCR    KEY_DELAY
			JP      ENDKEY
KEY_JUD2:
			LD		A,KEY_VALUE
			HSUBIA  D'1'
			SZB  	C
			JP      ON_KEY
NO_KEY:
			CLRB	F_ONKEY
			CLR     KEY_TIMER
			CLRB	F_KEY_MODE
			CLRB	F_TEMP_FIRST
			JP      ENDKEY
ON_KEY:
			SZB  	F_PROTECT
			JP      ENDKEY
			SZB  	F_ONKEY
			JP      OLDKEY
			SETB  	F_ONKEY
			LD		A,KEY_VALUE
			XORIA	01H
			SZB		Z
			JP    	KEY_ONOFF
			LD		A,KEY_VALUE
			XORIA	02H
			SZB		Z
			JP    	KEY_SPEED
			LD		A,KEY_VALUE
			XORIA	10H
			SZB		Z
			JP    	KEY_UP
			LD		A,KEY_VALUE
			XORIA	20H
			SZB		Z
			JP    	KEY_DOWN
			LD		A,KEY_VALUE
			XORIA	08H
			SZB		Z
			JP    	KEY_TIME
			LD		A,KEY_VALUE
			XORIA	40H
			SZB		Z
			JP    	KEY_OSC
			JP     	ENDKEY
OLDKEY:
			SNZB  	F_ONOFF
			JP      ENDKEY0
			LD   	A,KEY_TIMER
			HSUBIA  D'250'
			SNZB  	C
			INCR   	KEY_TIMER
			LD		A,KEY_VALUE
			XORIA	01H
			SZB		Z
			JP    	KEY_PROTECT
			LD		A,KEY_VALUE
			XORIA	10H
			SZB		Z
			JP    	KEY_F_UP
			LD		A,KEY_VALUE
			XORIA	20H
			SZB		Z
			JP    	KEY_F_DOWN
			LD		A,KEY_VALUE
			XORIA	30H
			SZB		Z
			JP    	KEY_TEMP
			LD		A,KEY_VALUE
			XORIA	08H
			SZB		Z
			JP		KEY_F_TIME
ENDKEY0:
			CLR     KEY_TIMER
			JP      ENDKEY
;**************************************************
KEY_ONOFF:
			SZB		F_NOPOWER
			JP      ENDKEY;KBUZ;
			SZB		F_POWER_LOW
			JP		KBUZ;ENDKEY
			SZB  	F_ONOFF
			JP		KEY_OFF
KEY_ON:
			CLRB  	F_TEMP_130F
			CLRB  	F_TIMER_OFF
			CLRB  	F_TEMP_HOLD
			CLR		HEAT_WORK
			SETB  	F_ONOFF
			CLRB  	F_AUTO
			CLRB  	F_OSC
			CLR     T_HOUR
			CLR     T_HEAT_ON
			CLR     T_SEC0
			CLR     HEAT_SETUP
			JP      ENDK1
KEY_OFF:
			CLRB  	F_ONOFF
			CLRB	F_AUTO
			CLRB	F_TEMP_SET
			CLRB	F_TIMER_SET
			CLR     T_HOUR
ENDK1:
			JP      KBUZ
        
KEY_PROTECT:
			SNZB  	F_ONOFF
			JP      ENDKEY
			LD   	A,T_SEC0
			XORIA   D'16'
			SNZB  	Z
			JP      ENDKEY
			INCR	T_SEC0
			SETB  	F_TEMP_130F
			JP      KBUZ
;**************************************************
KEY_OSC:
			SNZB	F_ONOFF
			JP      ENDKEY
			SNZB	F_OSC
			JP		KEY_OSC1
			CLRB	F_OSC
			JP		KBUZ
KEY_OSC1:
			SETB	F_OSC
			JP		KBUZ
;--------------------------------------------------
KEY_SPEED:
			SNZB  	F_ONOFF
			JP      ENDKEY
			CLRB	F_TEMP_SET
			CLRB	F_TIMER_SET
			SZB  	F_AUTO
			JP      KEY_SPEED0
			INCR   	HEAT_SETUP
			LD  	A,HEAT_SETUP		;0=HIG  1=LOW
			HSUBIA  D'2'
			SZB  	C
			CLR     HEAT_SETUP
			CLR		T_HEAT_ON
			JP      KBUZ
KEY_SPEED0:
			CLRB  	F_AUTO
			CLRB  	F_TEMP_HOLD
			CLR		HEAT_SETUP
			LD		A,HEAT_WORK
			HSUBIA	D'1'
			SZB		C
			CLR		T_HEAT_ON
			JP      KBUZ
;***********************************************
KEY_UP:
			SNZB  	F_ONOFF
			JP      ENDKEY
			SZB  	HEAT_SETUP,0		;自动模式+
			CLR     HEAT_SETUP
			SETB  	F_AUTO
			SZB		F_TEMP_SET
			JP      KEY21
KEY2_AUTO:
			SETB	F_TEMP_SET
			SETB	F_TEMP_FIRST
			CLRB	F_TIMER_SET
			JP      ENDK2
KEY21:
			SZB  	F_TEMP_MODE
			JP      KEY22
			LD   	A,T_SETUP_F
			HSUBIA  D'90'
			SZB  	C
			JP      ENDK2_0
			INCR    T_SETUP_F
			JP      ENDK2
KEY22:
			LD   	A,T_SETUP_C
			HSUBIA  D'32'
			SZB  	C
			JP      ENDK2_0
			INCR    T_SETUP_C
			JP		ENDK2
;------------------------------------------------
ENDK2_0:
			SNZB	F_FAST
			JP		ENDK2
			CLRB	F_FAST
			JP		ENDKEY
ENDK2:
			SETB	F_CHANGE
			CLRB	F_TEMP_HOLD
			LD		A,HEAT_WORK
			LD		HEAT_WORK_BUF,A
			CLR     LIGHON
			CLR     T250MS_TIMER1
			CLR     T_FLASH
			CLRB	F_FAST
			JP      KBUZ
;------------------------------------------------
KEY_F_UP:								;快加温度
			SNZB  	F_ONOFF
			JP      ENDKEY
			SZB		F_KEY_MODE
			JP		ENDKEY
			LD   	A,KEY_TIMER
			HSUBIA  D'62'
			SNZB  	C
			JP      ENDKEY
			CLR     KEY_TIMER
			SZB		F_TEMP_FIRST
			JP		ENDKEY
KEY_UP_REMOTE:
			SNZB	F_TEMP_SET
			JP		ENDKEY
			SETB	F_FAST
			JP		KEY21			
;*************************************************
KEY_DOWN:
        	SNZB  	F_ONOFF
        	JP      ENDKEY
ONKEY3:
			SZB  	HEAT_SETUP,0		;自动模式-
        	CLR     HEAT_SETUP
        	SETB  	F_AUTO
        	SNZB	F_TEMP_SET
        	JP      KEY2_AUTO
KEY31:
        	SZB  	F_TEMP_MODE
        	JP      KEY32
        	LD   	A,T_SETUP_F
        	HSUBIA  D'40'
        	SNZB  	C
        	JP      ENDK3_0
        	DECR   	T_SETUP_F
        	JP      ENDK3
KEY32:
         	LD   	A,T_SETUP_C
        	HSUBIA  D'5'
        	SNZB  	C
        	JP      ENDK3_0
        	DECR   	T_SETUP_C
			JP		ENDK3
;-------------------------------------------------
ENDK3_0:
			SNZB	F_FAST
			JP		ENDK3
			CLRB	F_FAST
			JP		ENDKEY
ENDK3:
			SETB	F_CHANGE
			CLRB	F_TEMP_HOLD
			LD		A,HEAT_WORK
			LD		HEAT_WORK_BUF,A
        	CLR     LIGHON
        	CLR     T250MS_TIMER1
        	CLR     T_FLASH
			CLRB	F_FAST
        	JP      KBUZ
;--------------------------------------------------
KEY_F_DOWN:								;快减温度
        	SNZB  	F_ONOFF
        	JP      ENDKEY
			SZB		F_KEY_MODE
			JP		ENDKEY
       	 	LD   	A,KEY_TIMER
        	HSUBIA	D'62'
        	SNZB  	C
        	JP      ENDKEY
        	CLR     KEY_TIMER
			SZB		F_TEMP_FIRST
			JP		ENDKEY
KEY_DOWN_REMOTE:
			SNZB	F_TEMP_SET
			JP		ENDKEY
        	SETB  	F_FAST
			JP		KEY31
;**************************************************
KEY_TIME:					  			;定时
        	SNZB  	F_ONOFF
        	JP      ENDKEY
KEY40:
			SZB		F_TIMER_SET
			JP		KEY41
			SETB	F_TIMER_SET
			CLRB	F_TEMP_SET
			SZB		F_TIMER_OFF
			JP		END_KEY_TIME
KEY41:
			SETB	F_TIMER_OFF
			INCR	T_HOUR
			LD		A,T_HOUR
			HSUBIA	D'9'
			SNZB	C
			JP		KEY42
			CLR		T_HOUR
			CLRB	F_TIMER_OFF
KEY42:
			CLR		T_SEC
			CLR		T_MIN
END_KEY_TIME:
        	CLR     LIGHON
        	CLR     T250MS_TIMER1
        	CLR     T_FLASH        
        	JP      KBUZ
;-------------------------------------------------
KEY_F_TIME:
        	SNZB  	F_ONOFF
        	JP      ENDKEY
        	LD   	A,KEY_TIMER
        	HSUBIA	D'62'
        	SNZB  	C
        	JP      ENDKEY
        	CLR     KEY_TIMER
KEY_TIME_REMOTE:
			LD		A,T_HOUR
			HSUBIA	D'8'
			SZB		C
			JP		ENDKEY
			SZB		F_TIMER_SET
			JP		F_KEY41
F_KEY40:
			;SETB	F_TIMER_SET
			;CLRB	F_TEMP_SET
			;SZB		F_TIMER_OFF
			;JP		END_KEY_TIME
			JP		ENDKEY
F_KEY41:
			LD		A,T_HOUR
			HSUBIA	D'8'
			SZB		C
			JP		ENDKEY
			INCR	T_HOUR
			SETB	F_TIMER_OFF
			JP		KEY42
;*************************************************
KEY_TEMP:						;华氏度和摄氏度转换
        	SNZB  	F_ONOFF
        	JP      ENDKEY
        	LD   	A,KEY_TIMER
        	XORIA	D'124'
        	SNZB  	Z
        	JP      ENDKEY
        	SZB  	F_TEMP_MODE
        	JP      OFF_TEMP
ON_TEMP:
        	SETB   	F_TEMP_MODE
        	JP      END_KEY_TEMP
OFF_TEMP:
        	CLRB  	F_TEMP_MODE
END_KEY_TEMP:
			SETB	F_KEY_MODE
        	JP      KBUZ
;*************************************************
KBUZ:
        	CLR     T_BUZ
        	SETB  	F_BUZ
ENDKEY:
			RET	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                ;
;                A/D电压参数采样处理　           ;
;                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;*************************************************
ADC_GET:
			SETB	SYS_GEN,ADC_EN
			NOP
			NOP	
			LDIA	B'01100100'
			LD		ADCON,A
			NOP
			NOP
			SETB	ADCON,CONV
			NOP	
			NOP	
			CLRB	ADCON,CONV
SCANAD_WAIT1:
			SNZB	ADCON,EOC
			JP		SCANAD_WAIT1
			LD      A,ADDATA
			ADDR    NTC_RAM1
			LDIA    D'0'
			ADDCR   NTC_RAM2
DATA_PROC:
			INCR   	ADC_NUM
			LD		A,ADC_NUM
			XORIA	D'0'
			SNZB	Z
			JP      END_ADC_GET
			LD   	A,NTC_RAM2
			ADDR    NTC_RAM
			RRCR    NTC_RAM
			CLR     NTC_RAM1
			CLR     NTC_RAM2
END_ADC_GET:
			RET
;******************************************************
;******************************************************
SENSOR_SUB:
			LD		A,DISP_NUM
			XORIA	D'2'
			SNZB	Z
			JP		END_SENSOR_SUB
TEMP_PROC:
			LD   	A,NTC_RAM
			HSUBIA  D'205'
			SZB  	C
			JP      OVER_140F
			LD		A,NTC_RAM
			HSUBIA	D'58'
			SZB		C
			JP		TEMP_PROC1
LOWER_32F:
			LDIA	D'32'
			LD		T_ROOM_BUF,A
			JP		TEMP_PROC2
OVER_140F:
			LDIA	D'140'
			LD   	T_ROOM_BUF,A
			JP		TEMP_PROC2
TEMP_PROC1:
			LD		A,NTC_RAM			;查华氏度表.
			HSUBIA	D'58'
			LD		TABLE_SPL,A
			LDIA	10H
			ADDR	TABLE_SPL
			LDIA    07H
			LD		TABLE_SPH,A
			TABLEA
			LD      T_ROOM_BUF,A
			DECR	T_ROOM_BUF			;温度补偿
			DECR	T_ROOM_BUF
TEMP_PROC2:
			INCR	OVER_CNT1
			SNZB	F_ADC_FIRST
			JP		TEMP_PROC20
			LD		A,T_ROOM_F
			HSUBIA	D'33'
			SZB		C
			JP		TEMP_PROC21
TEMP_PROC20:							; 第一次检测值
			LD		A,T_ROOM_BUF
			LD		T_ROOM_F,A
			CLR		OVER_CNT1
			JP		TEMP_PROC3
TEMP_PROC21:
			LD		A,T_ROOM_BUF
			HSUBA	T_ROOM_F
			SNZB	C
			JP		TEMP_PROC23
			LD		A,T_ROOM_F
			HSUBA	T_ROOM_BUF
			SNZB	C
			JP		TEMP_PROC22
			CLR		OVER_CNT1			; 温度相等
			JP		TEMP_PROC3
TEMP_PROC22:							; 温度升高
			LD		A,OVER_CNT1
			HSUBIA	D'20'
			SNZB	C
			JP		TEMP_PROC3
			INCR	T_ROOM_F
			CLR		OVER_CNT1
			JP		TEMP_PROC3
TEMP_PROC23:							; 温度降低
			LD		A,OVER_CNT1
			HSUBIA	D'20'
			SNZB	C
			JP		TEMP_PROC3
			DECR	T_ROOM_F
			CLR		OVER_CNT1
			JP		TEMP_PROC3
TEMP_PROC3:								; 温度锁住?
			SZB		F_TEMP_HOLD
			JP		TEMP_PROC4
			LD		A,T_ROOM_F
			LD		T_ROOM_REAL,A
TEMP_PROC4:
;----------------------------------------------
TEMP_OVER_JUD:							; 高温判断
			LD   	A,T_ROOM_F
			SNZB	F_TEMP_130F
			JP		T_OVER100F
T_OVER130F:								;高温,超130F
			HSUBIA  D'130'
			SNZB  	C
			JP		TEMP_NO_OVER
			JP      TEMP_ERR
T_OVER100F:								;高温,超100F
			HSUBIA  D'100'
			SNZB  	C
			JP      TEMP_NO_OVER
TEMP_ERR:
			INCR    OVER_CNT2
			SNZB	F_ONOFF
			JP		TEMP_ERR2
TEMP_ERR1:
			LD   	A,OVER_CNT2
			HSUBIA  D'60'
			SZB  	C
			SETB	F_PROTECT
			JP		END_TEMP_OVER_JUD
TEMP_ERR2:
			LD   	A,OVER_CNT2
			HSUBIA  D'150'
			SZB  	C
			SETB  	F_PROTECT
			JP		END_TEMP_OVER_JUD
TEMP_NO_OVER:
			CLR     OVER_CNT2
END_TEMP_OVER_JUD:
;----------------------------------------------
TEMP_CHANGE:						; 温度转换
			SZB  	F_TEMP_MODE
			JP      TEMP_CH2
TEMP_CH1:							; F
TEMP_CH11:							; AUTO
			SNZB	F_CHANGE
			JP		TEMP_CH110
			CLRB	F_CHANGE		; SETUP F-->C
			LD		A,T_SETUP_F
			HSUBIA	D'32'
			LD		TABLE_SPL,A
			LDIA	090H
			ADDR	TABLE_SPL
			LDIA    06H
			LD		TABLE_SPH,A
			TABLEA
			LD		T_SETUP_C,A
TEMP_CH110:
			LD		A,T_SETUP_F
			LD		T_SETUP_LOW,A
			LD   	T_SETUP_MAX,A
			LDIA    D'2'
			ADDR    T_SETUP_MAX
			JP		TEMP_CH13
;----------------------------------------------
TEMP_CH13:
			LD		A,T_ROOM_REAL
			LD		T_ROOM_DISP,A
			JP		TEMP_CH3
;----------------------------------------------
TEMP_CH2:								; C
TEMP_CH21:								; AUTO
			SNZB	F_CHANGE
			JP		TEMP_CH210
			CLRB	F_CHANGE			; SETUP C-->F
			LD		A,T_SETUP_C
			LD		TABLE_SPL,A
			LDIA	60H
			ADDR	TABLE_SPL
			LDIA	06H
			LD		TABLE_SPH,A
			TABLEA
			LD		T_SETUP_F,A
TEMP_CH210:
			LD		A,T_SETUP_C
			LD		T_SETUP_LOW,A
			LD		T_SETUP_MAX,A
			LDIA	D'1'
			ADDR	T_SETUP_MAX
			JP		TEMP_CH23
;-----------------------------------------------------
TEMP_CH23:
			LD		A,T_ROOM_REAL		; F-->C
			HSUBIA	D'32'
			LD		TABLE_SPL,A
			LDIA	090H
			ADDR	TABLE_SPL
			LDIA	06H
			LD		TABLE_SPH,A
			TABLEA
			LD		T_ROOM_DISP,A
TEMP_CH3:
;-----------------------------------------------------
TEMP_JUD:								; 工作温度判断
			SNZB  	F_ONOFF
			JP		END_TEMP_JUD
			SZB  	F_AUTO
			JP		TEMP_JUD_AUTO
TEMP_JUD_NOR:
			CLRB	F_TEMP_HOLD
			LD		A,HEAT_SETUP
			LD		HEAT_WORK,A
			LD		HEAT_WORK_BUF,A
			JP      END_TEMP_JUD
TEMP_JUD_AUTO:
			LD		A,T_ROOM_DISP
			HSUBA	T_SETUP_LOW
			SZB		C
			JP		TEMP_JUD_AUTO2
TEMP_JUD_AUTO1:							; <T_SETUP
			CLR		HEAT_WORK_BUF
			LD		A,HEAT_WORK
			HSUBIA	D'1'
			SNZB	C
			JP		END_TEMP_JUD_AUTO
			CLR		HEAT_WORK
			CLR		T_HEAT_ON
			JP		END_TEMP_JUD_AUTO
TEMP_JUD_AUTO2:
			LD		A,T_ROOM_DISP
			HSUBA	T_SETUP_MAX
			SNZB	C
			JP		TEMP_JUD_AUTO3
			LDIA	D'2'				; >T_SETUP+3F
			LD		HEAT_WORK_BUF,A
			LD		A,HEAT_WORK
			HSUBIA	D'2'
			SZB		C
			JP		END_TEMP_JUD_AUTO
			LDIA	D'2'
			LD		HEAT_WORK,A
			SETB	F_TEMP_HOLD
			CLR		T_TEMP_HOLD0
			CLR		T_TEMP_HOLD
			JP		END_TEMP_JUD_AUTO
TEMP_JUD_AUTO3:							; >=T_SETUP&<=T_SETUP+3F
			LDIA	D'1'
			LD		HEAT_WORK_BUF,A
			LD		A,HEAT_WORK
			XORIA	D'1'
			SZB		Z
			JP		END_TEMP_JUD_AUTO
			LDIA	D'1'
			LD		HEAT_WORK,A
			CLR		T_HEAT_ON
			JP		END_TEMP_JUD_AUTO
END_TEMP_JUD_AUTO:						; OVER 4min+15s解锁
			LD		A,T_TEMP_HOLD
			HSUBIA	D'254'
			SZB		C
			CLRB	F_TEMP_HOLD
;------------------------------------------------------
END_TEMP_JUD:
;------------------------------------------------------
END_SENSOR_SUB:
         	RET
;******************************************************
;******************************************************
CALL_TABLE:
			LD   	A,LED_BUF2
			HSUBIA	D'100'
			SZB  	C
			JP      CALL_TABLE3			;传入的数大于100，跳到CALL_TABLE3
			CLR     LED_BUF1
CALL_TABLE1:
			LD   	A,LED_BUF2
			HSUBIA  D'10'
			SNZB  	C
			JP      CALL_TABLE2			;传入的数小于10，跳到CALL_TABLE2
			LD   	A,LED_BUF2
			HSUBIA  D'10'				;10-100的数先减10再传回给BUF2，跳回CALL_TABLE1
			LD   	LED_BUF2,A
			INCR   	LED_BUF1
			JP      CALL_TABLE1
CALL_TABLE2:                
			LD	A,LED_BUF1
			LD	TABLE_SPL,A
;			LDIA	00H
;			ADDR	TABLE_SPL
			LDIA    07H
			LD	TABLE_SPH,A
			TABLEA
            LD      LED_BUF1,A

			LD	A,LED_BUF2
			LD	TABLE_SPL,A
;			LDIA	00H
;			ADDR	TABLE_SPL
			LDIA    07H
			LD	TABLE_SPH,A
			TABLEA
            LD      LED_BUF2,A
			RET
;-----------------------------------------------------
CALL_TABLE3:
        	LDIA    0F6H
        	LD   	LED_BUF1,A
        	LD   	LED_BUF2,A
			RET
;*****************************************************
;*****************************************************
		ORG     0660H
C_CHANGE_F:
		DW	     D'32'	      ;0
		DW	     D'34'	      ;1
		DW	     D'36'	      ;2
		DW	     D'37'	      ;3
		DW	     D'39'	      ;4				
		DW	     D'40'	      ;5
		DW	     D'43'	      ;6
		DW	     D'45'	      ;7
		DW	     D'46'	      ;8
		DW	     D'48'	      ;9
		DW	     D'50'	      ;10
		DW	     D'52'	      ;11
		DW	     D'54'	      ;12
		DW	     D'55'	      ;13
		DW	     D'57'	      ;14
		DW	     D'59'	      ;15
		DW	     D'61'	      ;16
		DW	     D'63'	      ;17
		DW	     D'64'	      ;18
		DW	     D'66'	      ;19
		DW	     D'68'	      ;20
		DW	     D'70'	      ;21
		DW	     D'72'	      ;22
		DW	     D'73'	      ;23
		DW	     D'75'	      ;24
		DW	     D'77'	      ;25
		DW	     D'79'	      ;26
		DW	     D'81'	      ;27
		DW	     D'82'	      ;28
		DW	     D'84'	      ;29
		DW	     D'86'	      ;30
		DW	     D'88'	      ;31
		DW	     D'90'	      ;32
		DW	     D'91'	      ;33
		DW	     D'93'	      ;34
		DW	     D'95'	      ;35
		DW	     D'97'	      ;36
		DW	     D'99'	      ;37
		DW	     D'99'	      ;38
		DW	     D'99'	      ;39
;--------------------------------------------
                ORG     0690H
F_CHANGE_C:
		DW	     D'0'	      ;32
		DW	     D'1'	      ;33
		DW	     D'1'	      ;34
		DW	     D'2'	      ;35
		DW	     D'2'	      ;36
		DW	     D'3'	      ;37
		DW	     D'3'	      ;38
		DW	     D'4' 	      ;39	
		DW	     D'4' 	      ;40
		DW	     D'5' 	      ;41
		DW	     D'6' 	      ;42
		DW	     D'6' 	      ;43
		DW	     D'7' 	      ;44
		DW	     D'7' 	      ;45
		DW	     D'8' 	      ;46
		DW	     D'8' 	      ;47
		DW	     D'9' 	      ;48
		DW	     D'9' 	      ;49
		DW	     D'10'	      ;50
		DW	     D'11'	      ;51
		DW	     D'11'	      ;52
		DW	     D'12'	      ;53
		DW	     D'12'	      ;54
		DW	     D'13'	      ;55
		DW	     D'13'	      ;56
		DW	     D'14'	      ;57
		DW	     D'14'	      ;58
		DW	     D'15'	      ;59
		DW	     D'16'	      ;60
		DW	     D'16'	      ;61
		DW	     D'17'	      ;62
		DW	     D'17'	      ;63
		DW	     D'18'	      ;64
		DW	     D'18'	      ;65
		DW	     D'19'	      ;66
		DW	     D'19'	      ;67
		DW	     D'20'	      ;68
		DW	     D'21'	      ;69
		DW	     D'21'	      ;70
		DW	     D'22'	      ;71
		DW	     D'22'	      ;72
		DW	     D'23'	      ;73
		DW	     D'23'	      ;74
		DW	     D'24'	      ;75
		DW	     D'24'	      ;76
		DW	     D'25'	      ;77
		DW	     D'26'	      ;78
		DW	     D'26'	      ;79
		DW	     D'27'	      ;80
		DW	     D'27'	      ;81
		DW	     D'28'	      ;82
		DW	     D'28'	      ;83
		DW	     D'29'	      ;84
		DW	     D'29'	      ;85
		DW	     D'30'	      ;86
		DW	     D'31'	      ;87
		DW	     D'31'	      ;88
		DW	     D'32'	      ;89
		DW	     D'32'	      ;90
		DW	     D'33'	      ;91
		DW	     D'33'	      ;92
		DW	     D'34'	      ;93
		DW	     D'34'	      ;94
		DW	     D'35'	      ;95
		DW	     D'36'	      ;96
		DW	     D'36'	      ;97
		DW	     D'37'	      ;98
		DW	     D'37'	      ;99
		DW	     D'38'	      ;100
		DW	     D'38'	      ;101
		DW	     D'39'	      ;102
		DW	     D'39'	      ;103
		DW	     D'39'	;40      ;104
		DW	     D'39'	;41      ;105
		DW	     D'39'	;41      ;106
		DW	     D'39'	;42      ;107
		DW	     D'39'	;42      ;108
		DW	     D'39'	;43      ;109
		DW	     D'39'	;43      ;110
		DW	     D'39'	;44      ;111
		DW	     D'39'	;44      ;112
		DW	     D'39'	;45      ;113
		DW	     D'39'	;46      ;114
		DW	     D'39'	;46      ;115
		DW	     D'39'	;47      ;116
		DW	     D'39'	;47      ;117
		DW	     D'39'	;48      ;118
		DW	     D'39'	;48      ;119
		DW	     D'39'	;49      ;120
		DW	     D'39'	;49      ;121
		DW	     D'39'	;50      ;122
		DW	     D'39'	;51      ;123
		DW	     D'39'	;51      ;124
		DW	     D'39'	;52      ;125
		DW	     D'39'	;52      ;126
		DW	     D'39'	;53      ;127
		DW	     D'39'	;53      ;128
		DW	     D'39'	;54      ;129
		DW	     D'39'	;54      ;130
		DW	     D'39'	;55      ;131
		DW	     D'39'	;56      ;132
		DW	     D'39'	;56      ;133
		DW	     D'39'	;57      ;134
		DW	     D'39'	;57      ;135
		DW	     D'39'	;58      ;136
		DW	     D'39'	;58      ;137
		DW	     D'39'	;59      ;138
		DW	     D'39'	;59      ;139
		DW	     D'39'	;60      ;140
                ORG     0700H
DISP_TABLE:
		DW	0FCH	; 0
		DW	060H	; 1
		DW	0DAH	; 2
		DW	0F2H	; 3
		DW	066H	; 4
		DW	0B6H	; 5
		DW	0BEH	; 6
		DW	0E0H	; 7
		DW	0FEH	; 8
		DW	0F6H	; 9
		DW	0EEH	; A
		DW	03EH	; b
		DW	09CH	; C
		DW	07AH	; d
		DW	09EH	; E
		DW	08EH	; F
;----------------------------------------------
                ORG     0710H		
TABLE_F:					;华氏度 R=10K
		DW	D'32'		;58
		DW	D'32'		;59  
		DW	D'32'		;60
		DW	D'32'		;61
		DW	D'33'		;62
		DW	D'33'		;63
		DW	D'34'		;64
		DW	D'35'		;65
		DW	D'36'		;66
		DW	D'36'		;67
		DW	D'37'		;68
		DW	D'38'		;69
		DW	D'39'		;70
		DW	D'39'		;71
		DW	D'40'		;72
		DW	D'41'		;73
		DW	D'41'		;74
		DW	D'42'		;75
		DW	D'43'		;76
		DW	D'44'		;77
		DW	D'45'		;78
		DW	D'45'		;79
		DW	D'46'		;80
		DW	D'47'		;81
		DW	D'47'		;82
		DW	D'48'		;83
		DW	D'48'		;84
		DW	D'49'		;85
		DW	D'50'		;86
		DW	D'51'		;87
		DW	D'51'		;88
		DW	D'52'		;89
		DW	D'52'		;90
		DW	D'53'		;91
		DW	D'54'		;92
		DW	D'54'		;93
		DW	D'55'		;94
		DW	D'56'		;95
		DW	D'56'		;96
		DW	D'57'		;97
		DW	D'58'		;98
		DW	D'58'		;99
		DW	D'59'		;100
		DW	D'59'		;101
		DW	D'60'		;102
		DW	D'61'		;103
		DW	D'62'		;104
		DW	D'63'		;105
		DW	D'63'		;106
		DW	D'64'		;107
		DW	D'64'		;108
		DW	D'65'		;109
		DW	D'65'		;110
		DW	D'66'		;111
		DW	D'66'		;112
		DW	D'67'		;113
		DW	D'68'		;114
		DW	D'69'		;115
		DW	D'69'		;116
		DW	D'70'		;117
		DW	D'71'		;118
		DW	D'72'		;119
		DW	D'72'		;120
		DW	D'73'		;121
		DW	D'73'		;122
		DW	D'74'		;123
		DW	D'74'		;124
		DW	D'75'		;125
		DW	D'75'		;126
		DW	D'76'		;127
		DW	D'77'		;128
		DW	D'77'		;129
		DW	D'78'		;130
		DW	D'79'		;131
		DW	D'80'		;132
		DW	D'80'		;133
		DW	D'81'		;134
		DW	D'82'		;135
		DW	D'82'		;136
		DW	D'83'		;137
		DW	D'83'		;138
		DW	D'84'		;139
		DW	D'85'		;140
		DW	D'85'		;141
		DW	D'86'		;142
		DW	D'87'		;143
		DW	D'88'		;144
		DW	D'89'		;145
		DW	D'89'		;145
		DW	D'90'		;147
		DW	D'90'		;148
		DW	D'91'		;149
		DW	D'91'		;150
		DW	D'92'		;151
		DW	D'92'		;152
		DW	D'93'		;153
		DW	D'94'		;154
		DW	D'95'		;155
		DW	D'96'		;156
		DW	D'97'		;157
		DW	D'98'		;158
		DW	D'98'		;159
		DW	D'99'		;160
		DW	D'99'		;161
		DW	D'100'		;162
		DW	D'101'		;163
		DW	D'101'		;165
		DW	D'102'		;165
		DW	D'103'		;166
		DW	D'104'		;167
		DW	D'105'		;168
		DW	D'106'		;169
		DW	D'106'		;170
		DW	D'107'		;171
		DW	D'108'		;172
		DW	D'109'		;173
		DW	D'109'		;174
		DW	D'110'		;175
		DW	D'111'		;176
		DW	D'112'		;177
		DW	D'113'		;178
		DW	D'114'		;179
		DW	D'115'		;180
		DW	D'116'		;181
		DW	D'117'		;182
		DW	D'117'		;183
		DW	D'118'		;184
		DW	D'119'		;185
		DW	D'120'		;186
		DW	D'121'		;187
		DW	D'122'		;188
		DW	D'123'		;189
		DW	D'124'		;190
		DW	D'125'		;191
		DW	D'126'		;192
		DW	D'127'		;193
		DW	D'127'		;194
		DW	D'128'		;195
		DW	D'129'		;196
		DW	D'131'		;197
		DW	D'132'		;198
		DW	D'133'		;199 
		DW	D'134'		;200
		DW	D'135'		;201 
		DW	D'136'		;202
		DW	D'137'		;203
		DW	D'138'		;204
		DW	D'140'		;205
		DW	D'140'		;206
		DW	D'140'		;207

   	 	JP	RESET
		END
