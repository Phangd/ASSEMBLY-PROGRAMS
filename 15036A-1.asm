		#INCLUDE		CMS6053D.H    
;******************************************************************;
		FLAG0			EQU		?
		FLAG1			EQU		?
		FLAG2			EQU		?
		TIME_2MS		EQU		?
		KEY_VALUE		EQU		?
		KEY_VALUE0		EQU		?
		KEY_DELAY1		EQU		?
		KEY_DELAY2		EQU		?
		SPEED			EQU		?
		SPEED_BUF		EQU		?
		TIMER_HOUR		EQU		?
		HOURS			EQU		?
		HIG_TIMER		EQU		?
		TIMER_250MS     EQU		?
		TIMER_ONE_MIN	EQU		?
		TIMER_ONE_HOUR	EQU		?
		REMOTE_NUM      EQU		?
		TN				EQU		?
		CODE1           EQU		?
		CODE2           EQU		?	
		CODE1_BUF		EQU		?
		CODE2_BUF		EQU		?
		TRANS_DATA1		EQU		?
		TRANS_DATA2		EQU		?
		BIT_NUM			EQU		?
		TRANS_BUF1		EQU		?
		TRANS_BUF2		EQU		?
		COUNTER			EQU		?
		POWER_DELAY1	EQU		?
		T_REMOTE1       EQU		?
		T_REMOTE2       EQU		?
		T_REMOTE3       EQU		?
		T_SEND			EQU		?
		DATA			EQU		?
		DATA_BUF		EQU		?
		PLUSE_TIME		EQU		?
;******************************************************************;
;		Bit Flag Definition				   						   ;
;******************************************************************;
		F_2MS			EQU		TIME_2MS,4
			
		F_ONOFF			EQU		FLAG0,6
		F_OSC			EQU		FLAG0,5
		F_ION			EQU		FLAG0,4
		F_HIG			EQU		FLAG0,3
		F_MID           EQU		FLAG0,2
		F_LOW           EQU		FLAG0,1
		F_SLOW          EQU		FLAG0,0
		
		F_RISE_YK		EQU		FLAG1,0
		F_REMOTE		EQU		FLAG1,1
		F_T1S           EQU		FLAG1,2
		F_PRESSING		EQU		FLAG1,3
		F_ON_REMOTE		EQU		FLAG1,4
		F_SEND			EQU		FLAG1,5
		F_BIT_HEAD		EQU		FLAG1,6
		F_BIT_END       EQU		FLAG1,7
		
		F_BIT1          EQU		FLAG2,0
		F_BIT0          EQU		FLAG2,1
;******************************************************************;
		REMOTE			EQU		P1,1
			
		LED_SEG1		EQU		P2,3
		LED_SEG2		EQU		P2,5
		LED_COM1		EQU		P0,0
		LED_COM2		EQU		P5,4
		LED_COM3		EQU		P1,0
		LED_COM4		EQU		P2,4
			
		SW_OSC			EQU		P2,1
		SW_TIMER		EQU		P2,0
		SW_SPEED		EQU		P1,3
		SW_POWER		EQU		P1,2
			
		OUT_DATA		EQU		P2,2
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
		SNZB		INTRQ,TC0IRQ
		JP			INT_EXIT
		CLRB		INTRQ,TC0IRQ
;------------------------------------------------------------------;	
TIMER:
		SZINCR		TIME_2MS
		NOP
;------------------------------------------------------------------;		
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
		SZINCR		BIT_NUM				;发送的位数
		NOP
		RLCR		DATA          ;连续发送两次DATA的值
		SNZB		STATUS,C
		JP			BIT_ZERO
		SETB		F_BIT1				;DATA的第七位为1,置发1标志位,把第0位置1(左移之后第零位补得是C中的0),边左移边恢复
		SETB		DATA,0
		CLR			PLUSE_TIME
		JP			SEND_BIT1
BIT_ZERO:
		SETB		F_BIT0				;第七位为0,置发0标志位为1,把第0位置0
		CLRB		DATA,0
		CLR 		PLUSE_TIME
SEND_BIT0:
		SZINCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		STATUS,C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'9'
		SNZB		STATUS,C
		JP			SEND0
		CLRB		F_BIT0
		JP			SEND_DEAL
SEND_BIT1:
		SZINCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		STATUS,C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'17'
		SNZB		STATUS,C
		JP			SEND0
		CLRB		F_BIT1
