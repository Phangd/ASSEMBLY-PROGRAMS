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
;******************************************************************;
		OUT_LOW			EQU	P0,0
		OUT_HIG			EQU	P0,1
		OUT_OSC			EQU	P1,4
		OUT_FAN			EQU	P1,5
		OUT_BUZ			EQU	P2,2
		
		SW_POWER		EQU	P1,1
		SW_TIMER		EQU	P1,2
		SW_TEMP			EQU	P1,0
		SW_OSC			EQU	P0,3
		
		ZERO_VOLT		EQU	P0,2
		NTC				EQU	P1,3
		OUT_SDA			EQU	P0,6
		OUT_SCL			EQU	P0,7
		REMOTE			EQU	P2,1
;******************************************************************;
		ACC_BUF			EQU	30H
		STATUS_BUF      EQU	31H
		T1MS_TIMER      EQU	32H
		LEDTR1			EQU	33H
		LEDTR2			EQU	34H
		FLAG1			EQU	35H
		FLAG2           EQU	36H
		FLAG3           EQU	37H
		FLAG4           EQU 38H
		DISP_NUM        EQU	39H
		T100MS_TIMER    EQU	3AH
		T250MS_TIMER    EQU	3BH
		T_HOUR          EQU	3CH
		T_MIN           EQU	3DH
		T_SEC           EQU	3EH
		T_SEC0          EQU	3FH
		T_HEAT_ON       EQU	40H
		T_FAN_DELAY     EQU	41H
		T_TEMP_HOLD		EQU	42H
		T_TEMP_HOLD0    EQU	43H
		LIGHON          EQU	44H
		KEY_VALUE       EQU	45H
		KEY_VALUE1      EQU	46H
		KEY_DELAY       EQU	47H
		T_OLDKEY        EQU	48H
		HEAT_WORK       EQU	49H
		HEAT_WORK_BUF	EQU	4AH
		HEAT_SETUP      EQU	4BH
		TEMP_SETUP      EQU	4CH
		T_BUZ			EQU	4DH
		DSP_BUF         EQU	4EH
		BITNUM          EQU	4FH
		WAIT_TIME1      EQU	50H
		NTC_RAM         EQU	51H
		NTC_RAM1		EQU	52H
		NTC_RAM2        EQU	53H
		ADC_NUM         EQU	54H
		T_ROOM_BUF      EQU	55H
		T_ROOM_F        EQU	56H
		OVER_CNT1       EQU	57H
		OVER_CNT2       EQU	58H
		T_SETUP_LOW     EQU	59H
		T_SETUP_MAX     EQU	5AH
		T_ROOM_REAL		EQU	5BH
		TN				EQU	5CH
		CODE1           EQU	5DH
		CODE2           EQU	5EH
		REMOTE_NUM      EQU	5FH
		REMOTE_BUF      EQU	60H
		REMOTE_BUF1		EQU	61H
		REMOTE_DATA1    EQU	62H
		REMOTE_DATA2    EQU	63H
		T_REMOTE1       EQU	64H
		T_REMOTE2       EQU	65H
		T_REMOTE3       EQU	66H
		T_REMOTE4		EQU	67H
		T_ZERO			EQU	68H
		T_NPULSE        EQU	69H
		T_NPULSE_BUF    EQU	6AH
		LOSE_TIME1      EQU	6BH
		LOSE_TIME2      EQU	6CH
		LOSE_TIME3      EQU	6DH
;******************************************************************;		
		F_T1MS			EQU	T1MS_TIMER,3
		;FLAG1
		F_BUZ			EQU	FLAG1,0
		F_PROTECT       EQU	FLAG1,1
		F_TEMP_130F     EQU	FLAG1,2
		F_ADC_FIRST     EQU	FLAG1,3
		F_POWER_LOW     EQU	FLAG1,4
		F_NOPOWER		EQU	FLAG1,5
		F_TEMP_FIRST    EQU	FLAG1,6
		F_TEMP_HOLD     EQU	FLAG1,7
		
		
		F_ONKEY			EQU	FLAG2,0
		F_OSC           EQU	FLAG2,1
		F_ONOFF			EQU	FLAG2,2
		F_AUTO			EQU	FLAG2,3

		;FLAG3
		F_ZERO_RISE		EQU	FLAG3,0
		F_RISE_YK		EQU	FLAG3,1	
		F_REMOTE        EQU	FLAG3,2
		F_ON_REMOTE	    EQU	FLAG3,3
;******************************************************************;
;******************************************************************;
		ORG			00H
		JP			RESET
		ORG			01H
		JP			INT_TIMER0
;******************************************************************;
;******************************************************************;
INT_TIMER0:
		LD			ACC_BUF,A
		SWAPR		ACC_BUF
		SWAPA		FLAGS
		LD			STATUS_BUF,A
		CLRB		INT_FLAG,F_T1
;---------------------------- BUZZER ------------------------------;
		SNZB		F_BUZ
		JP			BUZZ_OFF
BUZZ:			
		LDIA		04H
		XORR		P2
		JP			END_BUZZ
BUZZ_OFF:	
		CLRB		OUT_BUZ
END_BUZZ:
;--------------------------- 1MS TIMER ----------------------------;
TIMER0:
		INCR		T1MS_TIMER
END_TIMER0:
;---------------------------- REMOTE ------------------------------;
REMOTE_RECEIVE:
		LD			A,TN
		HSUBIA		D'200'
		SNZB		C
		INCR		TN
		NOP
		SNZB		REMOTE
		JP			YK_NPULSE
YK_PPULSE:		
		SZB			F_RISE_YK
		JP			END_REMOTE
		SETB		F_RISE_YK
		RLCR		CODE2
		RLCR		CODE1
		LD			A,TN
		HSUBIA		D'16'					;	16*125us=2ms	<2ms
		SZB			C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA		D'2'					;	>0.25ms
		SNZB		C
		JP	    	ERROR_REMOTE
		CLRB		CODE2,0
		LD	    	A,TN
		HSUBIA		D'7'					
		SZB 		C				
