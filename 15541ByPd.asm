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
		OUT_BUZ			EQU	P0,0
		OUT_HIG			EQU	P0,1
		OUT_LOW			EQU P0,2
		OUT_OSC			EQU	P2,2
		OUT_FAN			EQU	P2,1
		
		SW_OSC			EQU	P1,0
		SW_TIMER		EQU	P1,1
		SW_POWER		EQU	P1,2
		SW_TEMP_SUB		EQU	P1,4
		SW_TEMP_ADD		EQU	P1,5
		SW_SPEED		EQU	P1,6
		
		REMOTE			EQU	P0,3
		OUT_SCL			EQU	P0,4
		OUT_SDA			EQU	P0,5
		NTC				EQU	P0,6
		ZERO_IN			EQU	P1,3
;******************************************************************;		
		ACC_BUF			EQU	30H
		STATUS_BUF		EQU	31H
		FLAG1			EQU	32H
		FLAG2           EQU	33H
		FLAG3           EQU	34H
		DISP_NUM		EQU	35H
		T1MS_TIMER		EQU	36H
		T100MS_TIMER    EQU 37H
		T250MS_TIMER1	EQU	38H
		CODE0           EQU	39H
		CODE1           EQU	3AH
		CODE2           EQU	3BH
		CODE3           EQU	3CH
		CODE4           EQU	3DH
		CODE5           EQU	3EH
		CODE6           EQU	3FH
		T_REMOTE1       EQU	40H
		T_REMOTE2       EQU	41H
		T_REMOTE3       EQU	42H
		T_HOUR          EQU	43H
		T_MIN           EQU 44H
		T_SEC           EQU	45H
		T_SEC0			EQU	46H
		T_SETUP_C       EQU	47H
		T_SETUP_F       EQU	48H
		T_SETUP_MAX		EQU	49H
		T_SETUP_LOW		EQU	50H
		T_ROOM_REAL     EQU	51H
		T_ROOM_F        EQU	52H
		T_ROOM_BUF      EQU	53H
		HEAT_SETUP      EQU	54H
		KEY_VALUE       EQU	55H
		KEY_VALUE0      EQU	56H
		KEY_DELAY       EQU	57H
		TN              EQU	58H
		REMOTE_NUM      EQU	59H
		T_BUZ			EQU	5AH
		T_FLASH			EQU	5BH
		KEY_TIMER		EQU	5CH
		T_TEMP_HOLD		EQU	5DH
		T_TEMP_HOLD0	EQU	5EH
		T_FAN_DELAY		EQU	5FH
		T_HEAT_ON		EQU	60H
		FLAG4			EQU	61H
		DATA1			EQU	62H
		DATA2			EQU	63H
		BITNUM         	EQU	64H
		CODE_NUM        EQU	65H
		NTC_RAM			EQU	66H
		NTC_RAM1        EQU	67H
		NTC_RAM2        EQU	68H
		ADC_NUM			EQU	69H
		LEDTR1			EQU	6AH
		LEDTR2          EQU	6BH
		LEDTR3          EQU	6CH
		LIGHON			EQU	6DH
		T_ROOM_DISP		EQU	6EH
		HEAT_WORK	    EQU	6FH
		HEAT_WORK_BUF   EQU	70H
		LED_BUF1		EQU	71H
		LED_BUF2		EQU	72H
		DSP_BUF         EQU	73H
		DSP_BUF1        EQU	74H
		DSP_BUF2        EQU	75H
		DSP_BUF3		EQU	76H
		OVER_CNT1       EQU	77H
		OVER_CNT2       EQU	78H
		WAIT_TIME1      EQU	79H
		T_ADC_DELAY		EQU	7AH
		T_ZERO			EQU	7BH
		T_NPULSE_BUF	EQU	7CH
		T_NPULSE		EQU	7DH
		LOSE_TIME1		EQU	7EH
		LOSE_TIME2      EQU	7FH
		LOSE_TIME3      EQU	7H
;******************************************************************;		
		F_T1MS			EQU	T1MS_TIMER,3
		
		;FLAG1
		F_ONOFF	        EQU	FLAG1,0
		F_TIMER_OFF		EQU	FLAG1,1
		F_YK_FIRST    	EQU	FLAG1,2
		F_AUTO			EQU	FLAG1,3
		F_OSC			EQU	FLAG1,4
		F_TEMP_FIRST	EQU	FLAG1,5
		F_ADC_FIRST		EQU	FLAG1,6
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
		;F_ZERO_RISE		EQU	FLAG3,2
		;F_POWER_LOW     EQU FLAG3,3
		F_TEMP_HOLD		EQU FLAG3,4
		F_CHANGE		EQU	FLAG3,5
		;F_NOPOWER		EQU	FLAG3,6
		F_ZERO_RISE		EQU	FLAG3,7
		
		F_LED_1A		EQU	LEDTR1,7
		F_LED_1B		EQU	LEDTR1,6
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
	
		F_LED_AUTO		EQU	LEDTR3,0
		F_LED_TIMER		EQU	LEDTR3,1
		F_LED_HIG		EQU	LEDTR3,2
		F_LED_LOW		EQU	LEDTR3,3
		F_LED_ECO		EQU	LEDTR3,4
;******************************************************************;		
		ORG				0000H
		JP				RESET
		ORG				0001H
		JP				ISR_TIMER0
;******************************************************************;		
ISR_TIMER0:
		LD				ACC_BUF,A
		SWAPR			ACC_BUF
		SWAPA			FLAGS
		LD				STATUS_BUF,A
		CLRB			INT_FLAG,F_T1
;---------------------------- BUZZER ------------------------------;		
		SNZB			F_BUZ
		JP				BUZZ_OFF
BUZZ:
		LDIA			01H
		XORR			P0
		JP				END_BUZZ
BUZZ_OFF:
		CLRB			OUT_BUZ
END_BUZZ:
;--------------------------- 1MS TIMER ----------------------------;
TIMER1:
		INCR			T1MS_TIMER
END_TIMER1:
;---------------------------- REMOTE ------------------------------;
REMOTE_RECEIVE:   							; 配套遥控器15917，没有头码
		LD				A,TN
		HSUBIA			D'200'
		SNZB			C
		INCR 			TN
		SZB  			F_REMOTE			; 接受完成标志位,SCANREMOTE中会判断后清零,并储存接受到的遥控码
		JP				END_REMOTE			; 清零后才检测下一次上升沿
		SNZB			REMOTE
		JP				YK_NPULSE
YK_PPULSE:										; 上升沿 (遥控器上升沿要判断两段上升沿之间的间隔是否符合要求)
		SZB				F_RISE_YK
		JP    			END_REMOTE
		SETB			F_RISE_YK
		SNZB			F_YK_FIRST			; 接收完头码之后会置一(是否发生错误标志位)
		JP    			YK_PPULSE1
		LD				A,TN		  		; >1ms
		HSUBIA			D'10'				; 正常的一段遥控码的两个数字之间的间隔如果大于1ms则判定为出错
		SZB				C
		JP    			ERROR_REMOTE
		CLR    			TN
		JP    			END_REMOTE
YK_PPULSE1:		
		LD				A,TN
		HSUBIA			D'60'		    	; >7.6ms?			如果间隔在7.6-11ms之间,都正常
		SNZB			C
		JP    			ERROR_REMOTE
		LD				A,TN
		HSUBIA			D'90'		    	; <11ms?
		SZB				C
		JP    			ERROR_REMOTE
		CLR    			TN					; 9ms 头码
		CLR				REMOTE_NUM
		CLR				CODE0
		JP				END_REMOTE
YK_NPULSE:										; 下降沿
		SNZB			F_RISE_YK
		JP    			END_REMOTE
		CLRB			F_RISE_YK			
		SZB				F_YK_FIRST			; 两次上升沿间隔错误标志位,发生错误后立刻重新检测头码
		JP				YK_NPULSE1
		LD				A,TN
		HSUBIA			D'50'		  		; <6ms?
		SZB				C
		JP    			ERROR_REMOTE
		LD				A,TN		   		; >3.5ms?
		HSUBIA			D'28'
		SNZB			C
		JP    			ERROR_REMOTE
		SETB			F_YK_FIRST			; 4.5ms 头码
		CLR				TN
		CLR				REMOTE_NUM
		CLR				CODE0
		JP				END_REMOTE