SEND_DEAL:
		CLR			PLUSE_TIME
		LD			A,BIT_NUM
		HSUBIA		D'16'
		SNZB		STATUS,C
		JP			END_SEND_DATA
		CLR			BIT_NUM
		SETB		OUT_DATA
		SETB		F_BIT_END
		JP			END_SEND_DATA
BIT_HEAD:
		SZINCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'32'
		SNZB		STATUS,C
		JP			SEND1
		LD			A,PLUSE_TIME
		HSUBIA		D'63'
		SNZB		STATUS,C
		JP			SEND0
		CLR			PLUSE_TIME
		SETB		F_BIT_HEAD
		CLRB		F_BIT0
		CLRB		F_BIT1
		JP			END_SEND_DATA
BIT_END:
		SZINCR		PLUSE_TIME
		NOP
		LD			A,PLUSE_TIME
		HSUBIA		D'5'
		SNZB		STATUS,C
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
;------------------------------------------------------------------;
REMOTE_RECEIVE:	
		LD   		A,TN
		HSUBIA  	D'200'
		SNZB		STATUS,C
		SZINCR 		TN
		SNZB		REMOTE
		JP			YK_NPULSE
YK_PPULSE:
  	    SZB			F_RISE_YK
		JP			END_REMOTE
		SETB		F_RISE_YK			; 上升沿
		RLCR  		CODE2
		RLCR  		CODE1
		LD			A,TN				; >2ms
		HSUBIA		D'16'
		SZB			STATUS,C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA		D'2'
		SNZB		STATUS,C
		JP			ERROR_REMOTE
		CLRB		CODE2,0				;小于1ms,BIT为"0"
		LD			A,TN
		HSUBIA		D'7'				; 1ms?
		SZB			STATUS,C
        SETB		CODE2,0				;大于1ms,BIT为"1"
YK_BITJUD:	
		CLR			TN
		SZINCR		REMOTE_NUM
		LD			A,REMOTE_NUM
		HSUBIA		D'12'				;只收12位
		SNZB		STATUS,C
		JP			END_REMOTE
		LD			A,CODE1
		LD			CODE1_BUF,A
		LD			A,CODE2
		LD			CODE2_BUF,A
		SETB		F_REMOTE
		JP			END_REMOTE
YK_NPULSE:
  	    SNZB		F_RISE_YK
		JP			END_REMOTE
		CLRB		F_RISE_YK			; 下降沿不处理，红外遥控波形只有在上升时才代表键码变化
		LD			A,TN
		HSUBIA		D'16'				; >2ms?
		SZB			STATUS,C
		JP			ERROR_REMOTE
		LD			A,TN				; >2ms?
		HSUBIA		D'2'
		SNZB		STATUS,C
		JP			ERROR_REMOTE
		CLR			TN
		JP			END_REMOTE
ERROR_REMOTE:	
        CLR			TN
		CLR			CODE1
		CLR			CODE2
		CLR			REMOTE_NUM
END_REMOTE:
;------------------------------------------------------------------;
INT_EXIT:
		POP
		RETI
;******************************************************************;
RESET:
		CLRWDT
		NOP
		CLRB		STKP,GIE
		CLR			STATUS
		OPTION
		LDIA		B'11111111'				;P0.0 LED输出
		LD			P0M,A
		LDIA		B'11110001'				;P1.0 LED输出 P1.1/2/3 遥控输入,按键输入
		LD			P1M,A
		LDIA		B'11111100'				;P2.0/1 按键输入 P2.2/3/4/5 命令输出,按键LED输出
		LD			P2M,A
		LDIA		B'11111111'				;P5,4 LED输出
		LD			P5M,A
		
		LDIA		B'00000000'
		LD			P0,A
		LDIA		B'00001100'
		LD			P1,A
		LDIA		B'00101011'
		LD			P2,A
		LDIA		B'00000000'
		LD			P5,A

		LDIA		B'00000000'
		LD			P0UR,A
		LDIA		B'00001100'
		LD			P1UR,A
		LDIA		B'00000011'
		LD			P2UR,A
		LDIA		B'00000000'
		LD			P5UR,A
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
;------------------------------------------------------------------;
		CLR			FSRH
		LDIA		30H
		LD			FSRL,A
