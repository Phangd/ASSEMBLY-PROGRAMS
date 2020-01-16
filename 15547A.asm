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
		OUT_LOW			EQU	P0,4
		OUT_HIG			EQU	P0,3
		OUT_FAN_H		EQU	P2,2
		OUT_FAN_M		EQU	P1,0
		OUT_FAN_L		EQU	P1,1
		OUT_FAN_S		EQU	P1,2
		OUT_HEAT_H		EQU	P1,3
		OUT_HEAT_L		EQU	P1,4
		OUT_OSC			EQU	P1,5
		
		REC_DATA		EQU	P0,7
		OUT_DATA		EQU	P0,6
		NTC				EQU	P1,6
		LED_HEAT		EQU	P0,5
		ZERO_FAN		EQU	P2,1
		ZERO_VOLT		EQU	P2,0
;******************************************************************;		
		ACC_BUF			EQU	30H
		STATUS_BUF      EQU	31H
		FLAG1           EQU	32H
		FLAG2	      	EQU 33H
		FLAG3			EQU	34H
		FLAG4			EQU	35H
		T1MS_TIMER      EQU	36H
		CODE1           EQU	37H
		CODE2           EQU	38H
		CODE1_BUF       EQU	39H
		CODE2_BUF       EQU	3AH
		DATA            EQU	3BH
		DATA1           EQU	3CH
		PLUSE_TIME		EQU	3DH
		BIT_NUM         EQU	3EH
		TN              EQU	40H
		REMOTE_NUM      EQU	42H
		T100MS_TIMER    EQU	43H
		T_SEND          EQU	44H
		T_FAN_DELAY     EQU	45H
		T_REC_TIMEOUT   EQU	46H
		T_ZERO          EQU	47H
		T_NPULSE_BUF    EQU	48H
		T_NPULSE        EQU	49H
		T_ADC_DELAY     EQU	4AH
		OVER_CNT1       EQU	4BH
		DISP_NUM        EQU	4CH
		LOSE_TIME1      EQU	4DH
		LOSE_TIME2      EQU	4EH
		LOSE_TIME3      EQU	50H
		T_ROOM_REAL     EQU	51H
		T_ROOM_BUF      EQU	52H
		T_ROOM_F        EQU	53H
		NTC_RAM			EQU	54H
		NTC_RAM1		EQU	55H
		NTC_RAM2		EQU	56H
		ADC_NUM			EQU	57H
		ZERO_CNT		EQU	58H
		CHECK_BUF		EQU	59H			;RECEIVE CHECK BUF
		CHECK_BUF1		EQU	5AH			;RECEIVE CHECK BUF1
		CHECK_BUF2		EQU	5BH			;SEND CHECK BUF
		FLAG5			EQU	5CH
		DATA_BUF		EQU	5DH
		DATA1_BUF		EQU	5EH
;******************************************************************;
		F_T1MS			EQU	T1MS_TIMER,3
		
		;FLAG1(RECEIVE)
		F_OSC			EQU	FLAG1,7
		F_FAN_HIG       EQU	FLAG1,6
		F_FAN_MID       EQU	FLAG1,5
		F_FAN_LOW       EQU	FLAG1,4
		F_FAN_SLOW      EQU	FLAG1,3
		F_HEAT_HIG		EQU	FLAG1,2
		F_HEAT_LOW		EQU	FLAG1,1
		F_HEAT_F_HIG	EQU	FLAG1,0
		;FLAG2(RECEIVE)
		F_HEAT_F_LOW	EQU	FLAG2,7
		F_HEAT_ONOFF	EQU	FLAG2,6
		F_FAN_DELAY		EQU	FLAG2,5
		F_TEMP_HOLD		EQU	FLAG2,4
		F_CHECK1		EQU	FLAG2,3
		F_CHECK2		EQU	FLAG2,2
		F_CHECK3        EQU	FLAG2,1
		F_CHECK4        EQU	FLAG2,0
		;FLAG3(SEND)
		F_NOPOWER		EQU	FLAG3,7
		F_POWER_LOW		EQU	FLAG3,6
		F_CHECK5        EQU	FLAG3,5
		F_CHECK6        EQU	FLAG3,4
		F_CHECK7        EQU	FLAG3,3
		F_CHECK8        EQU	FLAG3,2
		F_CHECK9        EQU	FLAG3,1
		F_CHECK10       EQU	FLAG3,0
		;FLAG4
		F_PLUSE			EQU	FLAG4,7
		F_ZERO_RISE		EQU	FLAG4,6
		F_ADC_FIRST		EQU	FLAG4,5
		F_ZERO_UP		EQU	FLAG4,4
		F_FAN_ONOFF     EQU	FLAG4,3
		F_RECEIVER_OK	EQU	FLAG4,2
		F_SEND			EQU	FLAG4,1
		F_BIT_HEAD      EQU	FLAG4,0
		;FLAG5
		F_BIT_END       EQU	FLAG5,7
		F_BIT1          EQU	FLAG5,6
		F_BIT0          EQU	FLAG5,5
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
;--------------------------- 1MS TIMER ----------------------------;
TIMER0:
		INCR		T1MS_TIMER