YK_BIT1:
		SETB		CODE2,0					;	>0.875ms  CODE2,0=1
YK_BITJUD:
		CLR			TN
		INCR		REMOTE_NUM
		NOP
		LD			A,REMOTE_NUM
		HSUBIA		D'12'
		SNZB		C
		JP			END_REMOTE
		LD			A,CODE1
		LD			REMOTE_DATA1,A
		LD			A,CODE2
		LD			REMOTE_DATA2,A
		SETB		F_REMOTE
		JP			END_REMOTE
YK_NPULSE:	
  	    SNZB		F_RISE_YK
		JP	    	END_REMOTE
		CLRB		F_RISE_YK			; 
		LD	    	A,TN
		HSUBIA		D'16'				; >2ms?
		SZB	    	C
		JP	    	ERROR_REMOTE
		LD	    	A,TN				
		HSUBIA		D'2'				;>0.25ms
		SNZB		C			
		JP	    	ERROR_REMOTE
		CLR	    	TN
		JP	    	END_REMOTE
ERROR_REMOTE:		
        CLR	   		TN
		CLR	   		CODE2
		CLR	   		REMOTE_NUM
END_REMOTE:
;---------------------------- VOLT ZERO ---------------------------;
ZERO_PLUSE:									;过零信号
		LD			A,T_ZERO
		HSUBIA		D'253'
		SNZB		C
		INCR		T_ZERO
		SNZB		ZERO_VOLT
		JP			NPLUSE
PPLUSE:	
		INCR		T_NPULSE_BUF
		NOP
		SZB			F_ZERO_RISE
		JP			END_ZERO_PULSE
		SETB		F_ZERO_RISE				; 上升沿
		JP			END_ZERO_PULSE
;------------------------------------------------------------------;
NPLUSE:		
		SNZB		F_ZERO_RISE
		JP			END_ZERO_PULSE
		CLRB		F_ZERO_RISE
		LD			A,T_NPULSE_BUF
		LD			T_NPULSE,A
		CLR			T_NPULSE_BUF			;下降沿处理
		CLR			T_ZERO
END_ZERO_PULSE:
;------------------------------------------------------------------;
END_INT:
		SWAPA		STATUS_BUF
		LD			FLAGS,A
		SWAPA		ACC_BUF
		RETI
;******************************************************************;
;******************************************************************;
RESET:
		CLRWDT
		CLR			SYS_GEN
		LDIA		B'00001011'
		LD			P0,A
		LDIA		B'00110111'
		LD			P1,A
		LDIA		B'00000000'
		LD			P2,A
		
		LDIA		B'00011010'				;P0,3--SW_OSC	P0,2--ZERO_IN	P0,1/0--OUT_HIG/LOW
		LD			P0CL,A
		LDIA		B'10100101'				;P0,7/6--OUT_SCL/SDA	P0,5/4--NONE
		LD			P0CH,A
		LDIA		B'01000000'				;P1,3--NTC	P1,2/1/0--SW_TIMER/POWER/TEMP
		LD			P1CL,A
		LDIA		B'00110010'				;P1,6--NONE	P1,5/4--OUT_OSC/FAN
		LD			P1CH,A
		LDIA		B'10001010'				;P2,2--BUZZ
		LD			P2C,A
		
		LDIA		B'00001011'
		LD			P0,A
		LDIA		B'00110111'
		LD			P1,A
		LDIA		B'00000000'
		LD			P2,A
		
		CLRA
		OPTION
		CLRB		TMR1C,TON
		CLRB		INT_EN,EN_T1
		CLRB		INT_FLAG,F_T1
		LDIA		B'10000001'		        	;TMR1初值=256-（TMR0的中断间隔时间*TMR0的输入时钟）
		LD			TMR1C,A	                    ;    =256-(125us*8M/4/2)
		LDIA		83H		                	;	 =256-125
		LD			TMR1,A	                    ;	 =131.(83h)
		CLRB		INT_FLAG,F_T1		
CLR_RAM:
		LDIA		2FH
		LD			MP,A		
CLR_LOOP:
		INCR		MP
		CLR			IAR
		LDIA		07FH
		SUBA		MP
		SNZB		C
		JP			CLR_LOOP		
INIT_RAM:
		SETB		INT_EN,EN_T1
		SETB		SYS_GEN,INT_GEN
		SETB		TMR1C,TON
		SETB		F_POWER_LOW
		CLRB		F_PROTECT
		LDIA		D'30'
		LD			OVER_CNT1,A
		
		LDIA    	D'135'
		LD   		T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA    	D'2'
		ADDR    	T_SETUP_MAX
		; SETB		F_BUZ
		; CLR			T_BUZ
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
MAINLOOP:
		CALL		ADC_GET
		SNZB		F_T1MS
		JP			MAINLOOP
		CLRB		F_T1MS
		CLRWDT
		CALL		TIMER_SUB			;0
		CALL		SENSOR_SUB			;3
		CALL		SCANKEY				;1
		CALL		DISPLAY				;2
		CALL		WORK_SUB			;4
		CALL		SCANREMOTE			;5
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		INCR		DISP_NUM
		NOP
		LD			A,DISP_NUM
		HSUBIA		D'6'
		SNZB		C
		JP			TIMER_SUB0
		CLR			DISP_NUM
ZERO_JUD:								; 3ms进入一次
		LD			A,T_ZERO
		HSUBIA		D'250'
		SZB			C
		JP			ZERO_JUD1;3			; OVER 32ms NO ZERO PULSE
		LD			A,T_NPULSE
		HSUBIA		D'89'				; VOLT<85V?
		SNZB		C
		JP    		ZERO_JUD2			; 大于85V,正常工作
ZERO_JUD1:	
		CLR     	LOSE_TIME2
		CLR			LOSE_TIME3
		INCR   		LOSE_TIME1			; 超时无过零信号计时
		NOP
		LD			A,LOSE_TIME1
		HSUBIA  	D'100';'125'
		SNZB	  	C
		JP			END_ZERO_JUD
		SNZB		F_POWER_ON
		SETB		F_ONKEY
		SETB		F_POWER_ON
		SZB			F_POWER_LOW
		JP			END_ZERO_JUD
		SETB		F_POWER_LOW
		JP      	END_ZERO_JUD
