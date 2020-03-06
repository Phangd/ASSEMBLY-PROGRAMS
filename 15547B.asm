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
		LED_COM1		EQU	P1,6
		LED_COM2        EQU	P1,0
		LED_COM3        EQU	P0,0
		LED_SEG1        EQU	P0,6
		LED_SEG2        EQU	P0,7
		LED_SEG3        EQU	P0,1
		LED_SEG4        EQU	P0,3
		LED_SEG5        EQU	P0,2
		LED_SEG6        EQU	P0,5
		LED_SEG7        EQU	P0,4

		ADC_KEY1		EQU	P1,4
		ADC_KEY2		EQU	P1,3
		
		REMOTE			EQU	P1,5
		OUT_BUZ			EQU	P1,2
		DOWN_SW			EQU	P1,1
		OUT_DATA		EQU	P2,1
		REC_DATA		EQU	P2,2
;******************************************************************;		
		ACC_BUF			EQU	30H
		STATUS_BUF      EQU	31H
		FLAG1           EQU	32H
		FLAG2	      	EQU 33H
		FLAG3			EQU	34H
		FLAG4			EQU	35H
		FLAG5			EQU	36H
		FLAG6			EQU	37H
		FLAG7			EQU	38H
		T1MS_TIMER		EQU	39H
		DISP_NUM        EQU	3AH
		KEY_VALUE       EQU	3BH
		KEY_VALUE0		EQU	3CH
		KEY_RAM1        EQU	3DH
		KEY_RAM2        EQU	3EH
		KEY_DELAY       EQU	3FH
		KEY_TIMER       EQU	40H
		T100MS_TIMER    EQU	41H
		T250MS_TIMER    EQU	42H
		T_SETUP_F       EQU	43H 
		T_SETUP_C      	EQU	44H
		T_SETUP_LOW     EQU	45H
		T_SETUP_MAX     EQU	46H
		T_HEAT_ON       EQU	47H
		T_SEC0          EQU	48H
		T_SEC           EQU	49H
		T_MIN           EQU	4AH
		T_HOUR          EQU	4BH
		T_FLASH         EQU	4CH
		T_BUZ           EQU	4DH
		OVER_CNT2       EQU	4EH
		FAN_WORK        EQU	4FH
		FAN_WORK_BUF    EQU	50H
		HEAT_WORK       EQU	51H
		HEAT_WORK_BUF   EQU	52H
		HEAT_SETUP      EQU	53H
		LIGHON          EQU	54H
		T_FAN_DELAY		EQU	55H
		T_TEMP_HOLD 	EQU	56H
		T_TEMP_HOLD0	EQU	57H
		LEDTR1			EQU	58H 
		LEDTR2      	EQU	59H
		LEDTR3			EQU	5AH
		LED_BUF1		EQU	5BH
		LED_BUF2    	EQU	5CH
		BIT_NUM			EQU	5DH
		DATA        	EQU	5EH
		DATA1           EQU	5FH
		DATA_BUF        EQU	60H
		DATA1_BUF       EQU	61H
		PLUSE_TIME      EQU	62H
		T_SEND          EQU	63H
		T_ROOM_REAL 	EQU	64H
		T_ROOM_DISP     EQU	65H
		TN				EQU	66H
		TN1             EQU	67H
		CODE11         	EQU	68H
		CODE12          EQU	69H
		REMOTE_NUM      EQU	6AH
		REMOTE_NUM1		EQU	6BH
		T_REC_TIMEOUT	EQU	6CH
		CHECK_BUF	    EQU	6DH			;SEND CHECK BUF
		CHECK_BUF1		EQU	6EH			;RECEIVE CHECK BUF
		CHECK_BUF2		EQU	6FH         ;RECEIVE CHECK BUF1
		CODE1_BUF		EQU	70H
		CODE2_BUF		EQU	71H
		T_DOWN			EQU	72H
		T_NODOWN		EQU	73H
		CODE0			EQU	74H
		CODE1           EQU	75H
		CODE2           EQU	76H
		CODE3           EQU	77H
		CODE4           EQU	78H
		CODE5           EQU	79H
		CODE6           EQU	7AH
		CODE7           EQU	7BH
		CODE8           EQU	7CH
		CODE9           EQU	7DH
		DIS_NUM			EQU	7EH
;******************************************************************;
		F_T1MS			EQU	T1MS_TIMER,3
		
		;FLAG1
		F_BUZ           EQU	FLAG1,7
		F_PROTECT       EQU	FLAG1,6
		F_AUTO         	EQU	FLAG1,5
		F_TEMP_130F		EQU	FLAG1,4
		F_FAN_ONOFF     EQU	FLAG1,3
		F_ONKEY			EQU	FLAG1,2
		F_TIMER_FIRST	EQU	FLAG1,1
		F_TEMP_FIRST 	EQU	FLAG1,0
		;FLAG2                    
		F_TEMP_MODE     EQU	FLAG2,7
		F_TEMP_SET     	EQU	FLAG2,6
		F_TIMER_SET     EQU	FLAG2,5
		F_TIMER_OFF    	EQU	FLAG2,4	 
		F_FAST          EQU	FLAG2,3
		F_CHANGE        EQU	FLAG2,2
		F_KEY_MODE		EQU	FLAG2,1
		F_BUMP_START	EQU	FLAG2,0
		;FLAG3(SEND)
		F_OSC			EQU	FLAG3,7
		F_FAN_HIG       EQU	FLAG3,6
		F_FAN_MID       EQU	FLAG3,5
		F_FAN_LOW       EQU	FLAG3,4
		F_FAN_SLOW      EQU	FLAG3,3
		F_HEAT_HIG		EQU	FLAG3,2
		F_HEAT_LOW		EQU	FLAG3,1
		F_HEAT_F_HIG	EQU	FLAG3,0
		;FLAG4(SEND)
		F_HEAT_F_LOW	EQU	FLAG4,7
		F_HEAT_ONOFF	EQU	FLAG4,6
		F_FAN_DELAY		EQU	FLAG4,5
		F_TEMP_HOLD		EQU	FLAG4,4
		F_CHECK1		EQU	FLAG4,3
		F_CHECK2		EQU	FLAG4,2
		F_CHECK3        EQU	FLAG4,1
		F_CHECK4        EQU	FLAG4,0
		;FLAG5
		F_SEND       	EQU	FLAG5,7
		F_RECEIVER_OK   EQU	FLAG5,6
		F_BIT_HEAD      EQU	FLAG5,5
		F_BIT_END       EQU	FLAG5,4
		F_BIT1    		EQU	FLAG5,3
		F_BIT0        	EQU	FLAG5,2
		F_PLUSE  		EQU	FLAG5,1
		F_DOWN			EQU	FLAG5,0
		;FLAG6(RECEIVE)
		F_NOPOWER		EQU	FLAG6,7
		F_POWER_LOW     EQU	FLAG6,6
		F_CHECK5        EQU	FLAG6,5
		F_CHECK6        EQU	FLAG6,4
		F_CHECK7        EQU	FLAG6,3
		F_CHECK8        EQU	FLAG6,2
		F_CHECK9        EQU	FLAG6,1
		F_CHECK10       EQU	FLAG6,0
		;FLAG7
		F_NODOWN		EQU	FLAG7,0
		F_RISE_YK		EQU	FLAG7,1
		F_REMOTE		EQU	FLAG7,2
		F_DISBUF		EQU	FLAG7,3
		
		F_LED_1B		EQU	LEDTR1,7
		F_LED_1A		EQU	LEDTR1,6
		F_LED_1C		EQU	LEDTR1,5
		F_LED_1D		EQU	LEDTR1,4
		F_LED_1E		EQU	LEDTR1,3
		F_LED_1F		EQU	LEDTR1,2
		F_LED_1G		EQU	LEDTR1,1

		F_LED_2A		EQU	LEDTR2,7
		F_LED_2B		EQU	LEDTR2,6
		F_LED_2C		EQU	LEDTR2,5
		F_LED_2D		EQU	LEDTR2,4
		F_LED_2E		EQU	LEDTR2,3
		F_LED_2F		EQU	LEDTR2,2
		F_LED_2G		EQU	LEDTR2,1

		F_LED_TIMER		EQU	LEDTR3,0
		F_LED_AUTO		EQU	LEDTR3,1
		F_LED_FAN1		EQU	LEDTR3,2
		F_LED_FAN2		EQU	LEDTR3,3
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
BUZZER:
		LDIA		04H
		XORR		P1
		JP			END_BUZZ