CLR_RAM:
		SZDECR		FSRL
		NOP
		CLR			INDF
		LD			A,FSRL
		HSUBIA		D'1'
		SZB			STATUS,C
		JP			CLR_RAM
		CLR			INDF
POWER_ON_DELAY:
		SZINCR		POWER_DELAY1
		NOP	
		LD			A,POWER_DELAY1
		HSUBIA		D'250'
		SNZB		STATUS,C
		JP			POWER_ON_DELAY
		CLR			POWER_DELAY1
		CLRWDT
;------------------------------------------------------------------;
		CLRB		TC0M,TC0ENB				;shutdown timer
		CLRB		INTRQ,TC0IRQ			;clean interrupt flag
		CLR			TC0C					;clean counting register
		LDIA		B'01110100'				;fcpu/2
		LD			TC0M,A
		LDIA		D'131'					;125us
		LD			TC0C,A
		LD			TC0R,A
		SETB		STKP,GIE
		SETB		INTEN,TC0IEN
		SETB		TC0M,TC0ENB
		LDIA		D'1'
		LD			SPEED_BUF,A
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;	
MAINLOOP:
		SNZB		F_2MS
		JP			MAINLOOP
		CLRB		F_2MS
		CLRWDT
		CALL		TIMER_SUB
		CALL		SCANKEY
		CALL		SCANREMOTE
		CALL		DISPLAY
		CALL		WORK_DEAL
		JP			MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		SZINCR		TIMER_250MS
		NOP
		LD			A,TIMER_250MS
		HSUBIA		D'126'							;250MS
		SNZB		STATUS,C
		JP			T1
		CLR			TIMER_250MS
		SZINCR		T_SEND
		NOP
		LD			A,HIG_TIMER
		HSUBIA		D'10'
		SNZB		STATUS,C
		SZINCR		HIG_TIMER
		NOP
TIMER_JUD:
		SZINCR		TIMER_ONE_MIN
		NOP
		LD			A,TIMER_ONE_MIN
		HSUBIA		D'241'							;1MIN
		SNZB		STATUS,C
		JP			END_TIMER_JUD
		CLR			TIMER_ONE_MIN
		SZINCR		TIMER_ONE_HOUR
		NOP
		LD			A,TIMER_ONE_HOUR
		HSUBIA		D'60'
		SNZB		STATUS,C
		JP			END_TIMER_JUD
		CLR			TIMER_ONE_HOUR
		
		LD			A,HOURS
		HSUBIA		D'1'
		SNZB		STATUS,C
		JP			END_TIMER_JUD
		SZDECR		HOURS
		NOP
		LD			A,HOURS
		HSUBIA		D'1'
		SZB			STATUS,C
		JP			END_TIMER_JUD
		CLRB		F_ONOFF
END_TIMER_JUD:
;------------------------------------------------------------------;
T1:
        LD			A,T_SEND
		HSUBIA		D'6'
		SNZB		STATUS,C
		JP			END_TIMER_SUB
		CLR			T_SEND
		CLR			BIT_NUM
		CLR			PLUSE_TIME
		LD			A,DATA_BUF
		LD			DATA,A
		CLRB		F_BIT_HEAD
		SETB		F_SEND
END_TIMER_SUB:
		RET
;******************************************************************;		
DISPLAY:
		SETB		LED_SEG1
        SETB		LED_SEG2
		CLRB		LED_COM1
		CLRB		LED_COM2
		CLRB		LED_COM3
		CLRB		LED_COM4
		SNZB		F_ONOFF
		JP			END_DISPLAY
		SZINCR		COUNTER
		NOP
		LD			A,COUNTER
		HSUBIA		D'3'
		SNZB		STATUS,C
		JP			DIS_SPEED
		LDIA		D'1'
		LD			COUNTER,A
;------------------------------------------------------------------;
DIS_SPEED:
		LD			A,COUNTER
		XORIA		01H
		SNZB		STATUS,Z
		JP			END_DIS_SPEED
		LD			A,SPEED
		XORIA		01H
		SZB			STATUS,Z
		JP			MODE_HIG
		
		LD			A,SPEED
		XORIA		02H
		SZB			STATUS,Z
		JP			MODE_MED
		
		LD			A,SPEED
		XORIA		03H
		SZB			STATUS,Z
		JP			MODE_LOW
		
		LD			A,SPEED
		XORIA		04H
		SZB			STATUS,Z
		JP			MODE_EXTRA_LOW
		JP			END_DIS_SPEED