YK_NPULSE1:			
		RLCR			CODE0				; 放的是最尾部
		RLCR			CODE2
		RLCR			CODE3
		RLCR			CODE4
		RLCR    		CODE5
		RLCR    		CODE6				; 接受到的遥控码最头部会放入CODE6
		LD				A,TN				
		HSUBIA			D'21'				; >2ms?		
		SZB				C
		JP				ERROR_REMOTE
		LD				A,TN		     	
		HSUBIA			D'9'				; 1ms?		125*8=1ms
		SZB				C
		JP				YK_BIT1
		LD				A,TN
		HSUBIA  		D'2'				; <0.25ms?
		SNZB			C
		JP    			ERROR_REMOTE
YK_BIT0:										; 上升沿持续0.25ms-1ms的为“0”
		CLRB			CODE0,0
		JP				YK_BITJUD
YK_BIT1:										; 上升沿持续1ms-2ms的为“0”
		SETB			CODE0,0
YK_BITJUD:		
		CLR    			TN
		INCR 			REMOTE_NUM
		LD				A,REMOTE_NUM
		HSUBIA			D'48'				;收48位
		SNZB			C
		JP				END_REMOTE
		LD				A,CODE0
		LD				CODE1,A
		SETB			F_REMOTE				;是否接受完遥控码
ERROR_REMOTE:		
		CLR				TN
		CLR    			CODE0
		CLR				REMOTE_NUM
		CLRB			F_YK_FIRST
END_REMOTE:
;-----------------------------  ZERO  -----------------------------;
ZERO_PLUSE:									;过零信号
		LD				A,T_ZERO
		HSUBIA			D'253'
		SNZB			C
		INCR			T_ZERO
		SNZB			ZERO_IN
		JP				NPLUSE
PPLUSE:		
		INCR			T_NPULSE_BUF
		SZB				F_ZERO_RISE
		JP				END_ZERO_PULSE
		SETB			F_ZERO_RISE				; 上升沿
		JP				END_ZERO_PULSE
;------------------------------------------------------------------;
NPLUSE:	
		SNZB			F_ZERO_RISE
		JP				END_ZERO_PULSE
		CLRB			F_ZERO_RISE
		LD				A,T_NPULSE_BUF
		LD				T_NPULSE,A
		CLR				T_NPULSE_BUF			;下降沿处理
		CLR				T_ZERO
END_ZERO_PULSE:	
;------------------------------------------------------------------;
EXIT_ISR:
		SWAPA			STATUS_BUF
		LD				FLAGS,A
		SWAPA			ACC_BUF
		RETI
;******************************************************************;
RESET:
		CLRWDT
		CLR				SYS_GEN
		LDIA			B'00000110'				;BUZ:0 OUT_HIG:0 OUT_LOW:0 REMOTE:0 OUT_SDA:0
		LD				P0,A					;OUT_SCL:0 NTC:0
		LDIA			B'00000000'				;SW_OSC:1 SW_TIMER:1 SW_POWER:1 SW_TEMP_SUB:1
		LD				P1,A					;SW_TEMP_ADD:1 SW_SPEED:1 ZERO:0
		LDIA			B'00000110'				;OUT_FAN:1 OUT_OSC:1
		LD				P2,A
		
		LDIA			B'01101010'
		LD				P0CL,A
		LDIA			B'00111010'
		LD				P0CH,A
		LDIA			B'01000000'
		LD				P1CL,A
		LDIA			B'00000000'
		LD				P1CH,A
		LDIA			B'10010000'
		LD				P2C,A
		
		LDIA			B'00000110'	
		LD				P0,A		
		LDIA			B'00000000'	
		LD				P1,A		
		LDIA			B'00000110'	
		LD				P2,A
		
		CLRA
		OPTION
		CLRB			TMR1C,TON
		CLRB			INT_EN,EN_T1
		CLRB			INT_FLAG,F_T1
		LDIA			B'10000001'				
		LD				TMR1C,A
		LDIA			83H
		LD				TMR1,A
		CLRB			INT_FLAG,F_T1
CLR_RAM:
		LDIA			2FH
		LD				MP,A
CLR_LOOP:
		INCR			MP
		CLR				IAR
		LDIA			07FH
		SUBA			MP
		SNZB			C
		JP				CLR_LOOP
INIT_RAM:
		SETB			INT_EN,EN_T1
		SETB			SYS_GEN,INT_GEN
		SETB			TMR1C,TON
		
		LDIA    		D'75'
		LD   			T_SETUP_F,A					;初始的温度设定为75华氏度
		LD   			T_SETUP_LOW,A
		LD				T_SETUP_MAX,A
		LDIA    		D'2'
		ADDR    		T_SETUP_MAX
		LDIA			D'24'
		LD				T_SETUP_C,A					;初始的摄氏度设为24摄氏度
		
		LDIA			D'30'
		LD				OVER_CNT1,A
		LDIA			D'250'
		LD				T_ADC_DELAY,A
		CLRB			F_PROTECT
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
MAINLOOP:
		CALL			ADC_GET
		CLRWDT
		SNZB			F_T1MS
		JP				MAINLOOP
		CLRB			F_T1MS
		CLRWDT
		CALL			DISPLAY_DATA
		CALL			DISPLAY
		CALL			TIMER_SUB
		JP				SCANREMOTE
MAIN_LOOP2:
		CALL			SCANKEY
		CALL			SENSOR_SUB
		CALL			WORK_SUB
		JP				MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		LD				A,DISP_NUM
		XORIA			D'5'
		SNZB			Z
		JP				TIMER_SUB0
ZERO_JUD:										; 8ms
		LD				A,T_ZERO
		HSUBIA			D'250'
		SZB				C
		JP				ZERO_JUD1;3			; OVER 32ms NO ZERO PULSE
		LD				A,T_NPULSE
		HSUBIA			D'95'				; VOLT<85V?
		SNZB			C
		JP    			ZERO_JUD2
ZERO_JUD1:		
		CLR     		LOSE_TIME2
		CLR				LOSE_TIME3
		INCR   			LOSE_TIME1
		NOP		
		LD   			A,LOSE_TIME1
		HSUBIA  		D'60';'125'
		SZB  			C
		SETB			F_POWER_LOW
		JP      		END_ZERO_JUD
ZERO_JUD3:		
		CLR				LOSE_TIME1
		CLR				LOSE_TIME2
		INCR			LOSE_TIME3
		NOP		
		LD				A,LOSE_TIME3
		HSUBIA			D'5'
		SNZB			C
		JP				END_ZERO_JUD
		SETB			F_NOPOWER
		SETB			OUT_FAN
		SETB  			OUT_HIG
		SETB  			OUT_LOW
		SETB			OUT_OSC
		JP				END_ZERO_JUD
ZERO_JUD2:		
		CLR				LOSE_TIME1
		CLR				LOSE_TIME3
		INCR			LOSE_TIME2
		NOP		
		LD				A,LOSE_TIME2
		HSUBIA			D'60'
		SNZB			C
		JP				END_ZERO_JUD
		CLRB			F_NOPOWER
		SNZB			F_POWER_LOW
		JP				END_ZERO_JUD
POWER_ON:										; 上电
		CLR				T_BUZ
		SETB			F_BUZ
		CLRB			F_POWER_LOW
END_ZERO_JUD:
;------------------------------------------------------------------;
TIMER_SUB0:
		INCR			T100MS_TIMER
		LD				A,T100MS_TIMER
		HSUBIA			D'100'
		SNZB			C
		JP				TIMER_SUB1
T_05SEC:
		CLR				T100MS_TIMER
		INCR			T_FLASH
		NOP
		LD   			A,T_FLASH				; 时间设定闪烁5s
		HSUBIA  		D'50'
		SZB  			C
		CLRB			F_TIMER_SET
		
		LD   			A,T_FLASH				; 温度设定闪烁10s
		HSUBIA  		D'100'
		SZB  			C
		CLRB			F_TEMP_SET
T_05SEC1:
		LD				A,T_SEC0				; T_SEC0 小于250时每0.1s+1
		HSUBIA			D'250'
		SNZB			C
		INCR			T_SEC0

		LD				A,T_HEAT_ON
		HSUBIA			D'250'					; T_HEAT_ON加热启动延时,低档在1s后导通OUT_LOW让继电器吸合
		SNZB			C
		INCR			T_HEAT_ON
		
		LD				A,T_FAN_DELAY
		HSUBIA			D'250'					; T_FAN_DELAY 小于250时每0.1s+1
		SNZB			C
		INCR			T_FAN_DELAY