ZERO_JUD3:	
		CLR			LOSE_TIME1
		CLR			LOSE_TIME2
		INCR		LOSE_TIME3
		NOP	
		LD			A,LOSE_TIME3
		HSUBIA		D'5'
		SNZB		C
		JP			END_ZERO_JUD
		SETB		F_NOPOWER
		SETB  		OUT_LOW
		SETB  		OUT_HIG
		SETB  		OUT_FAN
		SETB		OUT_OSC
		JP			END_ZERO_JUD
ZERO_JUD2:	
		CLR			LOSE_TIME1
		CLR			LOSE_TIME3
		INCR		LOSE_TIME2
		NOP	
		LD			A,LOSE_TIME2
		HSUBIA		D'30'
		SNZB		C
		JP			END_ZERO_JUD
		SETB		F_POWER_ON
		CLRB		F_NOPOWER
		SNZB		F_POWER_LOW
		JP			END_ZERO_JUD
POWER_ON:									; 上电
		CLR			T_BUZ
		SETB		F_BUZ
		CLRB		F_POWER_LOW
END_ZERO_JUD:
;------------------------------------------------------------------;		
TIMER_SUB0:
		INCR		T100MS_TIMER
		NOP
		LD			A,T100MS_TIMER
		HSUBIA		D'100'
		SNZB		C
		JP			TIMER_SUB1
T_05SEC:
		CLR			T100MS_TIMER
		LD			A,T_SEC0
		HSUBIA		D'250'
		SNZB		C
		INCR		T_SEC0
		
		LD			A,T_HEAT_ON
		HSUBIA		D'250'
		SNZB		C
		INCR		T_HEAT_ON
		
		LD			A,T_FAN_DELAY
		HSUBIA		D'250'
		SNZB		C
		INCR		T_FAN_DELAY
		
		INCR		T_TEMP_HOLD0
		LD			A,T_TEMP_HOLD0
		HSUBIA		D'10'
		SNZB		C
		JP			TIMER_JUD
		CLR			T_TEMP_HOLD0
		INCR		T_TEMP_HOLD
TIMER_JUD:		
		INCR		T_SEC
		NOP
		LD			A,T_SEC
		HSUBIA		D'240'
		SNZB		C
		JP			TIMER_SUB1
		CLR			T_SEC
		INCR		T_MIN
		NOP
		HSUBIA		D'60'
		JP			TIMER_SUB1
		CLR			T_MIN
		LD			A,T_HOUR
		HSUBIA		D'1'
		SNZB		C
		JP			TIMER_SUB1
		DECR		T_HOUR
		NOP
		LD			A,T_HOUR
		HSUBIA		D'1'
		SZB			C
		JP			TIMER_SUB1
		CLRB  		F_ONOFF
		CLRB  		F_AUTO
;------------------------------------------------------------------;		
TIMER_SUB1:		
		INCR		T250MS_TIMER
		LD			A,T250MS_TIMER
		HSUBIA		D'250'
		SNZB		C
		JP			BUZ_TIMER
		CLR			T250MS_TIMER
		INCR		LIGHON
		NOP
		SETB		F_ADC_FIRST				;0.25MS前转换出来的温度值不作判断直接赋值给T_ROOM_F
END_TIMER_SUB1:
;------------------------------------------------------------------;	
BUZ_TIMER:
		SNZB		F_BUZ
		JP			END_BUZ_TIMER
		INCR		T_BUZ
		NOP
		LD			A,T_BUZ
		HSUBIA		D'160'					;响0.16s
		SZB			C
		CLRB		F_BUZ
END_BUZ_TIMER:
;------------------------------------------------------------------;		
END_TIMER_JUD:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
SCANKEY:
		LD			A,DISP_NUM
		XORIA		D'1'
		SNZB		Z
		JP			END_SCANKEY
;------------------------------------------------------------------;
		LDIA		B'00011010'				;P0,3--SW_OSC	P0,2--ZERO_IN	P0,1/0--OUT_HIG/LOW
		LD			P0CL,A
		LDIA		B'10100101'				;P0,7/6--OUT_SCL/SDA	P0,5/4--NONE
		LD			P0CH,A
		
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
		SNZB		SW_POWER
		SETB		KEY_VALUE,1
		SNZB		SW_TIMER
		SETB		KEY_VALUE,2
		SNZB		SW_TEMP
		SETB		KEY_VALUE,3
		SNZB		SW_OSC
		SETB		KEY_VALUE,4
;------------------------------------------------------------------;
KEY_JUD:
		LD			A,KEY_VALUE
		XORA		KEY_VALUE1
		SZB			Z
		JP			KEY_JUD1
		LD			A,KEY_VALUE
		LD			KEY_VALUE1,A
		CLR			KEY_DELAY
KEY_JUD1:
		LD			A,KEY_DELAY
		HSUBIA		D'5'
		SZB			C
		JP			KEY_JUD2
		INCR		KEY_DELAY
		JP			END_SCANKEY
KEY_JUD2:
		LD			A,KEY_VALUE
		HSUBIA		D'1'
		SZB			C
		JP			ON_KEY
NO_KEY:
		CLR			KEY_DELAY
		CLR			T_OLDKEY
		CLRB		F_ONKEY
		JP			END_SCANKEY
ON_KEY:
		SNZB		F_POWER_ON
		JP			END_SCANKEY
		SZB			F_PROTECT
		JP			END_SCANKEY
		SZB			F_ONKEY
		JP			OLD_KEY
		SETB		F_ONKEY
		LD			A,KEY_VALUE
		XORIA		02H
		SZB			Z
		JP			KEY_ONOFF
		
		LD			A,KEY_VALUE
		XORIA		04H
		SZB			Z
		JP			KEY_TIMER

		LD			A,KEY_VALUE
		XORIA		08H
		SZB			Z
		JP			KEY_TEMP
		
		LD			A,KEY_VALUE
		XORIA		10H
		SZB			Z
		JP			KEY_OSC
		JP			END_SCANKEY