END_TIMER0:
;--------------------------- SEND DATA ----------------------------;
SEND_DATA:									
		SNZB		F_SEND				;BIT_END中才清零
		JP			SEND0               
		SNZB		F_BIT_HEAD          ;BIT_END中才清零,发完头部会置一
		JP			BIT_HEAD            
		SZB			F_BIT_END           ;发完数据才置1,BIT_END中会清零
		JP			BIT_END             
		SZB			F_BIT1              ;发完数据包头部被置0
		JP			SEND_BIT1           ;还没发够0.625ms低+1.5ms高时,继续进入SEND_BIT1
		SZB			F_BIT0              ;发完数据包头部被置0
		JP			SEND_BIT0
SEND_COUNT:
		INCR		BIT_NUM				;发送的位数
		NOP
		RLCR		DATA1
		RLCR		DATA
		SNZB		C
		JP			BIT_ZERO
		SETB		F_BIT1				;DATA的第七位为1,置发1标志位
		CLR			PLUSE_TIME		
		JP			SEND_BIT1
BIT_ZERO:
		SETB		F_BIT0				;第七位为0,置发0标志位为1
		CLR 		PLUSE_TIME
SEND_BIT0:
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'9'
		SNZB		C
		JP			SEND0
		CLRB		F_BIT0
		JP			SEND_DEAL
SEND_BIT1:
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'17'
		SNZB		C
		JP			SEND0
		CLRB		F_BIT1
SEND_DEAL:
		CLR			PLUSE_TIME
		LD			A,BIT_NUM
		HSUBIA		D'16'
		SNZB		C
		JP			END_SEND_DATA
		CLR			BIT_NUM
		SETB		OUT_DATA
		SETB		F_BIT_END
		JP			END_SEND_DATA
BIT_HEAD:
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'32'
		SNZB		C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'63'
		SNZB		C
		JP			SEND0
		CLR			PLUSE_TIME
		SETB		F_BIT_HEAD
		CLRB		F_BIT0
		CLRB		F_BIT1
		JP			END_SEND_DATA
BIT_END:
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		C
		JP			SEND1
		CLR			PLUSE_TIME
		CLRB		F_BIT_END
		CLRB		F_BIT_HEAD
		CLRB		F_SEND
		JP			SEND0
SEND1:
		SETB		OUT_DATA
		JP			END_SEND_DATA
SEND0:
		CLRB		OUT_DATA
END_SEND_DATA:
;---------------------------- REC DATA ----------------------------;
REMOTE_RECEIVE:
		LD			A,TN
		HSUBIA		D'200'
		SNZB		C
		INCR		TN
		NOP
		SNZB		REC_DATA
		JP			PLUSE_DOWN
PLUSE_UP:
		SZB			F_PLUSE
		JP			END_RECEIVE
		SETB		F_PLUSE
VALUE_JUD:
		LD			A,TN
		HSUBIA		D'2'
		SNZB		C
		JP			ERROR_PLUSE
		LD			A,TN
		HSUBIA		D'16'
		SZB			C
		JP			ERROR_PLUSE
		RLCR		CODE2
		RLCR		CODE1
		LD			A,TN
		HSUBIA		D'9'
		SZB			C
		JP			RECEIVE_BIT1
		CLRB		CODE2,0
		JP			BIT_COUNT
RECEIVE_BIT1:
		SETB		CODE2,0
BIT_COUNT:
		INCR		REMOTE_NUM
		NOP
		LD			A,REMOTE_NUM
		HSUBIA		D'16'
		SNZB		C
		JP			END_RECEIVE1