BUZZ_OFF:
		CLRB		OUT_BUZ
END_BUZZ:
;--------------------------- 1MS TIMER ----------------------------;
TIMER0:
		INCR		T1MS_TIMER
		INCR		DIS_NUM
		LD			A,DIS_NUM
		HSUBIA		D'5'
		SZB			C
		CLR			DIS_NUM
END_TIMER0:
;---------------------------- REMOTE ------------------------------;
REMOTE_RECEIVE:	
		LD   		A,TN
		HSUBIA  	D'200'
		SNZB		C
		INCR 		TN
		SZB			REMOTE
		JP			YK_NPULSE
YK_PPULSE:	
		SZB			F_RISE_YK
		JP			END_REMOTE
		SETB		F_RISE_YK			; 上升沿
		LD			A,TN
		HSUBIA		D'20';12
		SZB			C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA		D'8';2
		SNZB		C
		JP			ERROR_REMOTE
		CLR			TN
		JP			END_REMOTE
YK_NPULSE:	
		SNZB		F_RISE_YK
		JP			END_REMOTE
		CLRB		F_RISE_YK			; 下降沿
YK_NPULSE1:		
		RLCR		CODE0
		RLCR		CODE2
		RLCR		CODE3
		RLCR		CODE4
		RLCR		CODE5
		RLCR		CODE6
		RLCR		CODE7
		RLCR		CODE8
		RLCR		CODE9
		LD			A,TN
		HSUBIA		D'20'				; >2ms?
		SZB			C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA		D'7';12				; <1ms?
		SZB			C
		JP			YK_BIT1
		LD			A,TN				; >.2ms?
		HSUBIA		D'2'
		SNZB		C
		JP			ERROR_REMOTE
YK_BIT0:	
		CLRB		CODE0,0
		JP			YK_BITJUD
YK_BIT1:	
		SETB		CODE0,0
YK_BITJUD:		
		CLR			TN
		INCR		REMOTE_NUM
		LD			A,REMOTE_NUM
		HSUBIA		D'68';64
		SNZB		C
		JP			END_REMOTE
		SETB		F_REMOTE
		LD			A,CODE0
		LD			CODE1,A
		JP			END_REMOTE
ERROR_REMOTE:		
		CLR			TN
		CLR			CODE0
		CLR			REMOTE_NUM
END_REMOTE:
;------------------------------------------------------------------;
DISP_LED:
		SETB		LED_COM1
		SETB		LED_COM2
		SETB		LED_COM3
		CLRB		LED_SEG1
		CLRB		LED_SEG2
		CLRB		LED_SEG3
		CLRB		LED_SEG4
		CLRB		LED_SEG5
		CLRB		LED_SEG6
		CLRB		LED_SEG7
		
		LD   		A,DIS_NUM
		ADDR		PCL
		JP			DISP_LED1
		JP			DISP_LED2
		JP			DISP_LED3
		JP			DISP_LED3
		JP			DISP_LED3
		JP			DISP_LED4
DISP_LED1:
		SZB			LEDTR1,7
		SETB		LED_SEG1
		SZB			LEDTR1,6
		SETB		LED_SEG2
		SZB			LEDTR1,5
		SETB		LED_SEG3
		SZB			LEDTR1,4
		SETB		LED_SEG4
		SZB			LEDTR1,3
		SETB		LED_SEG5
		SZB			LEDTR1,2
		SETB		LED_SEG6
		SZB			LEDTR1,1
		SETB		LED_SEG7
		
		CLRB		LED_COM1
		JP      	DISP_LED4
;------------------------------------------------------------------;
DISP_LED2:
		SZB			LEDTR2,7
		SETB		LED_SEG1
		SZB			LEDTR2,6
		SETB		LED_SEG2
		SZB			LEDTR2,5
		SETB		LED_SEG3
		SZB			LEDTR2,4
		SETB		LED_SEG4
		SZB			LEDTR2,3
		SETB		LED_SEG5
		SZB			LEDTR2,2
		SETB		LED_SEG6
		SZB			LEDTR2,1
		SETB		LED_SEG7
		
		CLRB		LED_COM2
		JP      	DISP_LED4
;------------------------------------------------------------------;
DISP_LED3:
		SZB  		F_LED_AUTO
		SETB		LED_SEG2
		SZB			F_LED_TIMER
		SETB		LED_SEG1
		
		SZB			F_LED_FAN2
		SETB		LED_SEG7
		SZB			F_LED_FAN1
		SETB		LED_SEG6
		CLRB		LED_COM3
DISP_LED4:
;--------------------------- SEND DATA ----------------------------;
SEND_DATA:									
		SNZB		F_SEND				;BIT_END中才清零
		JP			SEND0    
		SNZB		F_BIT_HEAD          ;BIT_END中才清零,发完头部会置一
		JP			BIT_HEAD            
		SZB			F_BIT_END           ;发完数据才置1,BIT_END中会清零
		JP			BIT_END   
		SZB			F_BIT1              ;发完数据包头部被置0
		JP			SEND_BIT1           
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
SEND_BIT0:								;"0"
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'				;0.625MS 高
		SNZB		C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'9'				;0.5MS 低
		SNZB		C
		JP			SEND0
		CLRB		F_BIT0
		JP			SEND_DEAL
SEND_BIT1:								;"1"
		INCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'				;0.625ms 高
		SNZB		C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'17'				;1.5ms 低
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
;--------------------------- REC DATA -----------------------------;
REMOTE_RECEIVE1:
		LD			A,TN1
		HSUBIA		D'200'
		SNZB		C
		INCR		TN1
		NOP
		SNZB		REC_DATA
		JP			PLUSE_DOWN
PLUSE_UP:
		SZB			F_PLUSE
		JP			END_RECEIVE
		SETB		F_PLUSE
VALUE_JUD:
		LD			A,TN1
		HSUBIA		D'2'
		SNZB		C
		JP			ERROR_PLUSE
		LD			A,TN1
		HSUBIA		D'16'
		SZB			C
		JP			ERROR_PLUSE
		RLCR		CODE12
		RLCR		CODE11
		LD			A,TN1
		HSUBIA		D'9'
		SZB			C
		JP			RECEIVE_BIT1
		CLRB		CODE12,0
		JP			BIT_COUNT
RECEIVE_BIT1:
		SETB		CODE12,0
BIT_COUNT:
		INCR		REMOTE_NUM1
		NOP
		LD			A,REMOTE_NUM1
		HSUBIA		D'16'
		SNZB		C
		JP			END_RECEIVE1
ERROR_DETECTION:								;发送方差错检测:将CODE11与CODE12,7/6与运算,区高6位放入CODE12,5/4/3/2/1/0
		CLR			CHECK_BUF2					;接收方将收到的CODE11与与CODE12,7/6与运算,判断结果是否与收到的检测位一致
		LD			A,CODE12
		ANDIA		0C0H
		LD			CHECK_BUF1,A				;将CODE12的最高两位赋值给CHECK_BUF1
		LD			A,CODE11
		XORR		CHECK_BUF1					;让CODE12的高两位与CODE11异或
		SZB			CHECK_BUF1,7				;根据收到的数据,用CODE11与CODE12高两位异或,然后根据结果
		SETB		CHECK_BUF2,5				;赋值给CHECK_BUF2的5/4/3/2/1/0,下一步要用这6位与收到的检测位作比较
		SZB			CHECK_BUF1,6
		SETB		CHECK_BUF2,4
		SZB			CHECK_BUF1,5
		SETB		CHECK_BUF2,3
		SZB			CHECK_BUF1,4
		SETB		CHECK_BUF2,2
		SZB			CHECK_BUF1,3
		SETB		CHECK_BUF2,1
		SZB			CHECK_BUF1,2
		SETB		CHECK_BUF2,0
		LD			A,CODE12
		ANDIA		3FH							;取出6个检测位(CODE2.5/4/3/2/1/0)
		LD			CHECK_BUF1,A				;放在CHECK_BUF1的5/4/3/2/1/0
		LD			A,CHECK_BUF2				;让根据收到的数据算出来的校验码与收到的校验码做对比
		XORA		CHECK_BUF1					;看结果是否一致
		SNZB		Z
		JP			ERROR_PLUSE					;不一致,跳转到错误处理