OLD_KEY:
		SNZB		F_ONOFF
		JP			END_OLDKEY
		LD			A,T_OLDKEY
		HSUBIA		D'250'
		SNZB		C
		INCR		T_OLDKEY
		LD			A,KEY_VALUE
		XORIA		02H
		SZB			Z
		JP			KEY_PROTECT
		
		LD			A,KEY_VALUE
		XORIA		04H
		SZB			Z
		JP			KEY_F_TIMER
		
		LD			A,KEY_VALUE
		XORIA		08H
		SZB			Z
		JP			KEY_F_TEMP
END_OLDKEY:
		CLR			T_OLDKEY
		JP			END_SCANKEY
;------------------------------------------------------------------;
KEY_ONOFF:
		SZB			F_ONOFF
		JP			MODE_CHANGE
MODE_HIGH:
		SETB		F_TEMP_FIRST
		SETB		F_ONOFF
		CLRB		F_AUTO
		CLRB		F_OSC
		CLRB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		CLR			HEAT_SETUP
		CLR			TEMP_SETUP
		CLR			T_HOUR
		CLR			T_HEAT_ON
		CLR			T_SEC0
		CLR			LIGHON
		CLR			T_SETUP_LOW
		CLR			T_SETUP_MAX
		JP			KBUZ
MODE_CHANGE:
		INCR		HEAT_SETUP
		NOP
		LD			A,HEAT_SETUP
		HSUBIA		D'2'					;0-HIG 1-LOW 2-OFF
		SNZB		C
		JP			END_KEY_ONOFF
		CLRB		F_ONOFF
		CLRB		F_OSC
		CLR			T_HOUR
END_KEY_ONOFF:
		CLR			LIGHON
		CLR			T_HEAT_ON
		CLR			TEMP_SETUP
		CLR			T_SETUP_LOW
		CLR			T_SETUP_MAX
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		CLRB		F_TEMP_HOLD
		CLRB		F_AUTO
		JP			KBUZ
KEY_PROTECT:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,T_SEC0
		XORIA		D'40'
		SNZB		Z
		JP			END_SCANKEY
		INCR		T_SEC0
		LD			A,HEAT_SETUP			;防止开机后迅速再次长按电源键进入130F模式
		XORIA		01H						;130F模式只能通过长按电源键开机,并持续不松手4s才能进入
		SZB			Z
		JP			END_SCANKEY
		SETB		F_TEMP_130F
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;		
KEY_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		INCR		T_HOUR
		NOP
		LD			A,T_HOUR
		HSUBIA		D'8'
		SZB			C
		CLR			T_HOUR
		CLR			T_SEC
		CLR			T_MIN
		CLR			T250MS_TIMER
		JP			KBUZ
KEY_F_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,T_OLDKEY
		HSUBIA		D'150'
		SNZB		C
		JP			END_SCANKEY
		CLR			T_OLDKEY
END_KEY_F_TIMER:
		LD			A,T_HOUR
		HSUBIA		D'7'
		SZB			C
		JP			END_SCANKEY
		INCR		T_HOUR
		CLR			T_SEC
		CLR			T_MIN
		CLR			T250MS_TIMER
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_TEMP:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		SETB		F_AUTO
		CLR			LIGHON
MODE_JUD:
		LD			A,HEAT_SETUP
		XORIA		01H
		SZB			Z
		JP			MODE_LOW				;低档状态
		SZB			F_TEMP_FIRST			;判断切换到AUTO模式后是否第一次按下TEMP键
		JP			TEMP_FIRST
		INCR		TEMP_SETUP
		NOP
		LD			A,TEMP_SETUP
		HSUBIA		D'7'
		SZB			C
		JP			MODE_MAX
		JP			END_KEY_TEMP
TEMP_FIRST:
		LDIA		04H						;第一次按下,温度设置为75F
		LD			TEMP_SETUP,A
		CLRB		F_TEMP_FIRST
		JP			END_KEY_TEMP
MODE_LOW:
		CLR			HEAT_SETUP				;切换高档、温度设置为75F
		LDIA		04H
		LD			TEMP_SETUP,A
		JP			END_KEY_TEMP
MODE_MAX:
		CLRB		F_AUTO					
		CLRB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		CLR 		TEMP_SETUP
		CLR			T_SETUP_LOW
		CLR			T_SETUP_MAX
		JP			KBUZ
TEMP_SUB:
		SETB		F_AUTO
		CLR			LIGHON
		LD			A,HEAT_SETUP
		XORIA		01H
		SZB			Z
		JP			MODE_LOW				;低档状态
		SZB			F_TEMP_FIRST			;判断切换到AUTO模式后是否第一次按下TEMP键
		JP			TEMP_FIRST
		LD			A,TEMP_SETUP
		XORIA		00H
		SZB			Z
		JP			REDEFINE_TEMP
		LD			A,TEMP_SETUP
		HSUBIA		D'2'
		SZB			C
		DECR		TEMP_SETUP
		NOP
		JP			END_KEY_TEMP
REDEFINE_TEMP:
		LDIA		D'06'
		LD			TEMP_SETUP,A
		JP			END_KEY_TEMP
KEY_F_TEMP:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,T_OLDKEY
		HSUBIA		D'150'
		SNZB		C
		JP			END_SCANKEY
		CLR			T_OLDKEY
END_KEY_F_TEMP:
		LD			A,TEMP_SETUP
		HSUBIA		D'6'
		SZB			C
		JP			END_SCANKEY
		CLR			LIGHON
		SETB		F_AUTO
		INCR		TEMP_SETUP