T_05SEC2:
		INCR			T_TEMP_HOLD0			; 计1秒钟
		LD				A,T_TEMP_HOLD0
		HSUBIA			D'10'					;	1S
		SNZB			C
		JP				T_05SEC3
		CLR				T_TEMP_HOLD0
		INCR			T_TEMP_HOLD				;T_TEMP_HOLD每1s+1
		NOP
T_05SEC3:
;------------------------------------------------------------------;
TIMER_JUD:										; 是否到达定时时间判断
		INCR			T_SEC
		LD				A,T_SEC
		HSUBIA			D'240'
		SNZB			C
		JP				END_TIMER_JUD
		CLR				T_SEC
		INCR			T_MIN
		LD				A,T_MIN
		HSUBIA			D'60'
		SNZB			C
		JP				END_TIMER_JUD
		CLR				T_MIN
		LD				A,T_HOUR
		HSUBIA			D'1'
		SNZB			C
		JP				END_TIMER_JUD
		DECR			T_HOUR
		LD				A,T_HOUR
		HSUBIA			D'1'
		SZB				C
		JP				END_TIMER_JUD
		CLRB			F_ONOFF					;关电
		CLRB			F_TIMER_OFF				;清零定时器开启标志
		CLRB			F_AUTO					;清零自动温控标志位(开机默认为高档)
END_TIMER_JUD:
;------------------------------------------------------------------;
TIMER_SUB1:
		INCR			T250MS_TIMER1
		LD				A,T250MS_TIMER1
		HSUBIA			D'250'
		SNZB			C
		JP				END_TIMER_SUB1
		CLR				T250MS_TIMER1
		INCR			LIGHON					;每250MS增1
		NOP
		SETB			F_ADC_FIRST
END_TIMER_SUB1:
;------------------------------------------------------------------;
BUZ_TIMER:
		SNZB			F_BUZ
		JP				END_BUZ_TIMER
		INCR			T_BUZ
		NOP
		LD				A,T_BUZ
		HSUBIA			D'160'					;响160MS
		SZB				C
		CLRB			F_BUZ
END_BUZ_TIMER:		
;------------------------------------------------------------------;
END_TIMER_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
DISPLAY_DATA:
		INCR			DISP_NUM
		NOP
		LD				A,DISP_NUM
		HSUBIA			D'8'
		SNZB			C
		JP				END_DISPLAY_DATA
		CLR				DISP_NUM
		CLR				LEDTR1
		CLR				LEDTR2
		CLR				LEDTR3
DISP_DATA:
		;SZB				F_NOPOWER		;低电压也会闪烁显示"88"
		;JP      		END_DISP_DATA
		;SZB				F_POWER_LOW
		;JP      		END_DISP_DATA
		SNZB  			F_PROTECT
		JP      		DISP_DATA1
		SZB  			LIGHON,1			;温度保护显示			
		JP      		END_DISP_DATA		;交替闪烁显示88
DISP_ERR:		
		LDIA    		0FEH				;"8"的位码值
		LD   			LEDTR1,A			;赋值给储存第一位数码管位值的变量
		LD   			LEDTR2,A			;赋值给储存第二位数码管位值的变量
		SETB			F_LED_HIG			;超温保护高风和低风灯闪烁
		SETB			F_LED_LOW			;
		JP      		END_DISP_DATA
END_DISP_DATA:
;------------------------------------------------------------------;		
DISP_DATA1:
		SNZB			F_ONOFF
		JP				END_DISPLAY_DATA			
		SZB				F_TEMP_SET					;此变量当按下+-键时会置一,10S后才清零
		JP				DISP_DATA2					;首次按下温度+-键后,会显示当前设置的温度
		SZB				F_TIMER_SET					;此变量当按下TIMER键时会置一,5S后才清零
		JP				DISP_DATA3
DISP_DATA10:
		LD				A,T_ROOM_DISP				;将当前室内温度赋给BUF2
		LD				LED_BUF2,A
		CALL			CALL_TABLE					;温度处理，拆分T_ROOM_DISP的十位个位
		LD				A,LED_BUF1					;温度的十位
		LD				LEDTR1,A					;储存第一位数码管的数值
		LD				A,LED_BUF2					;温度的个位
		LD				LEDTR2,A					;储存第二位数码管的数值
		JP				DISP_DATA4
;------------------------------------------------------------------;
DISP_DATA2:
		SZB				LIGHON,1					;闪烁显示,LIGHON 每0.5s循环01变化
		JP				DISP_DATA4					;为1时只常亮状态栏,数字部分熄灭
		SZB				F_TEMP_MODE
		JP				DISP_DATA22
DISP_DATA21:
		LD				A,T_SETUP_F
		LD				LED_BUF2,A
		CALL			CALL_TABLE
		LD				A,LED_BUF1
		LD				LEDTR1,A
		LD				A,LED_BUF2
		LD				LEDTR2,A
		JP				DISP_DATA4
DISP_DATA22:						; C
		LD  			A,T_SETUP_C
		LD   			LED_BUF2,A
		CALL    		CALL_TABLE
		LD   			A,LED_BUF1
		LD   			LEDTR1,A
		LD   			A,LED_BUF2
		LD   			LEDTR2,A
		JP      		DISP_DATA4        
;------------------------------------------------------------------;
DISP_DATA3:							;时间设置显示
		SZB  			LIGHON,1					;闪烁显示,LIGHON 每0.5s循环01变
		JP      		DISP_DATA4                  ;为1时只常亮状态栏,数字部分熄灭
		LD   			A,T_HOUR					;把定时时间赋给BUF2
		LD   			LED_BUF2,A					
		CALL    		CALL_TABLE					;调用表格把数字转换为相应的位码值
		LD   			A,LED_BUF2
		LD   			LEDTR1,A					;转换完的位码值存入TR1
		LDIA    		0CCH						;h的位码值
		LD   			LEDTR2,A
;------------------------------------------------------------------;
DISP_DATA4:										;判断是否开启
		SZB  			F_AUTO
		JP				DISP_DATA42		;自动模式HIG灯亮
		LD   			A,HEAT_SETUP
		ADDR			PCL	
		JP				DISP_DATA42
		JP				DISP_DATA41
DISP_DATA41:								; H1--LOW
		SETB			F_LED_LOW
		JP      		DISP_DATA5
DISP_DATA42:								; H3--HIG
		SETB			F_LED_HIG
;------------------------------------------------------------------;
DISP_DATA5:
		LD				A,T_HOUR
		HSUBIA			D'1'
		SZB				C
		SETB			F_LED_TIMER			; 如果开启定时,定时功能灯亮
DISP_DATA6:		
		SZB  			F_AUTO
		SETB			F_LED_AUTO			; 如果设置了目标温度,开启自动温控
;------------------------------------------------------------------;
END_DISPLAY_DATA:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
DISPLAY:
		LD				A,DISP_NUM
		XORIA			D'1'
		SNZB			Z
		JP				END_DISPLAY
;------------------------------------------------------------------;		
		CLR				DSP_BUF1
		CLR				DSP_BUF2
		CLR				DSP_BUF3
		SZB				LEDTR1,7
		SETB			DSP_BUF1,7
		SZB				LEDTR1,6
		SETB			DSP_BUF1,6
		SZB				LEDTR1,5
		SETB			DSP_BUF1,5
		SZB				LEDTR1,4
		SETB			DSP_BUF1,4
		SZB				LEDTR1,3
		SETB			DSP_BUF1,3
		SZB				LEDTR1,2
		SETB			DSP_BUF1,2
		SZB				LEDTR1,1
		SETB			DSP_BUF1,1
		
		SZB				LEDTR2,7		
		SETB			DSP_BUF2,7
		SZB				LEDTR2,6
		SETB			DSP_BUF2,6
		SZB				LEDTR2,5
		SETB			DSP_BUF2,5
		SZB				LEDTR2,4
		SETB			DSP_BUF2,4
		SZB				LEDTR2,3
		SETB			DSP_BUF2,3
		SZB				LEDTR2,2
		SETB			DSP_BUF2,2
		SZB				LEDTR2,1
		SETB			DSP_BUF2,1
			
		SZB				F_LED_AUTO
		SETB			DSP_BUF3,3
		SZB				F_LED_TIMER
		SETB			DSP_BUF3,4
		SZB				F_LED_HIG
		SETB			DSP_BUF3,5
		SZB				F_LED_LOW
		SETB			DSP_BUF3,1