END_DETECTION:		
		LD			A,CODE11
		LD			CODE1_BUF,A				;CODE11--T_ROOM_F
		LD			A,CODE12
		LD			CODE2_BUF,A
		SETB		F_RECEIVER_OK
		JP			ERROR_PLUSE
PLUSE_DOWN:
		SNZB		F_PLUSE
		JP			END_RECEIVE
		CLRB		F_PLUSE
		LD			A,TN1
		HSUBIA		D'2'
		SNZB		C
		JP			ERROR_PLUSE
		LD			A,TN1
		HSUBIA		D'16'
		SZB			C
		JP			ERROR_PLUSE
		JP			END_RECEIVE1
ERROR_PLUSE:
		CLR			CODE11
		CLR			CODE12
		CLR			REMOTE_NUM1
END_RECEIVE1:
		CLR			TN1
END_RECEIVE:
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
		LDIA		B'00000001'
		LD			P0,A
		LDIA		B'01000011'
		LD			P1,A
		LDIA		B'00000011'			;2.1 out_data 初值1 2.0 rec_data 初值1
		LD			P2,A
		
		LDIA		B'10101010'
		LD			P0CL,A
		LD			P0CH,A
		LDIA		B'01100010'			;P1.1倾倒 P1.2BUZ P1.3ADC_KEY2 P1.4ADC_KEY2
		LD			P1CL,A				;P1.5REMOTE
		LDIA		B'10000101'
		LD			P1CH,A
		LDIA		B'01010001'			;P2.0NULL P2.1SEND_DATA P2.2REC_DATA(输入，不带上拉)
		LD			P2C,A
		
		LDIA		B'00000001'
		LD			P0,A
		LDIA		B'01000011'
		LD			P1,A
		LDIA		B'00000011'
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
		LDIA		7FH
		SUBA		MP
		SNZB		C
		JP			CLR_LOOP
INIT_RAM:
		SETB		INT_EN,EN_T1
		SETB		SYS_GEN,INT_GEN
		SETB		TMR1C,TON
		
		LDIA    	D'75'
		LD   		T_SETUP_F,A
		LD   		T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA		D'3'
		SUBR		T_SETUP_LOW
		LDIA    	D'2'
		ADDR    	T_SETUP_MAX
		LDIA		D'24'
		LD			T_SETUP_C,A
		
		CLRB		F_PROTECT
		CLR			T_BUZ
		SETB		F_BUZ
		LDIA		D'1'
		LD			FAN_WORK,A
		LD			FAN_WORK_BUF,A
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;			MAINLOOP
MAINLOOP:
		CLRWDT
		CALL		ADC_GET					;Done
		SNZB		F_T1MS
		JP			MAINLOOP
		CLRB		F_T1MS
		CLRWDT
		CALL		DISPLAY					;2	Done
		CALL		TIMER_SUB				;	Done	
		CALL		SCANKEY					;1	Done
		JP			SCANREMOTE				;0
MAINLOOP2:		
		CALL		TEMP_JUD				;3	Done
		CALL		WORK_SUB				;4	Done
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;			TIMER_SUB
TIMER_SUB:		
		INCR		T100MS_TIMER
		LD			A,T100MS_TIMER
		HSUBIA		D'100'
		SNZB		C
		JP			T1
T_05SEC:
		CLR			T100MS_TIMER
		INCR		T_FLASH
		LD			A,T_FLASH
		HSUBIA		D'50'
		SZB			C
		CLRB		F_TIMER_SET
		LD			A,T_FLASH
		HSUBIA		D'100'
		SZB			C
		CLRB		F_TEMP_SET
T_05SEC1:
		LD			A,T_SEC0			; 长按开机键4秒进入130F模式计时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_SEC0
		
		LD			A,T_HEAT_ON			; 加热模块启动延时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_HEAT_ON
		
		LD			A,T_FAN_DELAY		; 风扇启动延时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_FAN_DELAY
		
		LD			A,T_SEND			; 发送状态计时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_SEND
		
		LD			A,T_REC_TIMEOUT		; 接收A板信号计时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_REC_TIMEOUT
		
		LD			A,T_DOWN			; 倾倒计时
		HSUBIA		D'250'
		SNZB		C
		INCR		T_DOWN
		
		SNZB		F_NODOWN			; 倾倒后抬起计时
		JP			T_05SEC2
		LD			A,T_NODOWN
		HSUBIA		D'250'
		SNZB		C
		INCR		T_NODOWN
		
T_05SEC2:
		INCR		T_TEMP_HOLD0
		LD			A,T_TEMP_HOLD0
		HSUBIA		D'10'
		SNZB		C
		JP			T_05SEC3
		CLR			T_TEMP_HOLD0
		INCR		T_TEMP_HOLD			; 1s+1
		NOP
T_05SEC3:
;------------------------------------------------------------------;
TIMER_JUD:
		INCR    	T_SEC
		LD   		A,T_SEC
		HSUBIA  	D'180'
		SNZB  		C
		JP      	END_TIMER_JUD
		CLR     	T_SEC				; 18S
		INCR    	T_MIN
		LD   		A,T_MIN
		HSUBIA  	D'20'
		SNZB  		C
		JP      	END_TIMER_JUD
		CLR     	T_MIN				; 1H
		LD   		A,T_HOUR
		HSUBIA  	D'1'
		SNZB  		C
		JP     		END_TIMER_JUD
		DECR   		T_HOUR
		LD   		A,T_HOUR
		HSUBIA  	D'1'
		SZB  		C
		JP      	END_TIMER_JUD
		CLRB  		F_HEAT_ONOFF
		CLRB  		F_FAN_ONOFF
		CLRB		F_TIMER_OFF
		CLRB  		F_AUTO
END_TIMER_JUD:
;------------------------------------------------------------------;
T1:
		INCR		T250MS_TIMER
		LD			A,T250MS_TIMER
		HSUBIA		D'250'
		SNZB		C
		JP			END_T1
		CLR			T250MS_TIMER
		INCR		LIGHON
END_T1:
;------------------------------------------------------------------;
TIMER_SUB1:	
		SNZB		F_RECEIVER_OK		; 超时无数据回传，断电
		JP			TIMER_SUB2
		CLR			T_REC_TIMEOUT
		CLRB		F_RECEIVER_OK
		LD			A,CODE1_BUF
		XORA		T_ROOM_REAL
		SZB			Z
		JP			TIMER_SUB10
		LD			A,CODE1_BUF
		LD			T_ROOM_REAL,A
TIMER_SUB10:
		LD			A,CODE2_BUF
		XORA		FLAG6
		SZB			Z
		JP			TIMER_SUB2
		LD			A,CODE2_BUF
		LD			FLAG6,A
TIMER_SUB2:
		LD			A,T_REC_TIMEOUT
		HSUBIA		D'50'
		SNZB		C
		JP			BUZ_TIMER
		CLRB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
;------------------------------------------------------------------;
BUZ_TIMER:
		SNZB		F_BUZ
		JP			END_BUZ_TIMER
		INCR   		T_BUZ
		LD   		A,T_BUZ
		HSUBIA  	D'160'
		SZB  		C
		CLRB  		F_BUZ
END_BUZ_TIMER:
;------------------------------------------------------------------;
RECORD_SEND_DATA:
		LD			A,T_SEND
		HSUBIA		D'15'
		SNZB		C
		JP			STATUS_TIMEOUT
		CLR			T_SEND
		CLR			BIT_NUM
		CLR			PLUSE_TIME
		LD			A,DATA_BUF
		LD			DATA,A
		LD			A,DATA1_BUF
		LD			DATA1,A