MODE_HIG:
		CLRB		LED_SEG2
		SETB		LED_COM1
		JP			END_DIS_SPEED
MODE_MED:
		CLRB		LED_SEG2
		SETB		LED_COM2
		JP			END_DIS_SPEED
MODE_LOW:
		CLRB		LED_SEG2
		SETB		LED_COM3
		JP			END_DIS_SPEED
MODE_EXTRA_LOW:		
		CLRB		LED_SEG2
		SETB		LED_COM4
END_DIS_SPEED:
;------------------------------------------------------------------;
DIS_TIMER:
		LD			A,COUNTER
		XORIA		02H
		SNZB		STATUS,Z
		JP			END_DIS_TIMER
		LD			A,TIMER_HOUR
		XORIA		01H
		SZB			STATUS,Z
		JP			TIMER_1H
		
		LD			A,TIMER_HOUR
		XORIA		02H
		SZB			STATUS,Z
		JP			TIMER_2H
		
		LD			A,TIMER_HOUR
		XORIA		03H
		SZB			STATUS,Z
		JP			TIMER_4H
		
		LD			A,TIMER_HOUR
		XORIA		04H
		SZB			STATUS,Z
		JP			TIMER_8H
		JP			END_DIS_TIMER
TIMER_1H:
		CLRB		LED_SEG1
		SETB		LED_COM4
		JP			END_DIS_TIMER
TIMER_2H:
		CLRB		LED_SEG1
		SETB		LED_COM3
		JP			END_DIS_TIMER
TIMER_4H:
		CLRB		LED_SEG1
		SETB		LED_COM2
		JP			END_DIS_TIMER
TIMER_8H:
		CLRB		LED_SEG1
		SETB		LED_COM1
END_DIS_TIMER:
;------------------------------------------------------------------;		
END_DISPLAY:
		RET
;******************************************************************;
SCANKEY:
		LDIA		B'11110001'
	    LD			P1M,A
	    LDIA		B'11111100'
	    LD			P2M,A
		LDIA		B'00001100'
		LD			P1UR,A
		LDIA		B'00000011'
		LD			P2UR,A
		
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
		SNZB		SW_OSC
		SETB		KEY_VALUE,0
		SNZB		SW_TIMER
		SETB		KEY_VALUE,1
		SNZB		SW_SPEED
		SETB		KEY_VALUE,2
		SNZB		SW_POWER
		SETB		KEY_VALUE,3
		NOP
		NOP
		NOP
		NOP
		NOP
;------------------------------------------------------------------;
END_KEY_JUDG:
		LD			A,KEY_VALUE
		HSUBIA		D'1'
		SZB			STATUS,C
		JP			ON_KEY
NO_KEY:
		LD			A,KEY_DELAY2
		HSUBIA		D'10'
		SZB			STATUS,C
		JP			NO_KEY1
		SZINCR		KEY_DELAY2
		NOP
		JP			END_SCANKEY
NO_KEY1:
		CLRB		F_PRESSING
		CLR			KEY_VALUE0
		CLR			KEY_DELAY1
		JP			END_SCANKEY
ON_KEY:	
		LD			A,KEY_VALUE
		XORA		KEY_VALUE0
		SZB			STATUS,Z
		JP    		ON_KEY1
		CLR     	KEY_DELAY1
		LD			A,KEY_VALUE
		LD			KEY_VALUE0,A
		JP    		END_SCANKEY
ON_KEY1:	
		LD   		A,KEY_DELAY1
		HSUBIA  	D'5'
		SZB  		STATUS,C
		JP      	KEY_JUD
		SZINCR  	KEY_DELAY1
		NOP	
		JP      	END_SCANKEY
KEY_JUD:
		SZB			F_PRESSING
		JP			OLD_KEY
		LD			A,KEY_DELAY2
		HSUBIA		D'3'
		SNZB		STATUS,C
		JP			ILLEGAL_PRESS
		CLR			KEY_DELAY2
		SETB		F_PRESSING
		LD			A,KEY_VALUE
		XORIA		01H
		SZB			STATUS,Z
		JP			KEY_OSC
		LD			A,KEY_VALUE
		XORIA		02H
		SZB			STATUS,Z
		JP			KEY_TIMER
		LD			A,KEY_VALUE
		XORIA		04H
		SZB			STATUS,Z
		JP			KEY_SPEED
		LD			A,KEY_VALUE
		XORIA		08H
		SZB			STATUS,Z
		JP			KEY_POWER
