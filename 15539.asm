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
		OUT_BUZ			EQU	P2,2
		OUT_LOW			EQU	P0,1
		OUT_HIG			EQU	P0,0
		OUT_OSC			EQU	P1,4
		OUT_FAN			EQU	P1,5
		
		LED_COM1		EQU	P0,3
		LED_COM2		EQU	P0,7
		LED_SEG1		EQU	P0,6
		LED_SEG2		EQU	P0,5
		LED_SEG3		EQU	P0,4
		LED_SEG4		EQU	P1,6
		LED_SEG5		EQU	P1,2
		LED_SEG6		EQU	P1,1
		LED_SEG7		EQU	P1,0
		
		SW_OSC			EQU	P2,0
		
		NTC				EQU	P1,3
		ZERO_IN			EQU	P0,2
;******************************************************************;		
		ACC_BUF			EQU	30H
		STATUS_BUF		EQU	31H
		FLAG1			EQU	32H
		FLAG2			EQU	33H
		T1MS_TIMER      EQU	34H
		T100MS_TIMER	EQU	35H
		T250MS_TIMER    EQU	36H
		T250MS_TIMER1   EQU	37H
		T_ZERO          EQU	38H
		T_NPULSE_BUF    EQU 39H
		KEY_VALUE       EQU 3AH
		KEY_VALUE1      EQU 3BH
		LEDN            EQU 3CH
		LIGHON          EQU 3DH
		DISP_NUM        EQU 3EH
		T_NPULSE        EQU 3FH
		T_SETUP_F		EQU 41H
		T_SETUP_LOW     EQU 42H
		T_SETUP_MAX     EQU 43H
		OVER_CN1        EQU 44H
		T_ADC_DELAY     EQU 45H    
		KEY_DELAY       EQU 46H
		KEY_DELAY1      EQU 47H
		OLDKEY_TIMER    EQU 48H
		T_BUZ           EQU 49H
		T_HOUR          EQU 4AH
		T_MIN           EQU 4BH
		T_SEC           EQU 4CH
		T_SEC0          EQU 4DH
		T_HEAT_ON       EQU 4EH
		T_FAN_DELAY     EQU 4FH
		T_TEMP_HOLD     EQU 51H
		T_TEMP_HOLD0    EQU 52H
		HEAT_WORK       EQU 53H
		HEAT_WORK_BUF	EQU 54H
		HEAT_SETUP      EQU	55H
		TEMP_SETUP      EQU	56H
		TEMP_WORK		EQU	57H
		NTC_RAM         EQU	58H
		NTC_RAM1        EQU	59H
		NTC_RAM2        EQU	5AH
		ADC_NUM         EQU	5BH
		T_ROOM_BUF      EQU	5CH
		T_ROOM_F        EQU	5DH
		T_ROOM_REAL     EQU	5EH
		T_ROOM_DISP     EQU	5FH
		OVER_CNT1       EQU	61H
		OVER_CNT2	    EQU	62H
;*************************************************************************;		
		F_T1MS			EQU	T1MS_TIMER,3
		;FLAG1
		F_ONOFF			EQU	FLAG1,0
		F_OSC			EQU	FLAG1,1
		F_BUZ			EQU	FLAG1,2
		F_PROTECT		EQU	FLAG1,3
		F_ONKEY			EQU	FLAG1,4
		
		F_TEMP_HOLD		EQU	FLAG2,0
		F_ZERO_RISE		EQU	FLAG2,1
		F_ADC_FIRST		EQU FLAG2,2
		F_TEMP_130F		EQU	FLAG2,3
;******************************************************************;
		ORG			0000H
		JP			RESET
		ORG			0001H
		JP			ISR_TIMER0
;******************************************************************;
ISR_TIMER0:
		LD			ACC_BUF,A
		SWAPR		ACC_BUF
		SWAPA		FLAGS
		LD			STATUS_BUF,A
		CLRB		INT_FLAG,F_T1
;---------------------------- BUZZER ------------------------------;		
		SNZB		F_BUZ
		JP			BUZZ_OFF
BUZZ_ON:
		LDIA		04H
		XORR		P2
		JP			END_BUZZ
BUZZ_OFF:
		CLRB		OUT_BUZ
END_BUZZ:
;--------------------------- 1MS TIMER ----------------------------;
TIMER1:	
		INCR		T1MS_TIMER