ERROR_DETECTION:
		CLR			CHECK_BUF1
		LD			A,CODE2
		ANDIA		0F0H					;将CODE2的高两位赋值给CHECK_BUF
		LD			CHECK_BUF,A
		LD			A,CODE1					;CHECK_BUF跟CODE1与运算,算出应该要收到的校验码
		XORR		CHECK_BUF				;发送方的校验码是由DATA和(DATA1的高两位)与运算,然后取高四位组成的
		SZB			CHECK_BUF,7				;根据算出来的校验码,取高四位,赋值给CHECK_BUF1的低四位
		SETB		CHECK_BUF1,3
		SZB			CHECK_BUF,6
		SETB		CHECK_BUF1,2
		SZB			CHECK_BUF,5
		SETB		CHECK_BUF1,1
		SZB			CHECK_BUF,4
		SETB		CHECK_BUF1,0
		LD			A,CODE2
		ANDIA		0FH
		LD			CHECK_BUF,A				;取出收到的校验码,放到CHECK_BUF的低四位中
		LD			A,CHECK_BUF1			;让根据收到的数据算出来的校验码与收到的校验码做对比
		XORA		CHECK_BUF				
		SNZB		Z
		JP			ERROR_PLUSE
END_DETECTION:
		LD			A,CODE1
		LD			CODE1_BUF,A
		LD			A,CODE2
		LD			CODE2_BUF,A
		SETB		F_RECEIVER_OK
		JP			ERROR_PLUSE
PLUSE_DOWN:
		SNZB		F_PLUSE
		JP			END_RECEIVE
		CLRB		F_PLUSE
		LD			A,TN
		HSUBIA		D'2'
		SNZB		C
		JP			ERROR_PLUSE
		LD			A,TN
		HSUBIA		D'16'
		SZB			C
		JP			ERROR_PLUSE
		JP			END_RECEIVE1
ERROR_PLUSE:
		CLR			CODE1
		CLR			CODE2
		CLR			REMOTE_NUM
END_RECEIVE1:
		CLR			TN
END_RECEIVE:
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
;---------------------------- FAN ZERO ----------------------------;
ZERO_PRC:											
		LD			A,ZERO_CNT
		HSUBIA		D'250'
		SNZB		C
		SZINCR		ZERO_CNT
		NOP	
		SNZB		ZERO_FAN
		JP			ZERO_NPULSE
ZERO_PPULSE:									;正
		SZB			F_ZERO_UP
		JP			END_ZERO_PRC
		LD			A,ZERO_CNT
		HSUBIA		D'7'
		SNZB		C
		JP			END_ZERO_PRC
		SETB		F_ZERO_UP
		CLR			ZERO_CNT
		JP			END_ZERO_PRC
ZERO_NPULSE:									;负
		SNZB		F_ZERO_UP
		JP			END_ZERO_PRC
		LD			A,ZERO_CNT
		HSUBIA		D'7'
		SNZB		C
		JP			END_ZERO_PRC
		CLRB		F_ZERO_UP
		CLR			ZERO_CNT
END_ZERO_PRC:
;------------------------------------------------------------------;
TRACE_PRC:											;可控硅驱动
		SZB			F_FAN_HIG
		JP			OUT_SPEED_HIG
		SZB			F_FAN_MID
		JP			OUT_SPEED_MID
		SZB			F_FAN_LOW
		JP			OUT_SPEED_LOW
		SZB			F_FAN_SLOW
		JP			OUT_SPEED_SLOW
		JP			TRACE_OFF
OUT_SPEED_HIG:
		SETB		OUT_FAN_M
		SETB		OUT_FAN_L
		SETB		OUT_FAN_S
		LD			A,ZERO_CNT
		HSUBIA		D'15'
		SNZB		C
		JP			TRACE_OFF
		LD			A,ZERO_CNT
		HSUBIA		D'35'
		SZB			C
		JP			TRACE_OFF
		CLRB		OUT_FAN_H
		JP			END_TRACE_PRC
OUT_SPEED_MID:
		SETB		OUT_FAN_H
		SETB		OUT_FAN_L
		SETB		OUT_FAN_S
		LD			A,ZERO_CNT
		HSUBIA		D'20'
		SNZB		C
		JP			TRACE_OFF
		LD			A,ZERO_CNT
		HSUBIA		D'40'
		SZB			C
		JP			TRACE_OFF
		CLRB		OUT_FAN_M
		JP			END_TRACE_PRC