OLD_KEY:
		JP			END_SCANKEY				;无长按功能
KEY_OSC:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		SNZB		F_OSC
		JP			OSC_ON
		SZB			F_OSC
		JP			OSC_OFF
OSC_ON:
		SETB		F_OSC
		JP			END_SCANKEY
OSC_OFF:
		CLRB		F_OSC
		JP			END_SCANKEY
KEY_POWER:
		SNZB		F_ONOFF
		JP			POWER_ON
		JP			POWER_OFF
POWER_ON:
		SETB		F_ONOFF
		LD			A,SPEED_BUF
		LD			SPEED,A
		CLR			TIMER_HOUR
		CLR			HOURS
		CLRB		F_OSC
		CLR			HIG_TIMER
		CLR			TIMER_250MS
		CLR			TIMER_ONE_MIN
		CLR			TIMER_ONE_HOUR
		JP			END_SCANKEY
POWER_OFF:
		CLRB		F_ONOFF
		CLR			TIMER_HOUR
		CLR			HOURS
		LD			A,SPEED
		LD			SPEED_BUF,A
		JP			END_SCANKEY
KEY_SPEED:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		SZINCR		SPEED
		NOP
		LD			A,SPEED
		HSUBIA		D'5'
		SNZB		STATUS,C
		JP			END_SCANKEY
		LDIA		D'1'
		LD			SPEED,A
		JP			END_SCANKEY
KEY_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		SZINCR		TIMER_HOUR
		NOP
		LD			A,TIMER_HOUR
		HSUBIA		D'5'
		SNZB		STATUS,C
		JP			END_KEY_TIMER
		CLR			TIMER_HOUR
END_KEY_TIMER:
		CLR			TIMER_250MS
		CLR			TIMER_ONE_MIN
		CLR			TIMER_ONE_HOUR
		
		LD			A,TIMER_HOUR
		XORIA		00H
		SZB			STATUS,Z
		JP			TIMER_0HOUR
		
		LD			A,TIMER_HOUR
		XORIA		01H
		SZB			STATUS,Z
		JP			TIMER_1HOUR
		
		LD			A,TIMER_HOUR
		XORIA		02H
		SZB			STATUS,Z
		JP			TIMER_2HOUR
		
		LD			A,TIMER_HOUR
		XORIA		03H
		SZB			STATUS,Z
		JP			TIMER_4HOUR
		
		LD			A,TIMER_HOUR
		XORIA		04H
		SZB			STATUS,Z
		JP			TIMER_8HOUR
		JP			END_SCANKEY
TIMER_0HOUR:		
		CLR			HOURS
		JP			END_SCANKEY
TIMER_1HOUR:
		LDIA		D'1'
		LD			HOURS,A
		JP			END_SCANKEY
TIMER_2HOUR:
		LDIA		D'2'
		LD			HOURS,A
		JP			END_SCANKEY
TIMER_4HOUR:
		LDIA		D'4'
		LD			HOURS,A
		JP			END_SCANKEY
TIMER_8HOUR:
		LDIA		D'8'
		LD			HOURS,A
		JP			END_SCANKEY
ILLEGAL_PRESS:
		CLR			KEY_DELAY2
		CLR			KEY_VALUE
END_SCANKEY:		
		RET
;******************************************************************;
WORK_DEAL:
		SZB			F_ONOFF
		JP			WORK_JUD
WORK_STOP:
		CLRB		F_HIG
		CLRB		F_MID
		CLRB		F_LOW
		CLRB		F_SLOW
		CLRB		F_OSC
		JP			END_WORK_SUB
WORK_JUD:
		LD			A,HIG_TIMER
		HSUBIA		D'4'								;1S
		SNZB		STATUS,C
		JP			WORK_HIG
SPEED_JUD:
		LD			A,SPEED
		XORIA		01H
		SZB			STATUS,Z
		JP			WORK_HIG
		
		LD			A,SPEED
		XORIA		02H
		SZB			STATUS,Z
		JP			WORK_MID
		
		LD			A,SPEED
		XORIA		03H 
		SZB			STATUS,Z
		JP			WORK_LOW
		
		LD			A,SPEED
		XORIA		04H
		SZB			STATUS,Z
		JP			WORK_ELOW
		JP			END_DISPLAY