END_TIMER1:
;-----------------------------  ZERO  -----------------------------;
ZERO_PLUSE:									;过零信号
		LD			A,T_ZERO
		HSUBIA		D'253'
		SNZB		C
		INCR		T_ZERO
		SNZB		ZERO_IN
		JP			NPLUSE
PPLUSE:		
		INCR		T_NPULSE_BUF
		SZB			F_ZERO_RISE
		JP			END_ZERO_PULSE
		SETB		F_ZERO_RISE				; 上升沿
		JP			END_ZERO_PULSE
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
EXIT_INT:
		SWAPA		STATUS_BUF	            ; 现场恢复
		LD			FLAGS,A
		SWAPA		ACC_BUF
		RETI
;******************************************************************;
RESET:
		CLRWDT
		CLR			SYS_GEN
		LDIA		B'10001011'
		LD			P0,A
		LDIA		B'00110000'
		LD			P1,A
		LDIA		B'00000001'
		LD			P2,A
		
		LDIA		B'10011010'
		LD			P0CL,A
		LDIA		B'10101010'
		LD			P0CH,A
		LDIA		B'01101010'
		LD			P1CL,A
		LDIA		B'10010010'
		LD			P1CH,A
		LDIA		B'10000000'
		LD			P2C,A
		
		LDIA		B'10001011'
		LD			P0,A
		LDIA		B'00110000'
		LD			P1,A
		LDIA		B'00000001'
		LD			P2,A
		
		CLRA
		OPTION
		CLRB		TMR1C,TON
		CLRB		INT_EN,EN_T1
		CLRB		INT_FLAG,F_T1		        ;内部8M晶振。
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

		LDIA		D'100'
		LD			T_SETUP_F,A
		LD			T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA		D'2'
		ADDR		T_SETUP_MAX
		
		LDIA		D'30'
		LD			OVER_CN1,A
		LDIA		D'250'
		LD			T_ADC_DELAY,A
		CLRB		F_PROTECT
		LDIA		D'3'
		LD			TEMP_SETUP,A
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
MAINLOOP:
		CALL		ADC_GET				
		CLRWDT
		SNZB		F_T1MS
		JP			MAINLOOP
		CLRB		F_T1MS
		CLRWDT
		CALL		TIMER_SUB			;2
		CALL		SENSOR_SUB			;1
		CALL		SCANKEY				;3
		CALL		DISPLAY				;4
		CALL		WORK_SUB			;5
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
SCANKEY:
		LD			A,DISP_NUM
		XORIA		D'3'
		SNZB		Z
		JP			END_SCANKEY
;------------------------------------------------------------------;
		LDIA		B'00010010'
		LD			P1CH,A
		LDIA		B'01001000'
		LD			P1CL,A
		LDIA		B'10000000'
		LD			P2C,A
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
		SNZB		LED_SEG4
		SETB		KEY_VALUE,1			;POWER
		SNZB		LED_SEG5
		SETB		KEY_VALUE,2			;TIMER
		SNZB		LED_SEG7
		SETB		KEY_VALUE,3			;TEMP
		SNZB		SW_OSC
		SETB		KEY_VALUE,4			;OSC
		NOP
		NOP
		NOP
		LDIA		B'10010010'
		LD			P1CH,A
		LDIA		B'01101010'
		LD			P1CL,A
		NOP
		NOP
		NOP
;------------------------------------------------------------------;
KEY_JUD:
		LD			A,KEY_VALUE
		XORA		KEY_VALUE1
		SZB			Z
		JP			KEY_JUD1
		CLR			KEY_DELAY
		LD			A,KEY_VALUE
		LD			KEY_VALUE1,A
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
		CLR			OLDKEY_TIMER
		CLRB		F_ONKEY
		JP			END_SCANKEY
ON_KEY:
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
		LD			A,OLDKEY_TIMER
		HSUBIA		D'250'
		SNZB		C
		INCR		OLDKEY_TIMER
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
		CLR			OLDKEY_TIMER
		JP			END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_ONOFF:
		SZB			F_ONOFF
		JP			MODE_SWITCH