DISP_LED:		
		CLRB			OUT_SCL
		CLRB			OUT_SDA
		LDIA			B'00001000'
		ORR				P0CH
		NOP		
		NOP		
		CALL			I2C_START
		LDIA			68H
		CALL			TRANSING
		LD				A,DSP_BUF3
		CALL			TRANSING
		CALL			I2C_STOP
		CALL			I2C_START
		LDIA			6AH
		CALL			TRANSING
		LD				A,DSP_BUF2
		CALL			TRANSING			
		CALL			I2C_STOP
		CALL			I2C_START
		LDIA			6CH
		CALL			TRANSING
		LD				A,DSP_BUF1
		CALL			TRANSING
		CALL			I2C_STOP
		CALL			I2C_START
		LDIA			48H
		CALL			TRANSING
		LDIA			41H
		CALL			TRANSING			
		CALL			I2C_STOP
;------------------------------------------------------------------;
END_DISPLAY:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;		
I2C_START:
		CLRB			OUT_SCL
		SETB			OUT_SDA
		SETB			OUT_SCL
		NOP
		NOP
		NOP
		NOP
		CLRB			OUT_SDA
		NOP
		NOP
		CLRB			OUT_SCL
		RET
;------------------------------------------------------------------;		
I2C_STOP:
		CLRB			OUT_SCL
		CLRB			OUT_SDA
		SETB			OUT_SCL
		NOP
		NOP
		NOP
		NOP
		SETB			OUT_SDA
		NOP
		NOP
		CLRB			OUT_SCL
		RET
;------------------------------------------------------------------;		
TRANSING:
		LD				DSP_BUF,A
		LDIA			D'8'
		LD				BITNUM,A
LBITL:
		CLRB			OUT_SCL
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RLCR			DSP_BUF
		SZB				C
		JP				LBIT1
LBIT0:
		CLRB			OUT_SDA
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		JP				LRL
LBIT1:
		SETB			OUT_SDA
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
LRL:
		SETB			OUT_SCL
		NOP
		NOP
		DECR			BITNUM
		NOP
		LD				A,BITNUM
		HSUBIA			D'1'
		SZB				C
		JP				LBITL
		CLRB			OUT_SCL
		LDIA			B'11110011'
		ANDR			P0CH
		NOP
		NOP
		NOP
		NOP
TRANSING1:												;ACK信号
		SNZB			OUT_SDA
		JP				END_TRANSING
		INCR			WAIT_TIME1
		NOP
		LD				A,WAIT_TIME1
		HSUBIA			D'20'
		SNZB			C
		JP				TRANSING1
		CLR				WAIT_TIME1
END_TRANSING:
		CLR				DSP_BUF
		SETB			OUT_SCL
		LDIA			B'00001000'
		ORR				P0CH
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
SCANKEY:
		LD				A,DISP_NUM
		XORIA			D'6'
		SNZB			Z
		JP				END_SCANKEY
;------------------------------------------------------------------;		
		LDIA			B'01000000'
		LD				P1CL,A
		LDIA			B'00000000'
		LD				P1CH,A
		CLR				KEY_VALUE
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
		SNZB			SW_POWER
		SETB			KEY_VALUE,2
		SNZB			SW_SPEED
		SETB			KEY_VALUE,1
		SNZB			SW_TEMP_ADD
		SETB			KEY_VALUE,4
		SNZB			SW_TEMP_SUB
		SETB			KEY_VALUE,5
		SNZB			SW_TIMER
		SETB			KEY_VALUE,3
		SNZB			SW_OSC
		SETB			KEY_VALUE,0
		NOP
		NOP
;------------------------------------------------------------------;
KEY_JUD:
		LD				A,KEY_VALUE
		XORA			KEY_VALUE0
		SZB				Z
		JP				KEY_JUD1
		CLR				KEY_DELAY
		LD				A,KEY_VALUE
		LD				KEY_VALUE0,A
KEY_JUD1:
		LD				A,KEY_DELAY
		HSUBIA			D'5'
		SZB				C
		JP				KEY_JUD2
		INCR			KEY_DELAY
		JP				END_SCANKEY
KEY_JUD2:
		LD				A,KEY_VALUE
		HSUBIA			D'1'
		SZB				C
		JP				ON_KEY
NO_KEY:
		CLRB			F_ONKEY
		CLR				KEY_TIMER
		CLRB			F_TEMP_FIRST
		CLRB			F_KEY_MODE
		JP				END_SCANKEY
ON_KEY:
		SZB				F_PROTECT
		JP				END_SCANKEY
		SZB				F_ONKEY
		JP				OLD_KEY
		SETB			F_ONKEY
		LD				A,KEY_VALUE
		XORIA			04H
		SZB				Z
		JP				KEY_ONOFF
		LD				A,KEY_VALUE
		XORIA			02H
		SZB				Z
		JP				KEY_SPEED
		LD				A,KEY_VALUE
		XORIA			10H
		SZB				Z
		JP    			KEY_UP
		LD				A,KEY_VALUE
		XORIA			20H
		SZB				Z
		JP    			KEY_DOWN
		LD				A,KEY_VALUE
		XORIA			08H
		SZB				Z
		JP    			KEY_TIME
		LD				A,KEY_VALUE
		XORIA			01H
		SZB				Z
		JP    			KEY_OSC
		JP     			END_SCANKEY
OLD_KEY:
		SNZB			F_ONOFF
		JP				END_OLD_KEY
		LD				A,KEY_TIMER
		HSUBIA			D'250'
		SNZB			C
		INCR			KEY_TIMER
		LD				A,KEY_VALUE
		XORIA			04H
		SZB				Z
		JP				KEY_PROTECT					;长按开关键锁定温度
		LD				A,KEY_VALUE
		XORIA			10H
		SZB				Z
		JP    			KEY_F_UP					;长按+键进入快增
		LD				A,KEY_VALUE
		XORIA			20H
		SZB				Z
		JP    			KEY_F_DOWN					;长按-键进入快减
		LD				A,KEY_VALUE
		XORIA			30H
		SZB				Z
		JP    			KEY_TEMP					;长按+-切换温度显示模式
		LD				A,KEY_VALUE
		XORIA			08H
		SZB				Z
		JP				KEY_F_TIME					;长按TIMER快速增加定时时间
END_OLD_KEY:
		CLR				KEY_TIMER
		JP				END_SCANKEY
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_ONOFF:
		SZB				F_ONOFF
		JP				KEY_OFF
KEY_ON:
		SETB			F_ONOFF
		CLRB			F_OSC
		CLRB			F_TEMP_HOLD					;开机默认高风，不会锁定温度
		CLRB  			F_TIMER_OFF					;本身没有定时，按下定时键会+1小时定时时间
		CLRB  			F_AUTO
		CLRB  			F_TEMP_130F
		CLR				T_HOUR
		CLR     		T_HEAT_ON
		CLR     		T_SEC0
		CLR     		HEAT_SETUP
		CLR				HEAT_WORK
		JP				KBUZ
KEY_OFF:
		CLRB			F_ONOFF
		CLRB			F_AUTO
		CLRB			F_TEMP_SET					;关闭电源后也会清零温度/定时设置变量(第一次按下显示设定的温度/设定的定时时间)
		CLRB			F_TIMER_SET
		CLR				T_HOUR
		JP				KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;----------------------------长按开关键----------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;	
KEY_PROTECT:									;130F自动关闭功能，开启此功能后所有按键和遥控都失效
		SNZB			F_ONOFF					;只有通过断电，电压降低至85V以下2.5S以上
		JP				END_SCANKEY
		LD				A,T_SEC0
		XORIA			D'16'
		SNZB			Z
		JP				END_SCANKEY
		INCR			T_SEC0
		SETB			F_TEMP_130F				;开启130F关机功能
		JP				KBUZ		
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_SPEED:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		CLRB			F_TEMP_SET			;设定高低风速会让下一次按温度或定时重新显示温度,不会直接升降温或加定时时间
		CLRB			F_TIMER_SET			;
		SZB				F_AUTO				;检测原本是否为高/低风模式,如果是,则直接进KEY_SPEED0,变为低档
		JP				KEY_SPEED0
		INCR			HEAT_SETUP
		NOP
		LD				A,HEAT_SETUP		;高低两档
		HSUBIA			D'2'				;高档——0 低档——1
		SZB				C
		CLR				HEAT_SETUP
		CLR				T_HEAT_ON			;每次改变风速都会清零继电器的通电延迟,高档是先让低档的发热组件开始工作,然后延迟4s后让高档的发热组件也开始工作
		JP				KBUZ