END_KEY_TEMP:									;温度上下限赋值
		LD			A,TEMP_SETUP
		XORIA		D'01'					;60
		SZB			Z
		JP			TEMP_60
		LD			A,TEMP_SETUP
		XORIA		D'02'					;65
		SZB			Z
		JP			TEMP_65
		LD			A,TEMP_SETUP
		XORIA		D'03'					;70
		SZB			Z
		JP			TEMP_70
		LD			A,TEMP_SETUP
		XORIA		D'04'					;75
		SZB			Z
		JP			TEMP_75
		LD			A,TEMP_SETUP
		XORIA		D'05'					;80
		SZB			Z
		JP			TEMP_80
		LD			A,TEMP_SETUP
		XORIA		D'06'					;85
		SZB			Z
		JP			TEMP_85									
		JP			KBUZ
TEMP_60:
		LDIA		D'60'
		JP			END_KEY_TEMP0
TEMP_65:
		LDIA		D'65'
		JP			END_KEY_TEMP0
TEMP_70:
		LDIA		D'70'
		JP			END_KEY_TEMP0
TEMP_75:
		LDIA		D'75'
		JP			END_KEY_TEMP0
TEMP_80:
		LDIA		D'80'
		JP			END_KEY_TEMP0
TEMP_85:
		LDIA		D'85'		
END_KEY_TEMP0:		
		HSUBIA		D'1'
		LD			T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA		D'3'
		ADDR		T_SETUP_MAX
		LD			A,T_ROOM_F
		HSUBA		T_SETUP_MAX
		SZB			C
		JP			KBUZ		
		CLRB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		JP			KBUZ	
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_OSC:		
		SNZB		F_ONOFF
		JP			END_SCANKEY
		SNZB		F_OSC
		JP			OSC_ON
		CLRB		F_OSC
		JP			KBUZ
OSC_ON:
		SETB		F_OSC
		JP			KBUZ
;------------------------------------------------------------------;		
KBUZ:
		CLR			T_BUZ
		SETB		F_BUZ		
;------------------------------------------------------------------;		
END_SCANKEY:
		RET		
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
DISPLAY:
		LD			A,DISP_NUM
		XORIA		D'2'
		SNZB		Z
		JP			END_DISPLAY
;------------------------------------------------------------------;
		CLR			LEDTR1
		CLR			LEDTR2
DISP_DATA:
		SZB			F_NOPOWER
		JP			DISP_LED
		SZB			F_POWER_LOW
		JP			DISP_LED
		SNZB		F_PROTECT
		JP			DISP_DATA1
		JP			DISP_STEADY
DISP_DATA1:
		SNZB		F_ONOFF
		JP			DISP_LED
		;TR1
		SZB			T_HOUR,0
		SETB		LEDTR1,4				;1H
		SZB			T_HOUR,1
		SETB		LEDTR1,5				;2H
		SZB			T_HOUR,2
		SETB		LEDTR1,6				;4H
		LD			A,HEAT_SETUP
		XORIA		00H
		SZB			Z
		SETB		LEDTR1,3				;HIG
		LD			A,HEAT_SETUP
		XORIA		01H
		SZB			Z
		SETB		LEDTR1,2				;LOW
		SZB			F_TEMP_HOLD
		JP			DISP_TR2
		SZB			F_OSC
		SETB		LEDTR1,0				;OSC
DISP_TR2:					;TR2
		LD			A,TEMP_SETUP
		XORIA		00H						;MAX
		SNZB		Z
		JP			DISP_TEMP
MAX_DISP:
		SNZB		LIGHON,1
		SETB		LEDTR2,0
DISP_TEMP:
		SZB			F_TEMP_HOLD
		JP			DISP_STEADY
		SZB			LIGHON,1
		JP			DISP_LED
DISP_STEADY:		
		LD			A,TEMP_SETUP
		XORIA		D'01'					;60
		SZB			Z
		SETB		LEDTR2,6
		LD			A,TEMP_SETUP
		XORIA		D'02'					;65
		SZB			Z
		SETB		LEDTR2,7
		LD			A,TEMP_SETUP
		XORIA		D'03'					;70
		SZB			Z
		SETB		LEDTR2,5		
		LD			A,TEMP_SETUP
		XORIA		D'04'					;75
		SZB			Z
		SETB		LEDTR2,4
		LD			A,TEMP_SETUP
		XORIA		D'05'					;80
		SZB			Z
		SETB		LEDTR2,3
		LD			A,TEMP_SETUP
		XORIA		D'06'					;85
		SZB			Z
		SETB		LEDTR2,2
		
		SNZB		F_PROTECT
		JP			DISP_LED
		LD			A,TEMP_SETUP
		XORIA		00H						;MAX
		SZB			Z
		SETB		LEDTR2,0				;MAX
		SZB			LIGHON,1
		JP			DISP_LED
DISP_ERR:
		SETB		LEDTR1,3
		SETB		LEDTR1,2
;------------------------------------------------------------------;		
DISP_LED:
		CLRB		OUT_SCL
		CLRB		OUT_SDA
		LDIA		B'10000000'
		ORR			P0CH
		NOP
		NOP
		CALL		I2C_START
		LDIA		6CH
		CALL		TRANSING
		LD			A,LEDTR1
		CALL		TRANSING
		CALL		I2C_STOP
		CALL		I2C_START
		LDIA		6EH
		CALL		TRANSING
		LD			A,LEDTR2
		CALL		TRANSING
		CALL		I2C_STOP
		CALL		I2C_START
		LDIA		48H
		CALL		TRANSING
		LDIA		01H						;系统使能,八段显示,4级亮度
		CALL		TRANSING
		CALL		I2C_STOP
END_DISPLAY:
		RET
;******************************************************************;
;******************************************************************;
;*********************AIP650写指令/数据处理子程序*******************;
;******************************************************************;
;******************************************************************;		
TRANSING:
		LD			DSP_BUF,A
		LDIA		D'8'
		LD			BITNUM,A
LBITL:	
		CLRB		OUT_SCL
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
		RLCR		DSP_BUF
		SZB			C
		JP			LBIT1
LBIT0:	
		CLRB		OUT_SDA
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
		JP			LRL
LBIT1:	
		SETB		OUT_SDA
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
		NOP	