SEND_CHECK:
		LDIA		0F0H
		ANDR		DATA1					;把DATA1除了高两位,都清零
		LD			A,DATA1
		LD			CHECK_BUF,A				;CHECK_BUF中存放了DATA1的高4位
		LD			A,DATA
		XORR		CHECK_BUF				;让DATA与DATA1的高4位异或,结果的高4位放进校验位中
		SZB			CHECK_BUF,7
		SETB		DATA1,3
		SZB			CHECK_BUF,6
		SETB		DATA1,2
		SZB			CHECK_BUF,5
		SETB		DATA1,1
		SZB			CHECK_BUF,4
		SETB		DATA1,0
		CLRB		F_BIT_HEAD				;DATA1此时的结构:高4位为F_HEAT_F_LOW/F_TEMP_HOLD/F_HEAT_ONOFF/F_FAN_DELAY
		SETB		F_SEND					;低4位为校验位
;------------------------------------------------------------------;
STATUS_TIMEOUT:
		LD			A,T_REC_TIMEOUT
		HSUBIA		D'50'
		SNZB		C
		JP			FALL_DOWN_DECTION
		CLRB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
;------------------------------------------------------------------;
FALL_DOWN_DECTION:
		SNZB		DOWN_SW
		JP			FALL_DOWN
		CLR			T_DOWN
		SNZB		F_DOWN
		JP			END_FALL_DOWN_DECTION
		SETB		F_NODOWN
		LD			A,T_NODOWN
		HSUBIA		D'10'
		SNZB		C
		JP			END_FALL_DOWN_DECTION
		CLRB		F_DOWN
		CLRB		F_NODOWN
		CLR			T_NODOWN
		SETB		F_BUZ
		CLR			T_BUZ
		JP			END_FALL_DOWN_DECTION
FALL_DOWN:
		LD			A,T_DOWN
		HSUBIA		D'10'
		SNZB		C
		JP			END_FALL_DOWN_DECTION
		SETB		F_DOWN
		CLRB		F_NODOWN
		CLR			T_NODOWN
		SZB			F_HEAT_ONOFF
		JP			CLOSE_ALL
		SZB			F_FAN_ONOFF
		JP			CLOSE_ALL
		JP			END_FALL_DOWN_DECTION
CLOSE_ALL:
		CLRB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
		LD			A,FAN_WORK
		LD			FAN_WORK_BUF,A
		SETB		F_BUZ
		CLR			T_BUZ
END_FALL_DOWN_DECTION:	
;------------------------------------------------------------------;		
END_TIMER_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;			DISPLAY
;******************************************************************;
DISPLAY:		
		INCR		DISP_NUM
		LD			A,DISP_NUM
		HSUBIA		D'5'
		SNZB		C
		JP			END_DISPLAY
		CLR			DISP_NUM
		CLR     	LEDTR1
		CLR     	LEDTR2
		CLR			LEDTR3
;------------------------------------------------------------------;
DISP_DATA:
		SZB			F_NOPOWER
		JP      	END_DISPLAY
		SZB			F_POWER_LOW
		JP      	END_DISPLAY
		SNZB  		F_PROTECT
		JP      	SHOW_JUD
		SZB  		LIGHON,1			;温度保护显示			
		JP      	END_DISPLAY
		LDIA    	0FEH				;超温保护,闪烁“88”
		LD   		LEDTR1,A
		LD   		LEDTR2,A
		JP      	END_DISPLAY
SHOW_JUD:		
		SZB			F_FAN_ONOFF
		JP			FAN_DISP
		SZB			F_HEAT_ONOFF
		JP			HEAT_DISP
		JP			END_DISPLAY
		NOP
		NOP
		NOP
		NOP
		NOP
FAN_DISP:
		SZB			F_TIMER_SET
		JP			DISP_DATA3
		LDIA		08EH				;"F"
		LD			LEDTR1,A
		LD			A,FAN_WORK
		ADDR		PCL
		JP			DISP_F_SLOW
		JP			DISP_F_HIGH
		JP			DISP_F_MID
		JP			DISP_F_LOW
		JP			DISP_DATA4
DISP_F_SLOW:
		LDIA		060H
		LD			LEDTR2,A			; 数码屏显示"F1"
		JP			DISP_DATA4
DISP_F_HIGH:
		LDIA		066H				
		LD			LEDTR2,A			; 数码屏显示"F4"
		JP			DISP_DATA4
DISP_F_MID:
		LDIA		0F2H
		LD			LEDTR2,A			; 数码屏显示"F3"
		JP			DISP_DATA4
DISP_F_LOW:
		LDIA		0DAH
		LD			LEDTR2,A			; 数码屏显示"F2"
		JP			DISP_DATA4		
;------------------------------------------------------------------;
HEAT_DISP:
		SZB			F_TEMP_SET
		JP			DISP_DATA2			; 温度设置时跳转到显示设置温度
		SZB			F_TIMER_SET
		JP			DISP_DATA3			; 时间设置时跳转到显示设置时间
		SNZB		F_AUTO			; 判断是否是自动控温模式
		JP			DISP_DATA11		; 风速模式直接进入档位显示
DISP_DATA10:						; 室温显示(既没有设置温度也没有设置时间,数码管显示室温)
		LD   		A,T_ROOM_DISP
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD  		A,LED_BUF2
		LD   		LEDTR2,A
		JP			DISP_DATA4
DISP_DATA11:						;档位显示
		LDIA		06EH			
		LD			LEDTR1,A		;"H"
		LD			A,HEAT_SETUP
		XORIA		00H
		SZB			Z
		JP			DISP_H_HIG
		LD			A,HEAT_SETUP
		XORIA		01H
		SZB			Z
		JP			DISP_H_MID
		LD			A,HEAT_SETUP
		XORIA		02H
		SZB			Z
		JP			DISP_H_LOW
		LD			A,HEAT_SETUP
		XORIA		03H
		SZB			Z
		JP			DISP_H_HF
		JP			DISP_DATA4
DISP_H_HIG:
		LDIA		0F2H			;"3"
		LD			LEDTR2,A
		JP			DISP_DATA4
DISP_H_MID:
		LDIA		0DAH			;"2"
		LD			LEDTR2,A
		JP			DISP_DATA4
DISP_H_LOW:
		LDIA		060H			;"1"
		LD			LEDTR2,A
		JP			DISP_DATA4
DISP_H_HF:
		LDIA		08EH			;"F"
		LD			LEDTR2,A
		JP			DISP_DATA4		
DISP_DATA2:							; 温度设置显示
		SZB  		LIGHON,1
		JP      	DISP_DATA4
		SZB   		F_TEMP_MODE
		JP      	DISP_DATA22
DISP_DATA21:							; F
		LD  		A,T_SETUP_F
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		JP      	DISP_DATA4
DISP_DATA22:							; C
		LD  		A,T_SETUP_C
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		JP      	DISP_DATA4
DISP_DATA3:								; 时间设置显示
		SZB  		LIGHON,1
		JP      	DISP_DATA4  
		LD   		A,T_HOUR
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF2
		LD   		LEDTR1,A
		LDIA    	2EH
		LD   		LEDTR2,A
DISP_DATA4:
		SZB  		F_AUTO				; AUTO
		SETB		F_LED_AUTO
DISP_DATA5:
        LD			A,T_HOUR
        HSUBIA		D'1'
        SZB			C
		SETB		F_LED_TIMER
DISP_DATA6:
		SNZB		F_FAN_ONOFF
		JP			END_DISPLAY
		SETB		F_LED_FAN1
		SETB		F_LED_FAN2
;------------------------------------------------------------------;
END_DISPLAY:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;			SCANKEY
;******************************************************************;
SCANKEY:
		LD			A,DISP_NUM
		XORIA		D'1'
		SNZB		Z
		JP			END_SCANKEY
;------------------------------------------------------------------;
		CLR			KEY_VALUE
		LD			A,KEY_RAM1
		HSUBIA		D'213'
		SZB			C
		JP			SCANKEY_4
		LD			A,KEY_RAM1
		HSUBIA		D'186'
		SNZB		C
		JP			SCANKEY_1
		SETB		KEY_VALUE,0		;TIMER
		JP			SCANKEY_4