KEY_SPEED0:
		CLRB			F_AUTO
		CLRB			F_TEMP_HOLD			;高低风模式不锁定温度
		CLR				HEAT_SETUP
		LD				A,HEAT_SETUP
		HSUBIA			D'1'
		SZB				C
		CLR				T_HEAT_ON
		JP				KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_UP:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		CLR				HEAT_SETUP			;清除高低风变量，在温控模式时默认高风
		SETB			F_AUTO				;开启自动控温
		SZB				F_TEMP_SET			;F_TEMP_SET在10s后清零(同时也判断是否10s内再次按下按键)
		JP				TEMP_ADD			;10s内再次按键进入温度+1段程序
		SETB			F_TEMP_SET			;首次按下+键后，置一
		CLRB			F_TIMER_SET			;清除定时时间闪烁5S变量
		SETB			F_TEMP_FIRST		;初次进入温度调节程序，如果长按按键不会快速增温
		JP				END_KEY_UP
TEMP_ADD:
		SZB				F_TEMP_MODE			;检测是华氏度还是摄氏度显示模式
		JP				C_TEMP_ADD
		LD				A,T_SETUP_F
		HSUBIA			D'90'				;华氏度最高不超过90
		SZB				C
		JP				END_KEY_UP0
		INCR			T_SETUP_F
		JP				END_KEY_UP
C_TEMP_ADD:
		LD				A,T_SETUP_C
		HSUBIA			D'32'				;摄氏度最高不超过32
		SZB				C
		JP				END_KEY_UP0
		INCR			T_SETUP_C
		JP				END_KEY_UP
END_KEY_UP0:
		SNZB			F_FAST				;长按+-键相关的变量
		JP				END_KEY_UP
		CLRB			F_FAST
		JP				END_SCANKEY
END_KEY_UP:
		SETB			F_CHANGE			;温度改变标志位
		CLRB			F_TEMP_HOLD			;改变了温度,要清除温度锁定
		CLRB			F_FAST
		CLR				LIGHON
		CLR				T_FLASH
		CLR				T250MS_TIMER1
		LD				A,HEAT_WORK
		LD				HEAT_WORK_BUF,A
		JP				KBUZ
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
KEY_F_UP:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SZB				F_KEY_MODE
		JP				END_SCANKEY
		LD				A,KEY_TIMER
		HSUBIA			D'62'				;此值未知为何为62(0.5S左右?)
		SNZB			C
		JP				END_SCANKEY
		CLR				KEY_TIMER
		SZB				F_TEMP_FIRST		;初次进入温度调节程序，如果长按按键不会快速降温
		JP				END_SCANKEY
KEY_UP_REMOTE:
		SNZB			F_TEMP_SET			;第一次按下温+键(控制板or遥控器)，不会增温，只会当前设定显示温度
		JP				END_SCANKEY
		SETB			F_FAST
		JP				TEMP_ADD
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;	
KEY_DOWN:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		CLR				HEAT_SETUP			;清除高低风变量，在温控模式时默认高风
		SETB			F_AUTO				;开启自动控温
		SZB				F_TEMP_SET			;F_TEMP_SET在10s后清零(同时也判断是否10s内再次按下按键)
		JP				TEMP_SUB			;10s内再次按键进入温度-1段程序
		SETB			F_TEMP_SET			;首次按下-键后，置一
		CLRB			F_TIMER_SET			;清除检测是否第一次进入定时设置的变量，下一次按定时键会显示定时时间不会直接加一小时
		SETB			F_TEMP_FIRST		;初次进入温度调节程序，如果长按按键不会快速降温
		JP				END_KEY_DOWN
TEMP_SUB:
		SZB				F_TEMP_MODE			;检测是华氏度还是摄氏度显示模式
		JP				C_TEMP_DOWN
		LD				A,T_SETUP_F
		HSUBIA			D'40'				;华氏度最低不低于39
		SNZB			C
		JP				END_KEY_DOWN0
		DECR			T_SETUP_F
		JP				END_KEY_DOWN
C_TEMP_DOWN:
		LD				A,T_SETUP_C
		HSUBIA			D'5'				;摄氏度最低不低于5
		SNZB			C
		JP				END_KEY_DOWN0
		DECR			T_SETUP_C
		JP				END_KEY_DOWN
END_KEY_DOWN0:
		SNZB			F_FAST				;长按+-键相关的变量
		JP				END_KEY_DOWN
		CLRB			F_FAST
		JP				END_SCANKEY
END_KEY_DOWN:
		SETB			F_CHANGE
		CLRB			F_TEMP_HOLD
		CLRB			F_FAST
		LD				A,HEAT_WORK
		LD				HEAT_WORK_BUF,A
		CLR				LIGHON
		CLR				T_FLASH
		CLR				T250MS_TIMER1
		JP				KBUZ
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
KEY_F_DOWN:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SZB				F_KEY_MODE
		JP				END_SCANKEY
		LD				A,KEY_TIMER
		HSUBIA			D'62'				;此值未知为何为62(0.5S左右?)
		SNZB			C
		JP				END_SCANKEY
		CLR				KEY_TIMER
		SZB				F_TEMP_FIRST		;此变量为是否初次进入温调变量，若为5S内第一次按，则不能快增，必须5S内先按一次+，松手后再长按才能快增
		JP				END_SCANKEY
KEY_DOWN_REMOTE:
		SNZB			F_TEMP_SET
		JP				END_SCANKEY
		SETB			F_FAST
		JP				TEMP_SUB		
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;		
KEY_TIME:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SZB				F_TIMER_SET			;此变量5S后清零，为1时，再次按下按键则直接跳到+定时时间的程序段
		JP				TIMER_ADD			;5秒后显示其他状态，若5s后再按一次，则再次显示定时时间
		SETB			F_TIMER_SET			;
		CLRB			F_TEMP_SET			;检测温度是否为5S内第一次按下的变量，调节定时时间时将其清零，防止下次按+-时直接升/降温
		SZB				F_TIMER_OFF			;当超过5S后第一次按下时，判断本身是否有定时，如果本身有1H以上定时，则此次按键只显示
		JP				END_KEY_TIMER		;定时时间和闪烁;如果本身没有定时，则跳到下面加一小时定时时间，从无设置到定时1小时
TIMER_ADD:
		SETB			F_TIMER_OFF			;定时标志置1
		INCR			T_HOUR
		LD				A,T_HOUR
		HSUBIA			D'9'
		SNZB			C
		JP				END_KEY_TIMER0		;未到最高定时时间，加完1小时后清零分钟计数、秒计数
		CLR				T_HOUR				
		CLRB			F_TIMER_OFF			
END_KEY_TIMER0:
		CLR				T_SEC
		CLR				T_MIN
END_KEY_TIMER:
		CLR				LIGHON
		CLR				T250MS_TIMER1		;调整时间后清除250毫秒计时变量
		CLR				T_FLASH				;清除闪烁时间计时
		JP				KBUZ
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;		
KEY_F_TIME:									;长按定时键
		SNZB			F_ONOFF
		JP				END_SCANKEY
		LD				A,KEY_TIMER
		HSUBIA			D'62'				;0.5S左右?
		SNZB			C
		JP				END_SCANKEY
		CLR				KEY_TIMER
KEY_TIME_REMOTE:
		LD				A,T_HOUR
		HSUBIA			D'8'
		SZB				C
		JP				END_SCANKEY
		SZB				F_TIMER_SET			;未开启定时器时，按下则+1小时定时，如已开启定时，按一下为显示定时时间
		JP				END_KEY_F_TIME		
		SETB			F_TIMER_SET			;5S内再按下才+1小时定时时间
		CLRB			F_TEMP_SET			;检测温度是否为5S内第一次按下的变量，调节定时时间时将其清零，防止下次按+-时直接升/降温
		SZB				F_TIMER_OFF
		JP				END_SCANKEY
END_KEY_F_TIME:
		LD				A,T_HOUR
		HSUBIA			D'8'
		SZB				C
		JP				END_SCANKEY
		INCR			T_HOUR
		SETB			F_TIMER_OFF
		JP				END_KEY_TIMER0
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;		
KEY_OSC:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SNZB			F_OSC
		JP				KEY_OSC1
		CLRB			F_OSC
		JP				KBUZ
KEY_OSC1:
		SETB			F_OSC
		JP				KBUZ		
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
KEY_TEMP:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		LD				A,KEY_TIMER
		XORIA			D'160'					;大约1S
		SNZB			Z
		JP				END_SCANKEY
		SZB				F_TEMP_MODE				;1——摄氏度模式 0——华氏度模式
		JP				OFF_TEMP
ON_TEMP:
		SETB			F_TEMP_MODE
		JP				END_KEY_TEMP