LRL:	
		SETB		OUT_SCL
		NOP	
		NOP	
		DECR		BITNUM
		NOP	
		LD			A,BITNUM
		HSUBIA		D'1'
		SZB			C
		JP			LBITL
		CLRB		OUT_SCL
		LDIA		B'00111111'				;将时序口转换为输入状态,发送完数据后进入结束延时
		ANDR		P0CH
		NOP	
		NOP	
		NOP	
		NOP	
TRANSING1:	
		SNZB		OUT_SDA
		JP			END_TRANSING
		INCR		WAIT_TIME1
		NOP	
		LD			A,WAIT_TIME1
		HSUBIA		D'20'
		SNZB		C
		JP			TRANSING1
		CLR			WAIT_TIME1
END_TRANSING:	
		CLR     	DSP_BUF
		SETB		OUT_SCL
		LDIA		B'10000000'				;将时序口转换为输出状态,方便下次发送数据
		ORR			P0CH
		RET		
;******************************************************************;		
I2C_START:
		CLRB		OUT_SCL
		SETB		OUT_SDA
		SETB		OUT_SCL
		NOP
		NOP
		NOP
		NOP
		NOP
		CLRB		OUT_SDA
		NOP
		NOP
		CLRB		OUT_SCL
		RET
;******************************************************************;		
I2C_STOP:
		CLRB		OUT_SCL
		CLRB		OUT_SDA
		SETB		OUT_SCL
		NOP
		NOP
		NOP
		NOP
		NOP
		SETB		OUT_SDA
		NOP
		NOP
		CLRB		OUT_SCL
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
WORK_SUB:
		LD			A,DISP_NUM
		XORIA		D'4'
		SNZB		Z
		JP			END_WORK_SUB
;------------------------------------------------------------------;		
		SZB			F_NOPOWER
		JP			SHUT_OFF
		SZB			F_POWER_LOW
		JP			WORK_OFF
		SZB			F_PROTECT
		JP			WORK_OFF
		SZB			F_ONOFF
		JP			WORK_JUD
WORK_OFF:
		CLRB		F_ONOFF
SHUT_OFF:
		SETB		OUT_HIG
		SETB		OUT_LOW
		SETB		OUT_FAN
		SETB		OUT_OSC
		CLR			T_HEAT_ON
		JP			END_WORK_SUB
;------------------------------------------------------------------;
WORK_JUD:
		SZB			F_AUTO
		JP			WORK_AUTO
WORK_NORMAL:
		LD			A,HEAT_SETUP
		ADDR		PCL
		JP			WORK_HIG
		JP			WORK_LOW
		JP			WORK_OFF
WORK_AUTO:
		LD			A,HEAT_WORK
		ADDR		PCL
		JP			WORK_HIG
		JP			WORK_HIG
		JP			WORK_STOP
WORK_STOP:
		SETB		OUT_HIG
		SETB		OUT_LOW
		SETB		OUT_OSC
		
		CLR			T_HEAT_ON
		LD			A,T_FAN_DELAY
		HSUBIA		D'150'
		SZB			C
		SETB		OUT_FAN
		JP			END_WORK_SUB
WORK_LOW:
		SETB		OUT_HIG
		CLRB		OUT_FAN
		CLRB		OUT_LOW
		CLRB		F_TEMP_HOLD
		CLR			T_FAN_DELAY
		JP			WORK_OSC_MODE
WORK_HIG:
		CLRB		OUT_FAN
		CLRB		F_TEMP_HOLD
		CLR			T_FAN_DELAY
		LD			A,T_HEAT_ON
		HSUBIA		D'10'
		SNZB		C
		JP			END_WORK_SUB
		CLRB		OUT_LOW
		LD			A,T_HEAT_ON
		HSUBIA		D'50'
		SZB			C
		CLRB		OUT_HIG
WORK_OSC_MODE:
		SZB			F_OSC
		CLRB		OUT_OSC
		SNZB		F_OSC
		SETB		OUT_OSC
;------------------------------------------------------------------;		
END_WORK_SUB:
		RET		
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
SCANREMOTE:
		LD			A,DISP_NUM
		XORIA		D'5'
		SNZB		Z
		JP			END_SCANREMOTE
		SZB  		F_PROTECT
		JP      	END_SCANREMOTE
;------------------------------------------------------------------;	
SCANREMOTE0:
		LD			A,T_REMOTE1
		HSUBIA		D'250'
		SNZB		C
		INCR		T_REMOTE1
		LD			A,T_REMOTE2			;两次接收的间隔时间
		HSUBIA		D'250'
		SNZB		C
		INCR		T_REMOTE2
		LD			A,T_REMOTE3			;两次按键按下的间隔时间
		HSUBIA		D'251'
		SNZB		C
		INCR		T_REMOTE3
		LD			A,T_REMOTE4
		HSUBIA		D'250'
		SNZB		C
		INCR		T_REMOTE4
		LD			A,T_REMOTE4
		HSUBIA		D'12'
		SZB			C
		CLRB		F_ON_REMOTE			;12次F_REMOTE为0后清掉F_ON_REMOTE标志
	
		SNZB		F_REMOTE
		JP			END_SCANREMOTE
		CLRB		F_REMOTE
		CLR			T_REMOTE4
		SZB			F_PROTECT
		JP			END_SCANREMOTE
		SZB			F_ONKEY
		JP			END_SCANREMOTE
		LD			A,REMOTE_DATA1
		XORIA		0DH
		SNZB		Z
		JP			END_SCANREMOTE1
		LD			A,REMOTE_DATA2
		XORIA		0H
		SZB			Z
		JP			END_SCANREMOTE1
		LD			A,REMOTE_DATA2				; 松开按键
		XORIA		80H
		SZB			Z
		JP			END_YKKEY
		LD			A,REMOTE_DATA2				; 与上一次按键是否相同
		XORA		REMOTE_BUF1
		SZB			Z
		JP			OLDYK
		LD			A,REMOTE_BUF1
		XORIA		0H
		SNZB		Z
		JP			NEWYK