OUT_SPEED_LOW:
		SETB		OUT_FAN_M
		SETB		OUT_FAN_H
		SETB		OUT_FAN_S
		LD			A,ZERO_CNT
		HSUBIA		D'25'
		SNZB		C
		JP			TRACE_OFF
		LD			A,ZERO_CNT
		HSUBIA		D'45'
		SZB			C
		JP			TRACE_OFF
		CLRB		OUT_FAN_L
		JP			END_TRACE_PRC
OUT_SPEED_SLOW:
		SETB		OUT_FAN_M
		SETB		OUT_FAN_L
		SETB		OUT_FAN_H
		LD			A,ZERO_CNT
		HSUBIA		D'30'
		SNZB		C
		JP			TRACE_OFF
		LD			A,ZERO_CNT
		HSUBIA		D'50'
		SZB			C
		JP			TRACE_OFF
		CLRB		OUT_FAN_S
		JP			END_TRACE_PRC
TRACE_OFF:		
		SETB		OUT_FAN_H
		SETB		OUT_FAN_M
		SETB		OUT_FAN_L
		SETB		OUT_FAN_S
END_TRACE_PRC:
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
		LDIA		B'11111111'
		LD			P0,A
		LDIA		B'00111111'
		LD			P1,A
		LDIA		B'00000100'
		LD			P2,A
		
		LDIA		B'10000000'				;P0.3 OUT_HIG
		LD			P0CL,A
		LDIA		B'00101010'				;P0.7 REC_DAT	P0.6 SEND_DAT	P0.5 OUT_LED
		LD			P0CH,A					;P0.4 OUT_LOW
		LDIA		B'10101010'				;P1.3/2/1/0 OUTPUT
		LD			P1CL,A
		LDIA		B'00110010'				;P1.6 NTC	P1.5/4 OUT_OSC/HEAT_LOW
		LD			P1CH,A
		LDIA		B'10001001'				;P2.2 OUT_FAN_H	P2.1 FAN_ZERO P2.0 HEAT_ZERO
		LD			P2C,A
		
		LDIA		B'11111111'
		LD			P0,A
		LDIA		B'00111111'
		LD			P1,A
		LDIA		B'00000100'
		LD			P2,A
		
		CLRA
		OPTION
		CLRB		TMR1C,TON
		CLRB		INT_EN,EN_T1
		CLRB		INT_FLAG,F_T1
		LDIA		81H
		LD			TMR1C,A
		LDIA		83H
		LD			TMR1,A
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
		
		LDIA		D'30'
		LD			OVER_CNT1,A
		LDIA		D'250'
		LD			T_ADC_DELAY,A
		;SETB		F_POWER_LOW
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
		CALL		TIMER_SUB		;'0'
		CALL		SENSOR_SUB		;'1'
		CALL		WORK_SUB		;'2'
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		INCR		DISP_NUM
		NOP
		LD			A,DISP_NUM
		HSUBIA		D'3'
		SNZB		C
		JP			T1
		CLR			DISP_NUM
;------------------------------------------------------------------;
ZERO_JUD:								; 8ms
		LD			A,T_ZERO
		HSUBIA		D'250'
		SZB			C
		JP			ZERO_JUD1;3			; OVER 32ms NO ZERO PULSE
		LD			A,T_NPULSE
		HSUBIA		D'95'				; VOLT<85V?
		SNZB		C
		JP    		ZERO_JUD2
ZERO_JUD1:	
		CLR     	LOSE_TIME2
		CLR			LOSE_TIME3
		INCR   		LOSE_TIME1
		NOP	
		LD   		A,LOSE_TIME1
		HSUBIA  	D'60';'125'
		SZB  		C
		;SETB		F_POWER_LOW
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
		SETB		OUT_HEAT_H
		SETB		OUT_HEAT_L
		SETB  		OUT_HIG
		SETB  		OUT_LOW
		SETB		OUT_FAN_H
		SETB		OUT_FAN_L
		SETB		OUT_FAN_M
		SETB		OUT_FAN_S
		SETB		OUT_OSC
		JP			END_ZERO_JUD
ZERO_JUD2:	
		CLR			LOSE_TIME1
		CLR			LOSE_TIME3
		INCR		LOSE_TIME2
		NOP	
		LD			A,LOSE_TIME2
		HSUBIA		D'60'
		SNZB		C
		JP			END_ZERO_JUD
		CLRB		F_NOPOWER
		SNZB		F_POWER_LOW
		JP			END_ZERO_JUD