KEY_ON:
		CLRB		F_TEMP_HOLD
		SETB		F_ONOFF
		CLRB		F_OSC
		CLR			T_HOUR
		CLR			T_HEAT_ON
		CLR			T_SEC0
		CLR			HEAT_WORK
		CLR			HEAT_SETUP
		LDIA		D'3'
		LD			TEMP_SETUP,A
		JP			KBUZ
MODE_SWITCH:
		CLR			T_HEAT_ON
		INCR		HEAT_SETUP
		NOP
		LD			A,HEAT_SETUP
		HSUBIA		D'3'
		SNZB		C
		JP			KBUZ
		CLRB		F_ONOFF
		CLR			T_HOUR
		JP			KBUZ
KEY_PROTECT:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,T_SEC0
		XORIA		D'16'
		SNZB		Z
		JP			END_SCANKEY
		INCR		T_SEC0
		SETB		F_TEMP_130F
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;		
KEY_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		INCR		T_HOUR
		LD			A,T_HOUR
		HSUBIA		D'9'
		SZB			C
		CLR			T_HOUR
		CLR			T_SEC
		CLR			T_MIN
		CLR			T250MS_TIMER1
		JP			KBUZ
KEY_F_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,OLDKEY_TIMER
		HSUBIA		D'62'
		SNZB		C
		JP			END_SCANKEY
		CLR			OLDKEY_TIMER
END_KEY_F_TIME:
		LD			A,T_HOUR
		HSUBIA		D'8'
		SZB			C
		JP			END_SCANKEY
		INCR		T_HOUR
		CLR			T_SEC
		CLR			T_MIN
		CLR			T250MS_TIMER1
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_TEMP:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		INCR		TEMP_SETUP
		LD			A,TEMP_SETUP
		HSUBIA		D'7'
		SZB			C
		CLR 		TEMP_SETUP
		JP			KBUZ
KEY_F_TEMP:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,OLDKEY_TIMER
		HSUBIA		D'62'
		SNZB		C
		JP			END_SCANKEY
		CLR			OLDKEY_TIMER
END_KEY_F_TEMP:
		LD			A,TEMP_SETUP
		HSUBIA		D'7'
		SZB			C
		JP			END_SCANKEY
		INCR		TEMP_SETUP
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
END_SCANKEY:
		RET
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
		SZB			C
		CLR			DISP_NUM
		LD			A,DISP_NUM
		XORIA		D'2'
		SNZB		Z
		JP			TIMER_SUB0
ZERO_JUD:



END_ZERO_JUD:
;------------------------------------------------------------------;
TIMER_SUB0:
		INCR		T100MS_TIMER
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
T_05SEC1:
		INCR		T_TEMP_HOLD0
		LD			A,T_TEMP_HOLD0
		HSUBIA		D'10'
		SNZB		C
		JP			T_05SEC2
		CLR			T_TEMP_HOLD0
		INCR		T_TEMP_HOLD
T_05SEC2:
;------------------------------------------------------------------;
TIMER_JUD:
		INCR		T_SEC
		LD			A,T_SEC
		HSUBIA		D'240'
		SNZB		C
		JP			END_TIMER_JUD
		CLR			T_SEC
		INCR		T_MIN
		HSUBIA		D'60'
		JP			END_TIMER_JUD
		CLR			T_MIN
		LD			A,T_HOUR
		HSUBIA		D'1'
		SNZB		C
		JP			END_TIMER_JUD
		DECR		T_HOUR
		LD			A,T_HOUR
		HSUBIA		D'1'
		SZB			C
		JP			END_TIMER_JUD
		CLRB		F_ONOFF
END_TIMER_JUD:
;------------------------------------------------------------------;
TIMER_SUB1:
		INCR		T250MS_TIMER1
		LD			A,T250MS_TIMER1
		HSUBIA		D'250'
		SNZB		C
		JP			END_TIMER_SUB1
		CLR			T250MS_TIMER1
		INCR		LIGHON
		NOP
		SETB		F_ADC_FIRST
END_TIMER_SUB1:
;------------------------------------------------------------------;
BUZ_TIMER:
		SNZB		F_BUZ
		JP			END_BUZ_TIMER
		INCR		T_BUZ
		NOP
		LD			A,T_BUZ
		HSUBIA		D'160'
		SZB			C
		CLRB		F_BUZ