WORK_HIG:
		CLRB		F_MID
		CLRB		F_LOW
		CLRB		F_SLOW
		SETB		F_HIG
		JP			END_WORK_SUB
WORK_MID:
		CLRB		F_HIG
		CLRB		F_LOW
		CLRB		F_SLOW
		SETB		F_MID
		JP			END_WORK_SUB
WORK_LOW:
		CLRB		F_MID
		CLRB		F_HIG
		CLRB		F_SLOW
		SETB		F_LOW
		JP			END_WORK_SUB
WORK_ELOW:
		CLRB		F_MID
		CLRB		F_LOW
		CLRB		F_HIG
		SETB		F_SLOW
END_WORK_SUB:
		LD			A,FLAG0
		XORA		DATA_BUF
		SZB			STATUS,Z
		JP			END_WORK_SUB1
		LD			A,FLAG0
		LD			DATA_BUF,A
		LDIA		D'20'
		LD			T_SEND,A
END_WORK_SUB1:		
		RET
;******************************************************************;
SCANREMOTE:
		LD			A,T_REMOTE1
		HSUBIA		D'250'
		SNZB		STATUS,C
		SZINCR		T_REMOTE1
		NOP	
		LD			A,T_REMOTE2
		HSUBIA		D'250'
		SNZB		STATUS,C
		SZINCR		T_REMOTE2
		NOP	
SCANREMOTE0:	
		SZB			F_REMOTE					;F_REMOTE标志位在接收完12位遥控码后置1
		JP			SCANREMOTE1
		LD			A,T_REMOTE2
		HSUBIA		D'30';'50'					;按键释放(重复码处理)
		SNZB		STATUS,C
		JP			END_SCANREMOTE
		CLRB		F_ON_REMOTE
		JP			END_SCANREMOTE
SCANREMOTE1:	
		CLRB		F_REMOTE
		SZB			F_PRESSING
		JP			OFF_YKKEY
		LD			A,CODE1_BUF
		XORIA		0DH							; 00001101 起始码位 110 + 用户码 1 (11中的一个)
		SNZB		STATUS,Z
		JP			END_SCANREMOTE2
		SNZB		F_ON_REMOTE					; 新键码直接响应，相同键码则接收间隔超过80ms重新响应
		JP			NEWYK
OLDYK:												; >80ms?
		;JP			END_SCANREMOTE2
		;LD			A,T_REMOTE1
		;HSUBIA		D'200'
		;SNZB		FLAGS,C
		;JP			END_SCANREMOTE1
		;LD			A,CODE2_BUF
		;XORIA		8CH
		;SZB		FLAGS,Z
		;JP			YKKEY_TIMER
		JP			END_SCANREMOTE2
NEWYK:												; 键码判断
		SETB		F_ON_REMOTE
		LD			A,CODE2_BUF
		XORIA		81H							;B'10000001'	K1	用户码1(另一个1) + 6位指令码
		SZB			STATUS,Z
		JP			YK_KEY_ONOFF
		LD			A,CODE2_BUF
		XORIA		82H							;B'10000010'	K2
		SZB			STATUS,Z
		JP			YK_KEY_SPEED
		LD			A,CODE2_BUF
		XORIA		88H							;B'10001000'	K4
		SZB			STATUS,Z
		JP			YK_KEY_TIME
		LD			A,CODE2_BUF
		XORIA		90H							;B'10010000'	K5
		SZB			STATUS,Z
		JP			YK_KEY_OSC
		JP			END_SCANREMOTE
YK_KEY_ONOFF:	
		CALL		KEY_POWER
		JP			END_YKKEY
YK_KEY_SPEED:	
		CALL		KEY_SPEED
		JP			END_YKKEY
YK_KEY_TIME:	
		CALL		KEY_TIMER
		JP			END_YKKEY
YK_KEY_OSC:	
		CALL		KEY_OSC
END_YKKEY:	
		JP			END_SCANREMOTE2
OFF_YKKEY:	
		CLRB		F_ON_REMOTE
END_SCANREMOTE2:	
		CLR			T_REMOTE1
END_SCANREMOTE1:	
		CLR			T_REMOTE2
END_SCANREMOTE:
		RET
;******************************************************************;
		JP			RESET
		END