SCANKEY_1:
		LD			A,KEY_RAM1
		HSUBIA		D'149'
		SZB			C
		JP			SCANKEY_4
		LD			A,KEY_RAM1
		HSUBIA		D'115'
		SNZB		C
		JP			SCANKEY_2
		SETB		KEY_VALUE,1		;TEMP-
		JP			SCANKEY_4
SCANKEY_2:
		LD			A,KEY_RAM1
		HSUBIA		D'59'
		SZB			C
		JP			SCANKEY_4
		LD			A,KEY_RAM1
		HSUBIA		D'25'
		SNZB		C
		JP			SCANKEY_3
		SETB		KEY_VALUE,2		;HEAT MODE
		JP			SCANKEY_4
SCANKEY_3:
		SETB		KEY_VALUE,3		;HEAT WORK
SCANKEY_4:
;------------------------------------------------------------------;
SCANKEY_5:
		LD			A,KEY_RAM2
		HSUBIA		D'213'
		SZB			C
		JP			SCANKEY_9
		LD			A,KEY_RAM2
		HSUBIA		D'186'
		SNZB		C
		JP			SCANKEY_6
		SETB		KEY_VALUE,4		;OSC
		JP			SCANKEY_9
SCANKEY_6:
		LD			A,KEY_RAM2
		HSUBIA		D'149'
		SZB			C
		JP			SCANKEY_9
		LD			A,KEY_RAM2
		HSUBIA		D'115'
		SNZB		C
		JP			SCANKEY_7
		SETB		KEY_VALUE,5		;TEMP+
		JP			SCANKEY_9
SCANKEY_7:
		LD			A,KEY_RAM2
		HSUBIA		D'59'
		SZB			C
		JP			SCANKEY_9
		LD			A,KEY_RAM2
		HSUBIA		D'25'
		SNZB		C
		JP			SCANKEY_8
		SETB		KEY_VALUE,6		;FAN_SPEED
		JP			SCANKEY_9
SCANKEY_8:
		SETB		KEY_VALUE,7		;FAN POWER
SCANKEY_9:
;------------------------------------------------------------------;
KEY_JUD:
		LD			A,KEY_VALUE
		XORA		KEY_VALUE0
		SZB			Z
		JP			KEY_JUD1
		CLR			KEY_DELAY
		LD			A,KEY_VALUE
		LD			KEY_VALUE0,A
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
		CLRB		F_ONKEY
		SETB		F_TEMP_FIRST
		SETB		F_TIMER_FIRST
		CLR			KEY_TIMER
		CLRB		F_KEY_MODE
		JP			END_SCANKEY
ON_KEY:
		SZB			F_DOWN
		JP			END_SCANKEY
		SZB			F_PROTECT
		JP			END_SCANKEY
		SZB			F_ONKEY
		JP			OLDKEY
		SETB		F_ONKEY
		
		LD			A,KEY_VALUE
		XORIA		01H
		SZB			Z
		JP			KEY_TIME				;TIMER
		
		LD			A,KEY_VALUE
		XORIA		02H
		SZB			Z
		JP			KEY_DOWN				;TEMP-
		
		LD			A,KEY_VALUE
		XORIA		04H
		SZB			Z
		JP			HEAT_SPEED				;HEAT_SPEED
		
		LD			A,KEY_VALUE
		XORIA		08H
		SZB			Z
		JP			HEAT_ONOFF				;HEAT_POWER
		
		LD			A,KEY_VALUE
		XORIA		10H
		SZB			Z
		JP			KEY_OSC					;OSC
		
		LD			A,KEY_VALUE
		XORIA		20H
		SZB			Z
		JP			KEY_UP					;TEMP+
		
		LD			A,KEY_VALUE
		XORIA		40H
		SZB			Z
		JP			FAN_SPEED				;FAN_SPEED
		
		LD			A,KEY_VALUE
		XORIA		80H
		SZB			Z
		JP			FAN_ONOFF				;FAN_POWER
		
		JP			END_SCANKEY
OLDKEY:
		SZB			F_HEAT_ONOFF
		JP			OLDKEY1
		SZB			F_FAN_ONOFF
		JP			FAN_OLDKEY
		JP			END_OLDKEY
OLDKEY1:		
		LD			A,KEY_TIMER
		HSUBIA		D'250'
		SNZB		C
		INCR		KEY_TIMER
		LD			A,KEY_VALUE
		XORIA		08H
		SZB			Z
		JP			KEY_PROTECT
		LD			A,KEY_VALUE
		XORIA		20H
		SZB			Z
		JP			KEY_F_UP
		LD			A,KEY_VALUE
		XORIA		02H
		SZB			Z
		JP			KEY_F_DOWN
		LD			A,KEY_VALUE
		XORIA		22H
		SZB			Z
		JP			KEY_TEMP
		LD			A,KEY_VALUE
		XORIA		01H
		SZB			Z
		JP			KEY_F_TIME
		JP			END_OLDKEY
FAN_OLDKEY:
		LD			A,KEY_TIMER
		HSUBIA		D'250'
		SNZB		C
		INCR		KEY_TIMER
		LD			A,KEY_VALUE
		XORIA		01H
		SZB			Z
		JP			KEY_F_TIME
END_OLDKEY:
		CLR			KEY_TIMER
		JP			END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
HEAT_ONOFF:												;HEAT ONOFF
		SZB			F_NOPOWER
		JP			END_SCANKEY;KBUZ
		SZB			F_POWER_LOW
		JP			KBUZ;END_SCANKEY
		SZB			F_HEAT_ONOFF
		JP			HEAT_OFF
HEAT_ON:												;暖风机/风扇切换模式，摆头状态不变
		CLRB		F_TEMP_130F							;风扇切到暖风机，原工作档位记忆
		CLRB		F_TIMER_OFF							;暖风机切换到风扇，原温度设置记忆但是
		CLRB		F_TEMP_HOLD							;切回暖风机模式时还是高档启动
		CLR			HEAT_WORK
		SETB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
		CLRB		F_AUTO
		CLR			T_HEAT_ON
		CLR			T_SEC0
		CLR			HEAT_SETUP
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		LD			A,FAN_WORK
		LD			FAN_WORK_BUF,A
		JP			KBUZ
HEAT_OFF:
		CLRB		F_HEAT_ONOFF
		CLRB		F_AUTO
		CLRB		F_OSC
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		CLR			T_HOUR
		JP			KBUZ
KEY_PROTECT:
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		LD			A,T_SEC0
		XORIA		D'40'
		SNZB		Z
		JP			END_SCANKEY
		INCR		T_SEC0
		SETB		F_TEMP_130F
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_OSC:												;OSC
		SZB			F_HEAT_ONOFF
		JP			OSC_JUD
		SZB			F_FAN_ONOFF
		JP			OSC_JUD
		JP			END_SCANKEY
OSC_JUD:
		SNZB		F_OSC
		JP			KEY_OSC1
		CLRB		F_OSC
		JP			KBUZ
KEY_OSC1:
		SETB		F_OSC
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
HEAT_SPEED:												;HEAT MODE
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		SZB			F_AUTO
		JP			KEY_SPEED0
		INCR		HEAT_SETUP
		LD			A,HEAT_SETUP		;0-HIG 1-MID 2-LOW 3-HEAT/FAN
		HSUBIA		D'4'
		SZB			C
		CLR			HEAT_SETUP
		CLR			T_HEAT_ON
		JP			KBUZ
KEY_SPEED0:
		CLRB		F_AUTO
		CLRB		F_TEMP_HOLD
		CLR			HEAT_SETUP
		LD			A,HEAT_WORK
		HSUBIA		D'1'
		SZB			C
		CLR			T_HEAT_ON
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_UP:												;TEMP +
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		CLR			HEAT_SETUP
		SETB		F_AUTO
		SZB			F_TEMP_SET
		JP			KEY21
KEY2_AUTO:
		SETB		F_TEMP_SET
		SETB		F_TEMP_FIRST
		CLRB		F_TIMER_SET
		JP			ENDK2