END_BUZ_TIMER:		
;------------------------------------------------------------------;
END_TIMER_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
DISPLAY:
		CLRB		LED_SEG1
		CLRB		LED_SEG2
		CLRB		LED_SEG3
		CLRB		LED_SEG4
		CLRB		LED_SEG5
		CLRB		LED_SEG6
		CLRB		LED_SEG7
		SETB		LED_COM1
		SETB		LED_COM2
		LD			A,DISP_NUM
		XORIA		D'3'
		SNZB		Z
		JP			END_DISPLAY
;------------------------------------------------------------------;
		INCR		LEDN
		LD			A,LEDN
		HSUBIA		D'2'
		SZB			C
		CLR			LEDN
		LD			A,LEDN
		ADDR		PCL
		JP			BUF_DISP
		;JP			TEMP_DISP
		JP			END_DISPLAY
;------------------------------------------------------------------;		
BUF_DISP:
		CLRB		LED_COM1
		SZB			T_HOUR,0				;TIMER
		SETB		LED_SEG7
		SZB			T_HOUR,1
		SETB		LED_SEG6
		SZB			T_HOUR,2
		SETB		LED_SEG5
		LD			A,HEAT_SETUP
		HSUBIA		D'1'
		SNZB		C
		JP			HIGH_DISP
		SETB		LED_SEG3
		JP			OSC_DISP
HIGH_DISP:
		SETB		LED_SEG4
OSC_DISP:
		SZB			F_OSC
		SETB		LED_SEG2
		JP			END_DISPLAY
;------------------------------------------------------------------;
TEMP_DISP:
		CLRB		LED_COM2
		LD			A,TEMP_SETUP
		ADDR		PCL
		JP			TEMP_60
		JP			TEMP_65
		JP			TEMP_70
		JP			TEMP_MAX
		JP			TEMP_75
		JP			TEMP_80
		JP			TEMP_85
		JP			TEMP_MAX
TEMP_60:
		SETB		LED_SEG5
		JP			END_DISPLAY
TEMP_65:
		SETB		LED_SEG6
		LDIA		65H
		LD			TEMP_WORK,A
		JP			END_DISPLAY
TEMP_70:
		SETB		LED_SEG4
		LDIA		70H
		LD			TEMP_WORK,A
		JP			END_DISPLAY
TEMP_75:
		SETB		LED_SEG7
		LDIA		75H
		LD			TEMP_WORK,A
		JP			END_DISPLAY
TEMP_80:
		SETB		LED_SEG3
		LDIA		80H
		LD			TEMP_WORK,A
		JP			END_DISPLAY
TEMP_85:
		SETB		LED_SEG2
		LDIA		85H
		LD			TEMP_WORK,A
		JP			END_DISPLAY
TEMP_MAX:
		SETB		LED_SEG1
;------------------------------------------------------------------;
END_DISPLAY:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
WORK_SUB:
		
		
		
		
END_WORK_SUB:
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
		NOP
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
		XORIA		D'1'
		SNZB		Z
		JP			END_SENSOR_SUB
TEMP_PROC:
		LD			A,NTC_RAM
		HSUBIA		D'250'
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
		DECR		T_ROOM_BUF
		DECR		T_ROOM_BUF
TEMP_PROC2:
		INCR		OVER_CNT1
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
		LD			A,T_ROOM_BUF
		HSUBIA		T_ROOM_F
		SNZB		C
		JP			TEMP_PROC23
		LD			A,T_ROOM_F
		HSUBIA		T_ROOM_BUF
		SNZB		C
		JP			TEMP_PROC22
		CLR			OVER_CNT1
		JP			TEMP_PROC23
TEMP_PROC22:
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		INCR		T_ROOM_F
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC23:
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		DECR		T_ROOM_F
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC3:
		SZB			F_TEMP_HOLD
		JP			TEMP_PROC4
		LD			A,T_ROOM_F
		LD			T_ROOM_REAL,A
TEMP_PROC4:
;------------------------------------------------------------------;
TEMP_OVER_JUD:						; 高温判断
		LD   		A,T_ROOM_F
		SNZB		F_TEMP_130F				;判断是否开启了130F度关闭设置,如果开启了,则按照130F超温标准
		JP			T_OVER100F
T_OVER130F:									;高温,超130F
		HSUBIA  	D'130'
		SNZB  		C
		JP			TEMP_NO_OVER			;未超过130F
		JP      	TEMP_ERR				;超过