POWER_ON:									; 上电
		CLRB		F_POWER_LOW
END_ZERO_JUD:
;------------------------------------------------------------------;
T1:
		INCR		T100MS_TIMER
		LD			A,T100MS_TIMER
		HSUBIA		D'100'
		SNZB		C
		JP			TIMER_SUB1
T_05SEC:
		CLR			T100MS_TIMER
		LD			A,T_SEND
		HSUBIA		D'250'
		SNZB		C
		INCR		T_SEND
		
		LD			A,T_REC_TIMEOUT
		HSUBIA		D'250'
		SNZB		C
		INCR		T_REC_TIMEOUT
FAN_DELAY:
		SNZB		F_FAN_DELAY
		JP			END_FAN_DELAY
		LD			A,T_FAN_DELAY
		HSUBIA		D'250'
		SNZB		C
		INCR		T_FAN_DELAY
END_FAN_DELAY:
;------------------------------------------------------------------;
TIMER_SUB1:	
		SNZB		F_RECEIVER_OK		; 超时无数据回传，断电
		JP			RECORD_SEND_DATA
		CLR			T_REC_TIMEOUT
		CLRB		F_RECEIVER_OK
		LD			A,CODE1_BUF
		XORA		FLAG1
		SZB			Z
		JP			TIMER_SUB10
		LD			A,CODE1_BUF
		LD			FLAG1,A
TIMER_SUB10:
		LD			A,CODE2_BUF
		XORA		FLAG2
		SZB			Z
		JP			TIMER_SUB2
		LD			A,CODE2_BUF
		LD			FLAG2,A
TIMER_SUB2:
		LD			A,T_REC_TIMEOUT
		HSUBIA		D'50'
		SNZB		C
		JP			RECORD_SEND_DATA
		CLRB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
;------------------------------------------------------------------;
RECORD_SEND_DATA:
		LD			A,T_SEND			; 1.5S发一次数据
		HSUBIA		D'15'
		SNZB		C
		JP			END_TIMER_SUB
		CLR			T_SEND
		CLR			BIT_NUM
		LD			A,DATA_BUF
		LD			DATA,A
		LD			A,DATA1_BUF
		LD			DATA1,A
SEND_CHECK:
		LDIA		0C0H					
		ANDR		DATA1				;把DATA1除了高两位,都清零
		LD			A,DATA1
		LD			CHECK_BUF2,A		;CHECK_BUF2中存放了DATA1的高两位
		LD			A,DATA
		XORR		CHECK_BUF2			;让DATA与DATA1的高两位与运算,结果的前6位放进校验位中
		SZB			CHECK_BUF2,7
		SETB		DATA1,5
		SZB			CHECK_BUF2,6
		SETB		DATA1,4
		SZB			CHECK_BUF2,5
		SETB		DATA1,3
		SZB			CHECK_BUF2,4
		SETB		DATA1,2
		SZB			CHECK_BUF2,3
		SETB		DATA1,1
		SZB			CHECK_BUF2,2
		SETB		DATA1,0				;DATA1此时的结构:高两位为F_NOPOWER和F_POWER_LOW,后六位为校验位
		CLRB		F_BIT_HEAD
		SETB		F_SEND
;------------------------------------------------------------------;		
END_TIMER_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
WORK_SUB:
		LD			A,DISP_NUM
		XORIA		D'2'
		SNZB		Z
		JP			END_WORK_SUB
		SZB			F_NOPOWER
		JP			SHUT_ALL
		SZB			F_POWER_LOW
		JP			SHUT_ALL
		SZB			F_HEAT_ONOFF
		JP			HEAT_MODE
		JP			SHUT_ALL
SHUT_ALL:
		SETB		LED_HEAT				;关暖风机显示灯
		SETB		OUT_HIG
		SETB		OUT_LOW
		SZB			F_FAN_DELAY
		JP			FAN_DELAY_CLOSE
		SETB		OUT_HEAT_H
		SETB		OUT_HEAT_L
		JP			END_WORK_SUB1
FAN_DELAY_CLOSE:
		LD			A,T_FAN_DELAY
		HSUBIA		D'150'
		SNZB		C
		JP			END_WORK_SUB1
		SETB		OUT_HEAT_H
		SETB		OUT_HEAT_L
		JP			END_WORK_SUB1