OFF_TEMP:
		CLRB			F_TEMP_MODE
END_KEY_TEMP:
		SETB			F_KEY_MODE				;同时长按+-键，防止识别为快增快减温度功能
		JP				KBUZ
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;
;------------------------------------------------------------------;		
KBUZ:
        CLR     		T_BUZ
        SETB  			F_BUZ	
END_SCANKEY:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
SCANREMOTE:
		LD				A,DISP_NUM
		XORIA			D'4'
		SNZB			Z
		JP				END_SCANREMOTE
		SZB  			F_PROTECT
		JP      		END_SCANREMOTE
SCANREMOTE0:
		SNZB			F_REMOTE			;判断是否接受完遥控码
		JP      		END_SCANREMOTE
		CLRB  			F_REMOTE
		LD   			A,CODE6
        ADDA    		CODE5
        ADDA    		CODE4
        ADDA    		CODE3
        ADDA    		CODE2
        XORA    		CODE1
        SNZB  			Z
        JP      		END_SCANREMOTE
	
        SNZB  			CODE6,0				;自动模式
        JP      		SCAN0
		SZB				F_AUTO				;判断是否设定了温度
		JP				SCAN1
        SETB  			F_AUTO				;
		CLR				T_HEAT_ON			;清除发热延时
        JP      		SCAN1
SCAN0:		
		SNZB			F_AUTO				;
		JP				SCAN1
        CLRB  			F_AUTO
		CLRB			F_TEMP_HOLD
SCAN1:		
        SNZB  			CODE6,1				;高低档位
        JP      		SCAN2
		LD				A,HEAT_SETUP
		HSUBIA			D'1'
		SNZB			C
        JP      		SCAN3
        CLR				HEAT_SETUP			;高档		
        CLR     		T_HEAT_ON
        JP      		SCAN3
SCAN2:		
		LD				A,HEAT_SETUP
		HSUBIA			D'1'
		SZB				C
		JP				SCAN3
		LDIA			D'1'
        LD				HEAT_SETUP,A		;低档
		CLR     		T_HEAT_ON
SCAN3:		
        SNZB  			CODE6,2				;温度设置
        JP      		SCAN4
        CLR     		LIGHON
        CLR     		T250MS_TIMER1
        CLR     		T_FLASH
        SETB  			F_TEMP_SET
        CLRB    		F_TIMER_SET
		CLRB			F_TEMP_HOLD
		SETB			F_CHANGE
        JP      		SCAN5
SCAN4:		
        CLRB    		F_TEMP_SET
SCAN5:      		
        SNZB  			CODE6,4				;时间设置
        JP      		SCAN6
        CLR     		LIGHON
        CLR     		T250MS_TIMER1
        CLR     		T_FLASH
        SETB  			F_TIMER_SET
        CLRB    		F_TEMP_SET
        JP      		SCAN7
SCAN6:		
        CLRB    		F_TIMER_SET
SCAN7:		
        SNZB  			CODE6,5				;华氏度，摄氏度标志位
        JP      		SCAN8
		SZB				F_TEMP_MODE
		JP				SCAN9
        SETB  			F_TEMP_MODE
        JP      		SCAN9
SCAN8:		
        SNZB			F_TEMP_MODE
		JP				SCAN9
		CLRB  			F_TEMP_MODE
SCAN9:		
        SNZB  			CODE6,6				;摆头
        JP      		SCAN10
        SETB  			F_OSC
        JP      		SCAN11
SCAN10:		
        CLRB  			F_OSC
SCAN11:		
        SNZB  			CODE6,7				;开关机
        JP      		SCAN12
        SZB  			F_ONOFF
        JP      		SCAN13
		;SZB				F_NOPOWER
		;JP      		END_SCANREMOTE
		;SZB				F_POWER_LOW
		;JP				SCAN16
        SETB  			F_ONOFF
        CLR     		T_HOUR
        CLR     		T_HEAT_ON
		CLRB			F_TEMP_HOLD
        CLRB  			F_TIMER_OFF
        CLRB  			F_TEMP_130F
        CLRB  			F_AUTO
        CLRB  			F_OSC
		CLRB			F_TEMP_SET
		CLRB			F_TIMER_SET
        JP      		SCAN13
SCAN12:		
        SNZB  			F_ONOFF
        JP      		END_SCANREMOTE
        CLRB  			F_ONOFF
        CLRB  			F_AUTO
		CLRB			F_TEMP_SET
        CLRB    		F_TIMER_SET
        CLRB  			F_TIMER_OFF
		CLR				T_HOUR
SCAN13:		
        LD   			A,CODE4
        LD   			T_SETUP_F,A
        ;LD   			T_SETUP_MAX,A
        ;LDIA   		 D'2'
        ;ADDR   		 T_SETUP_MAX
		
        LD   			A,CODE5
        LD      		T_HOUR,A
        HSUBIA			D'0'
        SZB  			C
        JP      		SCAN14
        CLRB  			F_TIMER_OFF
        JP      		SCAN15
SCAN14:		
       	 SETB  			F_TIMER_OFF
SCAN15:		
        LD   			A,CODE3
        LD   			T_SEC,A				;18秒，0-180每100MS增加一个单位
        LD				A,CODE2
        LD   			T_MIN,A				;一小时，0-200每18秒增加一个单位
SCAN16:				
        CLR     		T_BUZ
        SETB  			F_BUZ
END_SCANREMOTE:			
		JP     			MAIN_LOOP2
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
WORK_SUB:
		LD				A,DISP_NUM
		XORIA			D'3'
		SNZB			Z
		JP				END_WORK_SUB
		SZB				F_PROTECT
		JP				WORK_OFF
		SZB				F_ONOFF
		JP				WORK_JUD
WORK_OFF:
		CLRB			F_ONOFF
SHUT_DOWN:
		SETB			OUT_HIG
		SETB			OUT_LOW
		SETB			OUT_FAN
		SETB			OUT_OSC
		CLR				T_HEAT_ON
		JP				END_WORK_SUB
;------------------------------------------------------------------;
WORK_JUD:
		SZB				F_AUTO
		JP				WORK_AUTO
WORK_NORMAL:
		LD				A,HEAT_SETUP
		ADDR			PCL
		JP				WORK_HIG
		JP				WORK_LOW
WORK_AUTO:
		LD				A,HEAT_WORK
		ADDR			PCL
		JP				WORK_HIG
		JP				WORK_LOW
		JP				WORK_STOP
WORK_STOP:
		SETB			OUT_HIG
		SETB			OUT_LOW
		SETB			OUT_OSC
		CLR				T_HEAT_ON
		LD				A,T_FAN_DELAY
		HSUBIA			D'150'						;延时15S关闭风扇
		SZB				C
		SETB			OUT_FAN
		JP				END_WORK_SUB
WORK_LOW:
		SETB			OUT_HIG
		CLRB			OUT_FAN
		LD				A,T_HEAT_ON
		HSUBIA			D'10'						;1S
		SNZB			C
		JP				END_WORK_SUB				;不到1S，先不加热
		CLRB			OUT_LOW
		CLR				T_FAN_DELAY
		JP				WORK_OSC_MODE
WORK_HIG:
		CLRB			OUT_FAN
		LD				A,T_HEAT_ON
		HSUBIA			D'10'
		SNZB			C
		JP				END_WORK_SUB
		CLRB			OUT_LOW
		CLR				T_FAN_DELAY
		LD				A,T_HEAT_ON					;高档发热组件延迟4s后才开启
		HSUBIA			D'50'
		SNZB			C
		JP				WORK_OSC_MODE
		CLRB			OUT_HIG
WORK_OSC_MODE:
		SZB				F_OSC
		CLRB			OUT_OSC
		SNZB			F_OSC
		SETB			OUT_OSC
		JP				END_WORK_SUB
;------------------------------------------------------------------;		
END_WORK_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
ADC_GET:
		SETB			SYS_GEN,ADC_EN
		NOP		
		NOP		
		LDIA			B'01100100'
		LD				ADCON,A
		NOP		
		NOP		
		SETB			ADCON,CONV
		NOP			
		NOP			
		CLRB			ADCON,CONV					;开启AD转换(靠检测热敏电阻阻值来转换为相应数值)
SCANAD_WAIT2:		
		SNZB			ADCON,EOC					;判断转换是否结束
		JP				SCANAD_WAIT2				;未结束，继续判断
		LD      		A,ADDATA					;
		ADDR    		NTC_RAM1					;ADC_NUM未到256前，NTC_RAM1每次转换完都会累加
		LDIA    		D'0'
		ADDCR   		NTC_RAM2					;RAM2 = RAM2 + C + ACC;	C的值受上面RAM1累加影响