KEY21:
		SZB			F_TEMP_MODE
		JP			KEY22
		LD			A,T_SETUP_F
		HSUBIA		D'90'
		SZB			C
		JP			ENDK2_0
		INCR		T_SETUP_F
		CLR     	LEDTR1
		CLR     	LEDTR2
		LD  		A,T_SETUP_F
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		CLR			DISP_NUM
		CLR			DIS_NUM
		JP			ENDK2
KEY22:
		LD			A,T_SETUP_C
		HSUBIA		D'32'
		SZB			C
		JP			ENDK2_0
		INCR		T_SETUP_C
		CLR     	LEDTR1
		CLR     	LEDTR2
		LD  		A,T_SETUP_C
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		CLR			DISP_NUM
		CLR			DIS_NUM
		JP			ENDK2
;------------------------------------------------------------------;
ENDK2_0:
		SNZB		F_FAST
		JP			ENDK2
		CLRB		F_FAST
		JP			END_SCANKEY
ENDK2:
		SETB		F_CHANGE
		CLRB		F_TEMP_HOLD
		LD			A,HEAT_WORK
		LD			HEAT_WORK_BUF,A
		CLR			LIGHON
		CLR			T250MS_TIMER
		CLR			T_FLASH
		CLRB		F_FAST
		JP			KBUZ
;------------------------------------------------------------------;
KEY_F_UP:											;LONG PRESS +
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		SZB			F_KEY_MODE
		JP			END_SCANKEY
		LD			A,KEY_TIMER
		HSUBIA		D'80'
		SNZB		C
		JP			END_SCANKEY
		CLR			KEY_TIMER
		SZB			F_TEMP_FIRST
		JP			END_F_UP
KEY_UP_REMOTE:
		SNZB		F_TEMP_SET
		JP			END_SCANKEY
		SETB		F_FAST
		JP			KEY21
END_F_UP:
		CLRB		F_TEMP_FIRST
		JP			END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_DOWN:											;TEMP -
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		SZB			HEAT_SETUP,0
		CLR			HEAT_SETUP
		SETB		F_AUTO
		SZB			F_TEMP_SET	
		JP			KEY31	
		SETB		F_TEMP_SET
		SETB		F_TEMP_FIRST
		CLRB		F_TIMER_SET
		JP			ENDK3
KEY31:
		SZB			F_TEMP_MODE
		JP			KEY32
		LD			A,T_SETUP_F
		HSUBIA		D'40'
		SNZB		C
		JP			ENDK3_0
		DECR		T_SETUP_F
		CLR     	LEDTR1
		CLR     	LEDTR2
		LD  		A,T_SETUP_F
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		CLR			DISP_NUM
		CLR			DIS_NUM
		JP			ENDK3
KEY32:
		LD			A,T_SETUP_C
		HSUBIA		D'5'
		SNZB		C
		JP			ENDK3_0
		DECR		T_SETUP_C
		CLR     	LEDTR1
		CLR     	LEDTR2
		LD  		A,T_SETUP_C
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF1
		LD   		LEDTR1,A
		LD   		A,LED_BUF2
		LD   		LEDTR2,A
		CLR			DISP_NUM
		CLR			DIS_NUM
		JP			ENDK3
;------------------------------------------------------------------;
ENDK3_0:
		SNZB		F_FAST
		JP			ENDK3
		CLRB		F_FAST
		JP			END_SCANKEY
ENDK3:
		SETB		F_CHANGE
		CLRB		F_TEMP_HOLD
		LD			A,HEAT_WORK
		LD			HEAT_WORK_BUF,A
		CLR			LIGHON
		CLR			T250MS_TIMER
		CLR			T_FLASH
		CLRB		F_FAST
		JP			KBUZ
;------------------------------------------------------------------;
KEY_F_DOWN:											;LONG PRESS -
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		SZB			F_KEY_MODE
		JP			END_SCANKEY
		LD			A,KEY_TIMER
		HSUBIA		D'80'
		SNZB		C
		JP			END_SCANKEY
		CLR			KEY_TIMER
		SZB			F_TEMP_FIRST
		JP			END_F_DOWN
KEY_DOWN_REMOTE:
		SNZB		F_TEMP_SET
		JP			END_SCANKEY
		SETB		F_FAST
		JP			KEY31
END_F_DOWN:
		CLRB		F_TEMP_FIRST
		JP			END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_TIME:											;HEATER/FAN TIMER
		SZB			F_HEAT_ONOFF
		JP			KEY_TIME1
		SZB			F_FAN_ONOFF
		JP			KEY_TIME1
		JP			END_SCANKEY
KEY_TIME1:
		SZB			F_TIMER_SET
		JP			KEY41
		SETB		F_TIMER_SET
		SETB		F_TIMER_FIRST
		CLRB		F_TEMP_SET
		SZB			F_TIMER_OFF
		JP			END_KEY_TIME
KEY41:
		SETB		F_TIMER_OFF
		INCR		T_HOUR
		LD			A,T_HOUR
		HSUBIA		D'9'
		SNZB		C
		JP			KEY42
		CLR			T_HOUR
		CLRB		F_TIMER_OFF
KEY42:
		CLR			T_SEC
		CLR			T_MIN
END_KEY_TIME:
		CLR			LIGHON
		CLR			T250MS_TIMER
		CLR			T_FLASH
		JP			KBUZ
;------------------------------------------------------------------;
KEY_F_TIME:											;LONG PRESS TIMER
		SZB			F_HEAT_ONOFF
		JP			KEY_F_TIME1
		SZB			F_FAN_ONOFF
		JP			KEY_F_TIME1
		JP			END_SCANKEY
KEY_F_TIME1:
		LD			A,KEY_TIMER
		HSUBIA		D'80'
		SNZB		C
		JP			END_SCANKEY
		CLR			KEY_TIMER
		SZB			F_TIMER_FIRST
		JP			END_F_TIME
KEY_TIME_REMOTE:
		LD			A,T_HOUR
		HSUBIA		D'8'
		SZB			C
		JP			END_SCANKEY
		SZB			F_TIMER_SET
		JP			F_KEY41
F_KEY40:
		JP			END_SCANKEY
F_KEY41:
		INCR		T_HOUR
		CLR			LEDTR1
		CLR			LEDTR2
		LD   		A,T_HOUR
		LD   		LED_BUF2,A
		CALL    	CALL_TABLE
		LD   		A,LED_BUF2
		LD   		LEDTR1,A
		LDIA    	2EH
		LD   		LEDTR2,A
		CLR			DISP_NUM
		CLR			DIS_NUM
		SETB		F_TIMER_OFF
		JP			KEY42
END_F_TIME:
		CLRB		F_TIMER_FIRST
		JP			END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_TEMP:											;LONG PRESS +-(SWITCH TEMP MODE)
		SNZB		F_HEAT_ONOFF
		JP			END_SCANKEY
		LD			A,KEY_TIMER
		XORIA		D'140'
		SNZB		Z
		JP			END_SCANKEY
		SZB			F_TEMP_MODE
		JP			OFF_TEMP
ON_TEMP:
		SETB		F_TEMP_MODE
		JP			END_KEY_TEMP
OFF_TEMP:
		CLRB		F_TEMP_MODE
END_KEY_TEMP:
		SETB		F_KEY_MODE
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
FAN_ONOFF:											;FAN ONOFF
		SZB			F_NOPOWER
		JP			END_SCANKEY;KBUZ
		SZB			F_POWER_LOW
		JP			KBUZ;END_SCANKEY
		SZB			F_FAN_ONOFF
		JP			FAN_OFF
FAN_ON:
		CLRB		F_HEAT_ONOFF
		SETB		F_FAN_ONOFF
		CLR			FAN_WORK
		CLRB		F_AUTO
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		CLRB		F_TIMER_OFF
		SETB		F_BUMP_START
		CLR			T_FAN_DELAY
		LD			A,FAN_WORK_BUF
		LD			FAN_WORK,A
		JP			KBUZ
FAN_OFF:
		CLR			T_HOUR
		CLRB		F_FAN_ONOFF
		CLRB		F_TIMER_SET
		CLRB		F_OSC
		LD			A,FAN_WORK
		LD			FAN_WORK_BUF,A
		JP			KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