;------------------------------------------------------------------;	
HEAT_MODE:

		SETB		OUT_FAN_H
		SETB		OUT_FAN_M
		SETB		OUT_FAN_L
		SETB		OUT_FAN_S
		SETB		OUT_HIG
		SETB		OUT_LOW
		SETB		OUT_HEAT_H
		SETB		OUT_HEAT_L
		CLRB		LED_HEAT				;开暖风机显示灯
		SZB			F_HEAT_LOW
		CLRB		OUT_LOW
		SZB			F_HEAT_HIG
		CLRB		OUT_HIG
		SZB			F_HEAT_F_LOW
		CLRB		OUT_HEAT_L
		SZB			F_HEAT_F_HIG
		CLRB		OUT_HEAT_H
		SZB			F_FAN_HIG			;HF档位
		CLRB		OUT_FAN_H
		SZB			F_FAN_SLOW
		CLRB		OUT_FAN_S	
		JP			OSC_JUD		
;------------------------------------------------------------------;
OSC_JUD:
		SNZB		F_OSC
		SETB		OUT_OSC
		SZB			F_OSC
		CLRB		OUT_OSC
;------------------------------------------------------------------;
END_WORK_SUB1:
		LD			A,T_ROOM_REAL
		XORA		DATA_BUF
		SNZB		Z
		JP			REFLASH_DATA
		LD			A,FLAG3
		XORA		DATA1_BUF
		SNZB		Z
		JP			REFLASH_DATA
		JP			END_WORK_SUB
REFLASH_DATA:								
		LD			A,T_ROOM_REAL
		LD			DATA_BUF,A
		LD			A,FLAG3
		LD			DATA1_BUF,A
		LDIA		D'15'
		LD			T_SEND,A		
END_WORK_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
ADC_GET:
		SETB		SYS_GEN,ADC_EN
		NOP	
		NOP		
		LDIA		B'10000100'				;AN8
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
		LD      	A,ADDATA
		ADDR    	NTC_RAM1
		LDIA    	D'0'
		ADDCR   	NTC_RAM2
DATA_PROC:
		INCR   		ADC_NUM
		LD			A,ADC_NUM
		XORIA		D'0'
		SNZB		Z
		JP      	END_ADC_GET
		LD   		A,NTC_RAM2
		ADDR    	NTC_RAM
		RRCR    	NTC_RAM
		CLR     	NTC_RAM1
		CLR     	NTC_RAM2
END_ADC_GET:
		RET
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
		LD   		A,NTC_RAM
		HSUBIA  	D'205'
		SZB  		C
		JP      	OVER_140F
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
		LD   		T_ROOM_BUF,A
		JP			TEMP_PROC2
TEMP_PROC1:
		LD			A,NTC_RAM			;查华氏度表
		HSUBIA		D'58'
		LD			TABLE_SPL,A
		LDIA		10H
		ADDR		TABLE_SPL
		LDIA    	07H
		LD			TABLE_SPH,A
		TABLEA	
		LD      	T_ROOM_BUF,A
		DECR		T_ROOM_BUF			;温度补偿
		DECR		T_ROOM_BUF
TEMP_PROC2:	
		INCR		OVER_CNT1
		SNZB		F_ADC_FIRST
		JP			TEMP_PROC20
		LD			A,T_ROOM_F
		HSUBIA		D'33'
		SZB			C
		JP			TEMP_PROC21
TEMP_PROC20:								; 第一次检测值
		LD			A,T_ROOM_BUF
		LD			T_ROOM_F,A
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC21:	
		LD			A,T_ROOM_BUF
		HSUBA		T_ROOM_F
		SNZB		C
		JP			TEMP_PROC23
		LD			A,T_ROOM_F
		HSUBA		T_ROOM_BUF
		SNZB		C
		JP			TEMP_PROC22
		CLR			OVER_CNT1			; 温度相等
		JP			TEMP_PROC3
TEMP_PROC22:								; 温度升高
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		INCR		T_ROOM_F
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC23:								; 温度降低
		LD			A,OVER_CNT1
		HSUBIA		D'20'
		SNZB		C
		JP			TEMP_PROC3
		DECR		T_ROOM_F
		CLR			OVER_CNT1
		JP			TEMP_PROC3
TEMP_PROC3:									; 温度锁住?
		SZB			F_TEMP_HOLD
		JP			TEMP_PROC4
		LD			A,T_ROOM_F
		LD			T_ROOM_REAL,A
TEMP_PROC4:
END_SENSOR_SUB:
		RET
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