OLDYK:	
		LD			A,T_REMOTE1			;键码相同，两次按键间隔时间
		HSUBIA		D'12'
		SZB			C
		JP			NEWYK				; 同一按键间隔100MS;80ms
		LD			A,REMOTE_DATA2
		XORA		REMOTE_BUF1
		SNZB		Z
		JP			END_SCANREMOTE2
		LD			A,T_REMOTE1
		HSUBIA		D'7'
		SZB			C
		JP			END_SCANREMOTE2
		LD			A,T_REMOTE3
		HSUBIA		D'70';'140'
		SNZB		C
		JP			END_SCANREMOTE2
		LDIA		D'0'
		LD			T_REMOTE3,A			; 0.5s
OLDYK_JUD:	
		SNZB  		F_ONOFF
		JP			END_SCANREMOTE2
		;LD			A,REMOTE_DATA2
		;XORIA		90H
		;SZB			Z
		;JP			OLD_YKKEY_UP		; UP KEY
		;LD			A,REMOTE_DATA2
		;XORIA		0A0H
		;SZB			Z
		;JP			OLD_YKKEY_DOWN		; DOWN KEY
		LD			A,REMOTE_DATA2
		XORIA		82H
		SZB			Z
		JP			OLD_YKKEY_TIME		; TIME KEY
		JP			END_SCANREMOTE2
NEWYK:	
		LD			A,REMOTE_DATA2
		XORA		REMOTE_BUF
		SNZB		Z
		JP			YAOK1
		CLR			REMOTE_BUF1
		LD			A,T_REMOTE2			; 两遍的接收时间间隔 <20ms?
		HSUBIA		D'2'
		SNZB		C
		JP			END_SCANREMOTE1
		LD			A,T_REMOTE2			; >36ms?
		HSUBIA		D'5'
		SZB			C
		JP			END_SCANREMOTE1
		SETB		F_ON_REMOTE
		LD			A,REMOTE_DATA2
		XORIA		81H
		SZB			Z
		JP			YK_KEY_ONOFF			; ON/OFF KEY
		LD			A,REMOTE_DATA2
		XORIA		84H
		SZB			Z
		JP			YKKEY_MODE			; MODE KEY
		LD			A,REMOTE_DATA2
		XORIA		82H
		SZB			Z
		JP			YKKEY_TIME			; TIMER KEY
		LD			A,REMOTE_DATA2
		XORIA		90H
		SZB			Z
		JP			YKKEY_UP			; UP KEY
		LD			A,REMOTE_DATA2
		XORIA		0A0H
		SZB			Z
		JP			YKKEY_DOWN			; DOWN KEY
		LD			A,REMOTE_DATA2
		XORIA		88H
		SZB			Z
		JP			YKKEY_OSC			; OSC KEY
		JP			END_SCANREMOTE2
;------------------------------------------------------------------;		
YK_KEY_ONOFF:
		SZB			F_ONOFF
		JP			YKWORK_OFF
YKWORK_ON:
		SETB		F_ONOFF
		JP			END_YKKEY_POWER
YKWORK_OFF:
		CLRB		F_ONOFF
END_YKKEY_POWER:		
		SETB		F_TEMP_FIRST
		CLRB		F_AUTO
		CLRB		F_OSC
		CLRB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		CLR			T_SETUP_LOW
		CLR			T_SETUP_MAX
		CLR			TEMP_SETUP
		CLR			HEAT_SETUP
		CLR			T_HEAT_ON
		CLR			T_HOUR
		CLR			LIGHON
		CLR			T_BUZ
		SETB		F_BUZ
		JP	       	END_YKKEY
;------------------------------------------------------------------;		
YKKEY_TIME:	
		CALL		KEY_TIMER
		JP			END_YKKEY
;------------------------------------------------------------------;		
YKKEY_OSC:	
		CALL		KEY_OSC
		JP			END_YKKEY
;------------------------------------------------------------------;		
YKKEY_MODE:
		SNZB		F_ONOFF
		JP			END_YKKEY
		INCR		HEAT_SETUP
		NOP
		LD			A,HEAT_SETUP
		HSUBIA		D'2'
		SZB			C
		CLR			HEAT_SETUP
		CLR			LIGHON
		CLR			T_HEAT_ON
		CLR			TEMP_SETUP
		CLR			T_SETUP_LOW
		CLR			T_SETUP_MAX
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		CLRB		F_TEMP_HOLD
		CLRB		F_AUTO
		SETB		F_BUZ
		CLR			T_BUZ
		JP			END_YKKEY
;------------------------------------------------------------------;
YKKEY_UP:
		CALL		KEY_TEMP
		JP			END_YKKEY
;------------------------------------------------------------------;
YKKEY_DOWN:
		CALL		TEMP_SUB
		JP			END_YKKEY
;------------------------------------------------------------------;
OLD_YKKEY_TIME:
			CALL	END_KEY_F_TIMER
			JP		END_YKKEY0
END_YKKEY:
			CLR		T_REMOTE3
END_YKKEY0:
			LD		A,REMOTE_DATA2
			LD		REMOTE_BUF1,A
			JP		END_SCANREMOTE2
YAOK1:		
			LD		A,REMOTE_DATA2				; 第一次
			LD		REMOTE_BUF,A
			CLR		T_REMOTE2
			JP		END_SCANREMOTE
END_SCANREMOTE2:
			CLR		REMOTE_BUF
			CLR		T_REMOTE1
			CLR		T_REMOTE2
			JP		END_SCANREMOTE
END_SCANREMOTE1:
			CLR		REMOTE_BUF
			CLR		T_REMOTE2
END_SCANREMOTE:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
ADC_GET:		
		SETB		SYS_GEN,ADC_EN
		NOP
		NOP
		LDIA		B'11000100'
		LD			ADCON,A
		NOP
		NOP
		SETB		ADCON,CONV
		NOP
		NOP
		CLRB		ADCON,CONV
SCANAD_WAIT1:
		SNZB		ADCON,EOC
		JP			SCANAD_WAIT1
		LD			A,ADDATA
		ADDR		NTC_RAM1
		LDIA		D'0'
		ADDCR		NTC_RAM2