DATA_PROC:		
		INCR   			ADC_NUM
		NOP		
		LD				A,ADC_NUM					;接收256次之后才存一次值
		XORIA			D'0'
		SNZB			Z
		JP      		END_ADC_GET
		LD   			A,NTC_RAM2
		ADDR    		NTC_RAM
		RRCR    		NTC_RAM						;处理之后的值为华氏度的值(原理不清楚)
		CLR     		NTC_RAM1
		CLR     		NTC_RAM2
END_ADC_GET:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
SENSOR_SUB:								;流程:根据AD转换来的热敏阻值来查表找出对应华氏度值,
		LD				A,DISP_NUM		;放入T_ROOM_BUF,保存到T_ROOM_REAL;然后判断是否超温
		XORIA			D'2'			;温度转换,如果没有开启调温,处在的是摄氏度模式而且没有调整温度
		SNZB			Z				;会进入TEMP_CH210这段程序,先把摄氏度的值赋值MAX和LOW,改变上下限
		JP				END_SENSOR_SUB	;再进入TEMP_CH23,把T_ROOM_REAL原本存放的华氏度值转换为摄氏度的对应值
TEMP_PROC:								;再赋值给到T_ROOM_DISP显示.如果处在的是华氏度模式而且没有调温
		LD				A,NTC_RAM		;会直接把T_ROOM_REAL赋值给到T_ROOM_DISP显示.
		HSUBIA			D'205'			;如果有调温,会把当前温度模式放温度的变量查表转换为相对的温度,保持两者对应关系
		SZB				C				;如当前是华氏度模式,会把储存华氏度的变量T_SETUP_F查表后赋值给T_SETUP_C,摄氏度则会赋值给T_SETUP_F		
		JP				OVER_140F				;如果热敏阻值大于205,则为超过140F
		LD				A,NTC_RAM
		HSUBIA			D'58'
		SZB				C
		JP				TEMP_PROC1				
LOWER_32F:										;阻值低于58(低于32F)
		LDIA			D'32'
		LD				T_ROOM_BUF,A			;最低只送32
		JP				TEMP_PROC2
OVER_140F:
		LDIA			D'140'					;最高只送140
		LD				T_ROOM_BUF,A
		JP				TEMP_PROC2
TEMP_PROC1:
		LD				A,NTC_RAM
		HSUBIA			D'58'				;阻值低于58,则华氏度低于32,已经低于0摄氏度,不转化
		LD				TABLE_SPL,A			;高于58才转化
		LDIA			10H
		ADDR			TABLE_SPL
		LDIA			07H
		LD				TABLE_SPH,A			;表地址0710H
		TABLEA									;送入电阻--温度转换表,用检测热敏阻值来检测环境温度
		LD				T_ROOM_BUF,A
		DECR			T_ROOM_BUF				;温度补偿,原值比实际高两度
		DECR			T_ROOM_BUF
TEMP_PROC2:										;温度低于32或140华氏度
		INCR			OVER_CNT1
		SNZB			F_ADC_FIRST				;检测是否第一次开启AD转换
		JP				TEMP_PROC20
		LD				A,T_ROOM_F
		HSUBIA			D'33'					;减去33检测是到达上限还是下限
		SZB				C
		JP				TEMP_PROC21
TEMP_PROC20:								; 第一次检测值
		LD				A,T_ROOM_BUF
		LD				T_ROOM_F,A
		CLR				OVER_CNT1
		JP				TEMP_PROC3
TEMP_PROC21:		
		LD				A,T_ROOM_BUF
		HSUBA			T_ROOM_F			;A = T_ROOM_BUF - T_ROOM_F
		SNZB			C					;判断二者大小
		JP				TEMP_PROC23			;变化后比变化前要低,温度降低了
		LD				A,T_ROOM_F
		HSUBA			T_ROOM_BUF			;A = T_ROOM_F - T_ROOM_BUF
		SNZB			C
		JP				TEMP_PROC22
		CLR				OVER_CNT1			; 温度相等
		JP				TEMP_PROC3
TEMP_PROC22:									; 温度升高
		LD				A,OVER_CNT1			;延时20次检测后如果还是变化前后不相等,则确定温度已经改变
		HSUBIA			D'20'
		SNZB			C
		JP				TEMP_PROC3			;小于20次延时
		INCR			T_ROOM_F			;温度+1
		CLR				OVER_CNT1			;清除计时
		JP				TEMP_PROC3
TEMP_PROC23:									; 温度降低
		LD				A,OVER_CNT1
		HSUBIA			D'20'
		SNZB			C
		JP				TEMP_PROC3
		DECR			T_ROOM_F			;温度-1
		CLR				OVER_CNT1			;清除计时
		JP				TEMP_PROC3
TEMP_PROC3:										; 温度锁住?
		SZB				F_TEMP_HOLD			;判断是否锁住温度(由下面工作温度判断判定是否需要锁定温度)
		JP				TEMP_PROC4			;锁住温度之后暂时不会把当前温度保存到T_ROOM_REAL中,要经过下面的判断
		LD				A,T_ROOM_F			;将当前温度保存
		LD				T_ROOM_REAL,A		;T_ROOM_REAL放的是华氏温度值,后续如果要对温度作处理,会改变这个值
TEMP_PROC4:
;------------------------------------------------------------------;
TEMP_OVER_JUD:							; 高温判断
		LD   			A,T_ROOM_F
		SNZB			F_TEMP_130F				;判断是否开启了130F度关闭设置,如果开启了,则按照130F超温标准
		JP				T_OVER100F
T_OVER130F:										;高温,超130F
		HSUBIA  		D'130'
		SNZB  			C
		JP				TEMP_NO_OVER			;未超过130F
		JP      		TEMP_ERR				;超过
T_OVER100F:										;高温,超100F
		HSUBIA  		D'100'
		SNZB  			C
		JP      		TEMP_NO_OVER
TEMP_ERR:		
		INCR    		OVER_CNT2				;开始计时
		SNZB			F_ONOFF					;判断超温时暖风机是否开启
		JP				TEMP_ERR2
TEMP_ERR1:		
		LD   			A,OVER_CNT2				;开启
		HSUBIA  		D'60'					
		SZB  			C						;超过60次计时仍然超温
		SETB			F_PROTECT				;开启温度保护,闪烁显示88和高低风
		JP				END_TEMP_OVER_JUD
TEMP_ERR2:		
		LD   			A,OVER_CNT2				;电源关闭时
		HSUBIA  		D'150'					;周围温度过高,持续超过150次计时
		SZB  			C
		SETB  			F_PROTECT				;开启温度保护,闪烁显示88和高低风
		JP				END_TEMP_OVER_JUD
TEMP_NO_OVER:		
		CLR     		OVER_CNT2
END_TEMP_OVER_JUD:
;------------------------------------------------------------------;
TEMP_CHANGE:						; 温度转换(此段代码用于华氏度模式加减温度之后摄氏度也变化相应的温度值,
		SZB  			F_TEMP_MODE	; 否则在华氏度模式下调节了温度,切换到摄氏度后会使得设定温度回到初始值)
		JP      		TEMP_CH2
TEMP_CH1:									; F
TEMP_CH11:									; AUTO
		SNZB			F_CHANGE	;仅在调节温度时才进入这段处理代码
		JP				TEMP_CH110
		CLRB			F_CHANGE		; SETUP F-->C
		LD				A,T_SETUP_F
		HSUBIA			D'32'			; 设置的华氏度如果低于32,则无对应的摄氏度(低于0度了)
		LD				TABLE_SPL,A
		LDIA			090H
		ADDR			TABLE_SPL		;数码管显示的仍是华氏度,只是因为华氏改变了所以摄氏度也要变化相应的量
		LDIA    		06H				;否则在华氏度切换到摄氏度时,仍然是最初的摄氏度值,导致调温数据出错
		LD				TABLE_SPH,A
		TABLEA			
		LD				T_SETUP_C,A		;华氏度调整后的值转换过后赋给存放摄氏度值的变量(让两者保持对应关系)		
TEMP_CH110:								;功能未知?
		LD				A,T_SETUP_F		;T_SETUP_F初始值为75,就算没有开始调温,也将此值给到T_SETUP_LOW和T_SETUP_MAX
		LD				T_SETUP_LOW,A	;每次调温之后都把调整之后的华氏度值重新赋值,限制max比设定的温度高2F
		LD   			T_SETUP_MAX,A
		LDIA    		D'2'
		ADDR    		T_SETUP_MAX		;T_SETUP_MAX设定为比T_SETUP_F高2F
		JP				TEMP_CH13