FAN_SPEED:
		SNZB		F_FAN_ONOFF
		JP			END_SCANKEY
		CLRB		F_TIMER_SET
		INCR		FAN_WORK			;1--HIG 2--MID 3--LOW 0--S-LOW
		LD			A,FAN_WORK
		HSUBIA		D'4'
		SZB			C
		CLR			FAN_WORK
		JP			KBUZ
;------------------------------------------------------------------;	
KBUZ:
		CLR			T_BUZ
		SETB		F_BUZ
END_SCANKEY:
		RET
;******************************************************************;
;******************************************************************;			WORK_SUB
;******************************************************************;
WORK_SUB:
		LD			A,DISP_NUM
		XORIA		D'4'
		SNZB		Z
		JP			END_WORK_SUB
		SZB			F_NOPOWER
		JP			SHUT_OFF
		SZB			F_POWER_LOW
		JP    		WORK_OFF
		SZB  		F_PROTECT
		JP			WORK_OFF
;------------------------------------------------------------------;		
		SZB			F_FAN_ONOFF
		JP			FAN_MODE
		SZB			F_HEAT_ONOFF
		JP			HEAT_MODE
		JP			WORK_OFF
WORK_OFF:
		CLRB		F_HEAT_ONOFF
		CLRB		F_FAN_ONOFF
SHUT_OFF:
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_HIG
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		CLRB		F_HEAT_HIG
		CLRB		F_HEAT_LOW
		CLRB		F_HEAT_F_HIG
		CLRB		F_HEAT_F_LOW
		CLRB		F_OSC
		CLRB		F_AUTO
		CLR			T_HOUR
		CLR			T_HEAT_ON
		JP			END_WORK_SUB1
FAN_MODE:
		CLRB		F_HEAT_HIG
		CLRB		F_HEAT_LOW
		CLRB		F_HEAT_F_HIG
		CLRB		F_HEAT_F_LOW
		
		LD			A,FAN_WORK
		XORIA		00H
		SZB			Z
		JP			FAN_SLOW
		LD			A,FAN_WORK
		XORIA		01H
		SZB			Z
		JP			FAN_HIG
		LD			A,FAN_WORK
		XORIA		02H
		SZB			Z
		JP			FAN_MID
		LD			A,FAN_WORK
		XORIA		03H
		SZB			Z
		JP			FAN_LOW
FAN_SLOW:
		SZB			F_BUMP_START
		JP			BUMP_START_SLOW
		SETB		F_FAN_SLOW
		CLRB		F_FAN_HIG
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		JP			END_WORK_SUB1
BUMP_START_SLOW:
		SETB		F_FAN_HIG
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		LD			A,T_FAN_DELAY
		HSUBIA		D'30'						;超低档记忆启动,先高档运行3秒再切换到超低档
		SNZB		C
		JP			END_WORK_SUB1
		CLRB		F_BUMP_START				;清除标志位
		JP			FAN_SLOW
FAN_HIG:
		SETB		F_FAN_HIG
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		JP			END_WORK_SUB1
FAN_MID:
		SZB			F_BUMP_START
		JP			BUMP_START_MID
		SETB		F_FAN_MID
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_HIG
		CLRB		F_FAN_LOW
		JP			END_WORK_SUB1
BUMP_START_MID:
		SETB		F_FAN_HIG
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		LD			A,T_FAN_DELAY
		HSUBIA		D'10'						;中档记忆启动,先高档运行1秒再切换到中档
		SNZB		C
		JP			END_WORK_SUB1
		CLRB		F_BUMP_START
		JP			FAN_MID
FAN_LOW:
		SZB			F_BUMP_START
		JP			BUMP_START_LOW
		SETB		F_FAN_LOW
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_HIG
		CLRB		F_FAN_MID
		JP			END_WORK_SUB1
BUMP_START_LOW:
		SETB		F_FAN_HIG
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW
		LD			A,T_FAN_DELAY
		HSUBIA		D'10'						;低档记忆启动,先高档运行1秒再切换到低档
		SNZB		C
		JP			END_WORK_SUB1
		CLRB		F_BUMP_START
		JP			FAN_LOW
;------------------------------------------------------------------;		
HEAT_MODE:
		CLRB		F_FAN_SLOW
		CLRB		F_FAN_HIG
		CLRB		F_FAN_MID
		CLRB		F_FAN_LOW

		SZB			F_AUTO
		JP			WORK_AUTO
WORK_NORMAL:
		LD			A,HEAT_SETUP
		XORIA		00H
		SZB			Z
		JP			WORK_HIG
		LD			A,HEAT_SETUP
		XORIA		01H
		SZB			Z
		JP			WORK_MID
		LD			A,HEAT_SETUP
		XORIA		02H
		SZB			Z
		JP			WORK_LOW
		LD			A,HEAT_SETUP
		XORIA		03H
		SZB			Z
		JP			WORK_HF
		JP			END_WORK_SUB1
WORK_AUTO:
		LD			A,HEAT_WORK
		XORIA		00H
		SZB			Z
		JP			WORK_HIG
		LD			A,HEAT_WORK
		XORIA		01H
		SZB			Z
		JP			WORK_LOW
		LD			A,HEAT_WORK
		XORIA		02H
		SZB			Z
		JP			WORK_STOP
		JP			END_WORK_SUB1
WORK_STOP:
		CLRB		F_HEAT_HIG
		CLRB		F_HEAT_LOW
		CLRB		F_OSC
		CLR			T_HEAT_ON
		SETB		F_FAN_DELAY
		JP			END_WORK_SUB1
WORK_LOW:
		CLRB		F_HEAT_HIG              ;关高档发热体
		CLRB		F_HEAT_F_HIG
		SETB		F_HEAT_F_LOW
		LD			A,T_HEAT_ON
		HSUBIA		D'10'
		SNZB		C
		JP			END_WORK_SUB1
		SETB		F_HEAT_LOW				;开低档发热体
		CLRB		F_FAN_DELAY
		JP			END_WORK_SUB1
WORK_MID:
		CLRB		F_HEAT_F_HIG
		SETB		F_HEAT_F_LOW
		LD			A,T_HEAT_ON
		HSUBIA		D'10'
		SNZB		C
		JP			END_WORK_SUB1
		SETB		F_HEAT_HIG				;开低档发热体
		SETB		F_HEAT_LOW              ;开高档发热体
		CLRB		F_FAN_DELAY
		JP			END_WORK_SUB1
WORK_HIG:
		SETB		F_HEAT_F_HIG
		LD			A,T_HEAT_ON
		HSUBIA		D'10'
		SNZB		C
		JP			END_WORK_SUB1
		SETB		F_HEAT_LOW
		CLRB		F_FAN_DELAY
		LD			A,T_HEAT_ON
		HSUBIA		D'50'
		SZB			C
		SETB		F_HEAT_HIG				;延迟5秒才打开高档发热体
		JP			END_WORK_SUB1
WORK_HF:
		SETB		F_HEAT_F_HIG			;开发热体高档风扇
		CLRB		F_HEAT_F_LOW			;关发热体低档风扇
		SETB		F_FAN_HIG				;开高档风扇
		LD			A,T_HEAT_ON
		HSUBIA		D'10'
		SNZB		C
		JP			END_WORK_SUB1
		SETB		F_HEAT_LOW				;开低档发热体
		SETB		F_HEAT_HIG				;开高档发热体
		LD			A,T_HEAT_ON
		HSUBIA		D'30'
		SNZB		C
		JP			END_WORK_SUB1
		CLRB		F_FAN_HIG				;延时3秒,关闭高档风扇
		SETB		F_FAN_SLOW				;开启超低档风扇
;------------------------------------------------------------------;		
END_WORK_SUB1:								;一旦状态改变,立即发送
		LD			A,FLAG3
		XORA		DATA_BUF
		SNZB		Z
		JP			REFLASH_DATA
		LD			A,FLAG4
		XORA		DATA1_BUF
		SNZB		Z
		JP			REFLASH_DATA
		JP			END_WORK_SUB
REFLASH_DATA:								
		LD			A,FLAG3
		LD			DATA_BUF,A
		LD			A,FLAG4
		LD			DATA1_BUF,A
		LDIA		D'15'
		LD			T_SEND,A
END_WORK_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;			SCANREMOTE
;******************************************************************;
SCANREMOTE:


END_SCANREMOTE:
		JP			MAINLOOP2
;******************************************************************;
;******************************************************************;
;******************************************************************;			ADC_GET
;******************************************************************;
ADC_GET:
		SETB		SYS_GEN,ADC_EN
		NOP
		NOP
		LDIA		B'10100100'
		LD			ADCON,A
		NOP
		NOP
		SETB		ADCON,CONV
		NOP
		NOP
		CLRB		ADCON,CONV				;START ADC TRANSLATION
SCANAD_WAIT1:
		SNZB		ADCON,EOC
		JP			SCANAD_WAIT1
		LD			A,ADDATA
		LD			KEY_RAM1,A
ADC_GET1:		
		LDIA		B'11000100'
		LD			ADCON,A
		NOP
		NOP
		SETB		ADCON,CONV
		NOP
		NOP
		CLRB		ADCON,CONV				;START ADC TRANSLATION
SCANAD_WAIT2:
		SNZB		ADCON,EOC
		JP			SCANAD_WAIT2
		LD			A,ADDATA
		LD			KEY_RAM2,A
END_ADC_GET:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TEMP_JUD:
		LD			A,DISP_NUM
		XORIA		D'3'
		SNZB		Z
		JP			END_TEMP_JUD
;------------------------------------------------------------------;
TEMP_OVER_JUD:
		LD			A,T_ROOM_REAL
		SNZB		F_TEMP_130F
		JP			T_OVER100F
T_OVER130F:									;高温,超130F
		HSUBIA		D'130'
		SNZB		C
		JP			TEMP_NO_OVER
		JP			TEMP_ERR
T_OVER100F:									;高温,超100F
		HSUBIA		D'100'
		SNZB		C
		JP			TEMP_NO_OVER
TEMP_ERR:
		INCR		OVER_CNT2
		SNZB		F_HEAT_ONOFF
		JP			TEMP_ERR2
TEMP_ERR1:
		LD			A,OVER_CNT2
		HSUBIA		D'60'
		SZB			C
		SETB		F_PROTECT
		JP			END_TEMP_OVER_JUD
TEMP_ERR2:
		LD			A,OVER_CNT2
		HSUBIA		D'150'
		SZB			C
		SETB		F_PROTECT
		JP			END_TEMP_OVER_JUD
TEMP_NO_OVER:
		CLR			OVER_CNT2
END_TEMP_OVER_JUD:
;------------------------------------------------------------------;
TEMP_CHANGE:								; 温度转换
		SZB			F_TEMP_MODE
		JP			TEMP_CH2
TEMP_CH1:									; AUTO
TEMP_CH11:
		SNZB		F_CHANGE
		JP			TEMP_CH110
		CLRB		F_CHANGE				; SETUP F-->C
		LD			A,T_SETUP_F
		HSUBIA		D'32'
		LD			TABLE_SPL,A
		LDIA		090H
		ADDR		TABLE_SPL
		LDIA		06H
		LD			TABLE_SPH,A
		TABLEA
		LD			T_SETUP_C,A
TEMP_CH110:
		LD			A,T_SETUP_F
		LD			T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA		D'3'
		SUBR		T_SETUP_LOW
		LDIA		D'2'
		ADDR		T_SETUP_MAX
		JP			TEMP_CH13
;------------------------------------------------------------------;		
TEMP_CH13:
		LD			A,T_ROOM_REAL
		LD			T_ROOM_DISP,A
		JP			TEMP_CH3
;------------------------------------------------------------------;
TEMP_CH2:									; AUTO
TEMP_CH21:									
		SNZB		F_CHANGE
		JP			TEMP_CH210
		CLRB		F_CHANGE				; SETUP C-->F
		LD			A,T_SETUP_C
		LD			TABLE_SPL,A
		LDIA		60H
		ADDR		TABLE_SPL
		LDIA		06H
		LD			TABLE_SPH,A
		TABLEA
		LD			T_SETUP_F,A
TEMP_CH210:
		LD			A,T_SETUP_C
		LD			T_SETUP_LOW,A
		LD			T_SETUP_MAX,A
		LDIA		D'2'
		SUBR		T_SETUP_LOW
		LDIA		D'1'
		ADDR		T_SETUP_MAX
		JP			TEMP_CH23
;------------------------------------------------------------------;
TEMP_CH23:									; F-->C
		LD			A,T_ROOM_REAL
		HSUBIA		D'32'
		LD			TABLE_SPL,A
		LDIA		090H
		ADDR		TABLE_SPL
		LDIA		06H
		LD			TABLE_SPH,A
		TABLEA
		LD			T_ROOM_DISP,A
TEMP_CH3:
;------------------------------------------------------------------;
TEMP_JUD1:									; 工作温度判断
		SNZB		F_HEAT_ONOFF
		JP			END_TEMP_JUD
		SZB			F_AUTO
		JP			TEMP_JUD_AUTO
TEMP_JUD_NOR:
		CLRB		F_TEMP_HOLD
		LD			A,HEAT_SETUP
		LD			HEAT_WORK,A
		LD			HEAT_WORK_BUF,A
		JP			END_TEMP_JUD
TEMP_JUD_AUTO:
		LD			A,T_ROOM_DISP
		HSUBA		T_SETUP_LOW
		SZB			C
		JP			TEMP_JUD_AUTO2
TEMP_JUD_AUTO1:								; <T_SETUP_LOW(设定温度-3F)
		CLR			HEAT_WORK_BUF
		LD			A,HEAT_WORK
		HSUBIA		D'1'
		SNZB		C
		JP			END_TEMP_JUD_AUTO
		CLR			HEAT_WORK
		CLR			T_HEAT_ON
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO2:								; >T_SETUP_LOW(设定温度-3F)
		LD			A,T_ROOM_DISP
		HSUBA		T_SETUP_MAX
		SNZB		C
		JP			TEMP_JUD_AUTO3			; 如果小于T_SETUP_MAX(设定温度+2F)
		LDIA		D'2'					; >T_SETUP+3F
		LD			HEAT_WORK_BUF,A
		LD			A,HEAT_WORK
		HSUBIA		D'2'
		SZB			C
		JP			END_TEMP_JUD_AUTO
		LDIA		D'2'
		LD			HEAT_WORK,A
		SETB		F_TEMP_HOLD
		CLR			T_TEMP_HOLD
		CLR			T_TEMP_HOLD0
		JP			END_TEMP_JUD_AUTO
TEMP_JUD_AUTO3:								; >=T_SETUP_LOW&<=T_SETUP+3F
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
END_TEMP_JUD_AUTO:							; OVER 4min+15s解锁
		LD			A,T_TEMP_HOLD
		HSUBIA		D'254'
		SZB			C
		CLRB		F_TEMP_HOLD
END_TEMP_JUD:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
CALL_TABLE:
		LD   		A,LED_BUF2
		HSUBIA		D'100'
		SZB  		C
		JP      	CALL_TABLE3
		CLR     	LED_BUF1
CALL_TABLE1:	
		LD   		A,LED_BUF2
		HSUBIA  	D'10'
		SNZB  		C
		JP      	CALL_TABLE2
		LD   		A,LED_BUF2
		HSUBIA  	D'10'
		LD   		LED_BUF2,A
		INCR   		LED_BUF1
		JP      	CALL_TABLE1
CALL_TABLE2:    	            
		LD			A,LED_BUF1
		LD			TABLE_SPL,A
;		LDIA		00H
;		ADDR		TABLE_SPL
		LDIA    	07H
		LD			TABLE_SPH,A
		TABLEA	
		LD      	LED_BUF1,A
	
		LD			A,LED_BUF2
		LD			TABLE_SPL,A
;		LDIA		00H
;		ADDR		TABLE_SPL
		LDIA    	07H
		LD			TABLE_SPH,A
		TABLEA	
		LD      	LED_BUF2,A
		RET
;------------------------------------------------------------------;
CALL_TABLE3:
		LDIA    	0F6H
		LD   		LED_BUF1,A
		LD   		LED_BUF2,A
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
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
;------------------------------------------------------------------;
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
;------------------------------------------------------------------;
   	 	JP	RESET
		END