DATA_PROC:
		INCR		ADC_NUM
		LD			A,ADC_NUM
		XORIA		D'0'
		SNZB		Z
		JP			END_ADC_GET
		LD			A,NTC_RAM2
		ADDR		NTC_RAM
		RRCR		NTC_RAM
		CLR			NTC_RAM1
		CLR			NTC_RAM2
END_ADC_GET:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
SENSOR_SUB:
		LD			A,DISP_NUM
		XORIA		D'3'
		SNZB		Z
		JP			END_SENSOR_SUB
TEMP_PROC:
		LD			A,NTC_RAM
		HSUBIA		D'205'
		SZB			C
		JP			OVER_140F
		LD			A,NTC_RAM
		HSUBIA		D'58'
		SZB			C
		JP			TEMP_PROC1
LOWER_32F:
		LDIA		D'32'
		LD			T_ROOM_BUF,A
		JP			TEMP_PROC2
OVER_140F:
		LDIA		D'140'
		LD			T_ROOM_BUF,A
		JP			TEMP_PROC2
TEMP_PROC1:
		LD			A,NTC_RAM
		HSUBIA		D'58'
		LD			TABLE_SPL,A
		LDIA		10H
		ADDR		TABLE_SPL
		LDIA		07H
		LD			TABLE_SPH,A
		TABLEA
		LD			T_ROOM_BUF,A
		DECR		T_ROOM_BUF				;温度补偿
		DECR		T_ROOM_BUF
TEMP_PROC2:
		INCR		OVER_CNT1				;温度变化计时(连续自增20次仍然未被清零)
		SNZB		F_ADC_FIRST
		JP			TEMP_PROC20
		LD			A,T_ROOM_F
		HSUBIA		D'33'
		SZB			C
		JP			TEMP_PROC21
TEMP_PROC20:
		LD			A,T_ROOM_BUF
		LD			T_ROOM_F,A
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC21:
		LD			A,T_ROOM_BUF			;新值减旧值,判断温度是上升还是降低
		HSUBA		T_ROOM_F
		SNZB		C
		JP			TEMP_PROC23
		LD			A,T_ROOM_F
		HSUBA		T_ROOM_BUF
		SNZB		C
		JP			TEMP_PROC22
		CLR			OVER_CNT1
		JP			TEMP_PROC3				;值不变,不作判断,将OVER_CNT1计时清零
TEMP_PROC22:
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		INCR		T_ROOM_F
		NOP
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC23:
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		DECR		T_ROOM_F
		CLR			OVER_CNT1
TEMP_PROC3:									; 温度锁住?
		SZB			F_TEMP_HOLD
		JP			TEMP_PROC4
		LD			A,T_ROOM_F
		LD			T_ROOM_REAL,A
TEMP_PROC4:
;------------------------------------------------------------------;
TEMP_OVER_JUD:							; 高温判断
		LD   		A,T_ROOM_F
		SNZB		F_TEMP_130F
		JP			T_OVER100F
T_OVER130F:									;高温,超130F
		HSUBIA  	D'130'
		SNZB  		C
		JP			TEMP_NO_OVER
		JP      	TEMP_ERR
T_OVER100F:									;高温,超100F
		HSUBIA  	D'100'
		SNZB  		C
		JP      	TEMP_NO_OVER
TEMP_ERR:	
		INCR    	OVER_CNT2
		SNZB		F_ONOFF
		JP			TEMP_ERR2
TEMP_ERR1:	
		LD   		A,OVER_CNT2
		HSUBIA  	D'60'
		SZB  		C
		SETB		F_PROTECT
		JP			END_TEMP_OVER_JUD
TEMP_ERR2:	
		LD   		A,OVER_CNT2
		HSUBIA  	D'150'
		SZB  		C
		SETB  		F_PROTECT
		JP			END_TEMP_OVER_JUD
TEMP_NO_OVER:	
		CLR     	OVER_CNT2				;超温计时
END_TEMP_OVER_JUD:
;------------------------------------------------------------------;
TEMP_JUD:
		SNZB		F_ONOFF
		JP			END_SENSOR_SUB
		SZB			F_AUTO
		JP			TEMP_JUD_AUTO
TEMP_JUD_NORMAL:
		LD			A,HEAT_SETUP
		LD			HEAT_WORK,A
		LD			HEAT_WORK_BUF,A
		CLRB		F_TEMP_HOLD
		JP			END_SENSOR_SUB
TEMP_JUD_AUTO:
		LD			A,T_ROOM_REAL
		HSUBA		T_SETUP_LOW
		SZB			C
		JP			TEMP_JUD_AUTO2
TEMP_JUD_AUTO1:									; <T_SETUP
		CLR			HEAT_WORK_BUF
		LD			A,HEAT_WORK
		HSUBIA		D'1'
		SNZB		C
		JP			END_TEMP_JUD_AUTO
		CLR			HEAT_WORK					; 切换到高档
		CLR			T_HEAT_ON
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO2:
		LD			A,T_ROOM_REAL
		HSUBA		T_SETUP_MAX
		SNZB		C
		JP			TEMP_JUD_AUTO3
		LDIA		D'2'						; >T_SETUP_MAX
		LD			HEAT_WORK_BUF,A
		LD			A,HEAT_WORK
		HSUBIA		D'2'
		SZB			C
		JP			END_TEMP_JUD_AUTO
		LDIA		D'2'
		LD			HEAT_WORK,A
		SETB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		CLR			T_TEMP_HOLD
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO3:									; >=T_SETUP&<=T_SETUP_MAX
		LDIA		D'1'
		LD			HEAT_WORK_BUF,A
		LD			A,HEAT_WORK
		XORIA		D'1'
		SZB			Z
		JP			END_TEMP_JUD_AUTO
		LDIA		D'1'
		LD			HEAT_WORK,A
		CLR			T_HEAT_ON
		JP			END_TEMP_JUD_AUTO
END_TEMP_JUD_AUTO:
		LD			A,T_TEMP_HOLD
		HSUBIA		D'254'
		SZB			C
		CLRB		F_TEMP_HOLD
END_SENSOR_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
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



		
		