;------------------------------------------------------------------;
TEMP_CH13:								;调节温度后进入这段程序不会让数码管显示当前温度,见显示代码,F_TEMP_SET置一后进入显示设定温度的程序
		LD				A,T_ROOM_REAL	
		LD				T_ROOM_DISP,A		;T_ROOM_DISP储存的是数码管上要显示的温度(显示的摄氏度或华氏度都通过此变量来传输值)
		JP				TEMP_CH3
;------------------------------------------------------------------;
TEMP_CH2:								; C(摄氏度模式调节温度)
TEMP_CH21:								; AUTO
		SNZB			F_CHANGE		; 判断是否调节了
		JP				TEMP_CH210
		CLRB			F_CHANGE			; SETUP C-->F
		LD				A,T_SETUP_C
		LD				TABLE_SPL,A
		LDIA			60H
		ADDR			TABLE_SPL
		LDIA			06H					
		LD				TABLE_SPH,A
		TABLEA								;摄氏度转换为华氏度,调用的表格为0660H
		LD				T_SETUP_F,A		;摄氏度调整后的值转换过后赋给存放华氏度值的变量(让两者保持对应关系)		
TEMP_CH210:
		LD				A,T_SETUP_C		;将此时的T_SETUP_MAX和LOW按照摄氏度重新赋值,否则此变量还是之前华氏度的标准
		LD				T_SETUP_LOW,A
		LD				T_SETUP_MAX,A
		LDIA			D'1'
		ADDR			T_SETUP_MAX			;摄氏度模式下T_SETUP_MAX只比T_SETUP_C高1摄氏度
		JP				TEMP_CH23
;------------------------------------------------------------------;
TEMP_CH23:		;此段代码用于常温显示中 将AD转换中得到的华氏度值转换为摄氏度值 如果不要这段 常温显示始终为华氏 只有在设定温度时才能显示摄氏度
		LD				A,T_ROOM_REAL		; F-->C
		HSUBIA			D'32'
		LD				TABLE_SPL,A
		LDIA			090H
		ADDR			TABLE_SPL
		LDIA			06H
		LD				TABLE_SPH,A
		TABLEA								;华氏度转换为摄氏度,调用的表格为0690H
		LD				T_ROOM_DISP,A		;常温显示中,切换到摄氏度显示模式,将原来T_ROOM_REAL的华氏度值查表转换为摄氏度后赋值给T_ROOM_DISP显示
TEMP_CH3:
;------------------------------------------------------------------;
TEMP_JUD:								; 工作温度判断
		SNZB  			F_ONOFF
		JP				END_TEMP_JUD
		SZB  			F_AUTO			; 判断是否设定了温度
		JP				TEMP_JUD_AUTO
TEMP_JUD_NOR:		
		CLRB			F_TEMP_HOLD		; 高低档模式不会锁定温度
		LD				A,HEAT_SETUP	
		LD				HEAT_WORK,A		;把设定的档位值送到工作的档位
		LD				HEAT_WORK_BUF,A	;储存到HEAT_WORK_BUF
		JP      		END_TEMP_JUD
TEMP_JUD_AUTO:		
		LD				A,T_ROOM_DISP	;当前环境的温度与设定温度的最低值(其实就是当前设定的温度值)比较
		HSUBA			T_SETUP_LOW
		SZB				C
		JP				TEMP_JUD_AUTO2 	;当前环境温度值大于设定温度
TEMP_JUD_AUTO1:									; <T_SETUP
		CLR				HEAT_WORK_BUF	
		LD				A,HEAT_WORK		;判断是高档还是低档
		HSUBIA			D'1'
		SNZB			C
		JP				END_TEMP_JUD_AUTO	;本身就是高档
		CLR				HEAT_WORK		;本身是低档,变为高档
		CLR				T_HEAT_ON		;低档切换高档,导通延时重新计算
		JP				END_TEMP_JUD_AUTO
TEMP_JUD_AUTO2:		
		LD				A,T_ROOM_DISP
		HSUBA			T_SETUP_MAX			; 数码管实际显示温度与T_SETUP_MAX比较
		SNZB			C
		JP				TEMP_JUD_AUTO3		; 如果小于T_SETUP_MAX(设定温度+3F)
		LDIA			D'2'				; >T_SETUP+3F	大于设定温度3F以上
		LD				HEAT_WORK_BUF,A
		LD				A,HEAT_WORK
		HSUBIA			D'2'
		SZB				C
		JP				END_TEMP_JUD_AUTO
		LDIA			D'2'
		LD				HEAT_WORK,A
		SETB			F_TEMP_HOLD			;锁定温度
		CLR				T_TEMP_HOLD0		;计一秒钟的变量
		CLR				T_TEMP_HOLD			;清掉锁定温度计时
		JP				END_TEMP_JUD_AUTO
TEMP_JUD_AUTO3:									; >=T_SETUP&<=T_SETUP+3F	大于设定温度但是不超过T_SETUP_MAX(T_SETUP+3F)
		LDIA			D'1'
		LD				HEAT_WORK_BUF,A
		LD				A,HEAT_WORK
		XORIA			D'1'
		SZB				Z						;判断是否低档运行
		JP				END_TEMP_JUD_AUTO
		LDIA			D'1'
		LD				HEAT_WORK,A				;原本为高档运行,切换回低档
		CLR				T_HEAT_ON				;清零换挡后的发热组件导通延时
		JP				END_TEMP_JUD_AUTO
END_TEMP_JUD_AUTO:						; OVER 4min+15s解锁
		LD				A,T_TEMP_HOLD
		HSUBIA			D'254'
		SZB				C				; 一旦温度锁定,4分15秒之后才解锁
		CLRB			F_TEMP_HOLD
END_TEMP_JUD:
;------------------------------------------------------------------;
END_SENSOR_SUB:
		RET
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
CALL_TABLE:
		LD   			A,LED_BUF2			;当前温度大于100会显示其他
		HSUBIA			D'100'
		SZB  			C
		JP      		CALL_TABLE3
		CLR     		LED_BUF1			;清零十位
CALL_TABLE1:								;分离温度十位个位
		LD   			A,LED_BUF2			;当前温度减10，
		HSUBIA  		D'10'
		SNZB  			C					;先判断是否大于10
		JP      		CALL_TABLE2			;如果小于10直接传输BUF1，BUF2数据到表中作转化，如"2"转换为11011010
		LD   			A,LED_BUF2			;还BUF2大于10则减10，并让BUF1(十位)加1，循环
		HSUBIA  		D'10'
		LD   			LED_BUF2,A			;减完之后的值重新赋给BUF2，进入下一次判断
		INCR   			LED_BUF1
		JP      		CALL_TABLE1
CALL_TABLE2:                
		LD				A,LED_BUF1			;把十位数送入表中转换为对应的数码管值
		LD				TABLE_SPL,A			;？
		;LDIA			00H
		;ADDR			TABLE_SPL
		LDIA    		07H					;表地址
		LD				TABLE_SPH,A
		TABLEA								;调用表
		LD      		LED_BUF1,A			;将转换之后的值放入BUF1

		LD				A,LED_BUF2			;把个位数送入表中转换
		LD				TABLE_SPL,A
		;LDIA			00H
		;ADDR			TABLE_SPL
		LDIA   	 		07H					;表地址
		LD				TABLE_SPH,A
		TABLEA
		LD      		LED_BUF2,A			;将转换之后的值放入BUF2
		RET
;------------------------------------------------------------------;
CALL_TABLE3:
		LDIA    		0FAH				;如果是超过100度的值，显示99？
		LD   			LED_BUF1,A
		LD   			LED_BUF2,A
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
		DW	     D'4' 	      ;39				39/40华氏度对应的都是4摄氏度
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
DISP_TABLE:										;此表用于将单个的数字如1,2,3……转换为它相应亮的数码管的位值
		DW	07EH	; 0
		DW	018H	; 1
		DW	0B6H	; 2
		DW	0BAH	; 3
		DW	0D8H	; 4
		DW	0EAH	; 5
		DW	0EEH	; 6
		DW	038H	; 7
		DW	0FEH	; 8
		DW	0FAH	; 9
		DW	0EEH	; A
		DW	03EH	; b
		DW	09CH	; C
		DW	07AH	; d
		DW	09EH	; E
		DW	08EH	; F
;------------------------------------------------------------------;
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
		