T_OVER100F:									;高温,超100F
		HSUBIA  	D'100'
		SNZB  		C
		JP      	TEMP_NO_OVER
TEMP_ERR:		
		INCR    	OVER_CNT2				;开始计时
		SNZB		F_ONOFF					;判断超温时暖风机是否开启
		JP			TEMP_ERR2
TEMP_ERR1:		
		LD   		A,OVER_CNT2				;开启
		HSUBIA  	D'60'					
		SZB  		C						;超过60次计时仍然超温
		SETB		F_PROTECT				;开启温度保护,闪烁显示88和高低风
		JP			END_TEMP_OVER_JUD
TEMP_ERR2:		
		LD   		A,OVER_CNT2				;电源关闭时
		HSUBIA  	D'150'					;周围温度过高,持续超过150次计时
		SZB  		C
		SETB  		F_PROTECT				;开启温度保护,闪烁显示88和高低风
		JP			END_TEMP_OVER_JUD
TEMP_NO_OVER:		
		CLR     	OVER_CNT2
END_TEMP_OVER_JUD:
;------------------------------------------------------------------;
TEMP_JUD:								; 工作温度判断
		SNZB  		F_ONOFF
		JP			END_TEMP_JUD
TEMP_JUD_NOR:		
		CLRB		F_TEMP_HOLD		; 高低档模式不会锁定温度
		LD			A,HEAT_SETUP	
		LD			HEAT_WORK,A		;把设定的档位值送到工作的档位
		LD			HEAT_WORK_BUF,A	;储存到HEAT_WORK_BUF
		JP      	END_TEMP_JUD
TEMP_JUD_AUTO:		
		LD			A,T_ROOM_DISP	;当前环境的温度与设定温度的最低值(其实就是当前设定的温度值)比较
		HSUBA		T_SETUP_LOW
		SZB			C
		JP			TEMP_JUD_AUTO2 	;当前环境温度值大于设定温度
TEMP_JUD_AUTO1:								; <T_SETUP
		CLR			HEAT_WORK_BUF	
		LD			A,HEAT_WORK		;判断是高档还是低档
		HSUBIA		D'1'
		SNZB		C
		JP			END_TEMP_JUD_AUTO	;本身就是高档
		CLR			HEAT_WORK		;本身是低档,变为高档
		CLR			T_HEAT_ON		;低档切换高档,导通延时重新计算
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO2:		
		LD			A,T_ROOM_DISP
		HSUBA		T_SETUP_MAX			; 数码管实际显示温度与T_SETUP_MAX比较
		SNZB		C
		JP			TEMP_JUD_AUTO3		; 如果小于T_SETUP_MAX(设定温度+3F)
		LDIA		D'2'				; >T_SETUP+3F	大于设定温度3F以上
		LD			HEAT_WORK_BUF,A
		LD			A,HEAT_WORK
		HSUBIA		D'2'
		SZB			C
		JP			END_TEMP_JUD_AUTO
		LDIA		D'2'
		LD			HEAT_WORK,A
		SETB		F_TEMP_HOLD			;锁定温度
		CLR			T_TEMP_HOLD0		;计一秒钟的变量
		CLR			T_TEMP_HOLD			;清掉锁定温度计时
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO3:								; >=T_SETUP&<=T_SETUP+3F	大于设定温度但是不超过T_SETUP_MAX(T_SETUP+3F)
		LDIA		D'1'
		LD			HEAT_WORK_BUF,A
		LD			A,HEAT_WORK
		XORIA		D'1'
		SZB			Z						;判断是否低档运行
		JP			END_TEMP_JUD_AUTO
		LDIA		D'1'
		LD			HEAT_WORK,A				;原本为高档运行,切换回低档
		CLR			T_HEAT_ON				;清零换挡后的发热组件导通延时
		JP			END_TEMP_JUD_AUTO
END_TEMP_JUD_AUTO:					; OVER 4min+15s解锁
		LD			A,T_TEMP_HOLD
		HSUBIA		D'254'
		SZB			C				; 一旦温度锁定,4分15秒之后才解锁
		CLRB		F_TEMP_HOLD
END_TEMP_JUD:
;------------------------------------------------------------------;
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
		
		JP			RESET
		END	
