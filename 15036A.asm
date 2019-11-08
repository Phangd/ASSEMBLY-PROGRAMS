		#INCLUDE		CMS6053D.H    
;******************************************************************;
		FLAG0			EQU		?
		FLAG1			EQU		?
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
		CODE1           EQU		?
		CODE2           EQU		?
		TN				EQU		?
		REMOTE_DATA1	EQU		?
		REMOTE_DATA2	EQU		?
		TRANS_DATA1		EQU		?
		TRANS_DATA2		EQU		?
		BIT_NUM			EQU		?
		BIT_STEP        EQU		?
		TRANS_BUF1		EQU		?
		TRANS_BUF2		EQU		?
		COUNTER			EQU		?
		POWER_DELAY1	EQU		?
		REMOTE_BUF		EQU		?
		T_REMOTE1       EQU		?
		T_REMOTE2       EQU		?
		T_REMOTE3       EQU		?
		T_SEND			EQU		?
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
TRANSMIT:								; MCU间单向通讯发送程序
		SZINCR		BIT_STEP
		NOP
		LD			A,BIT_NUM
		SNZB		STATUS,Z
		JP			TRANSMIT1
TRANSMIT0:								; 5ms高电平
		LD			A,BIT_STEP
		HSUBIA		D'40'
		SNZB		STATUS,C
		JP			SEND1
		CLR			BIT_STEP
		LDIA		D'1'
		LD			BIT_NUM,A
		LD			A,TRANS_BUF1
		LD			TRANS_DATA1,A
		LD			A,TRANS_BUF2
		LD			TRANS_DATA2,A
		JP			SEND0
TRANSMIT1:								; 16位代码
		LD			A,BIT_NUM
		HSUBIA		D'17'
		SZB			STATUS,C
		JP			STOP_TRANSMIT
		SNZB		TRANS_DATA1,7
		JP			BIT0
BIT1:									; 1：1.5ms脉宽
		LD			A,BIT_STEP
		HSUBIA		D'12'
		SNZB		STATUS,C
		JP			END_TRANSMIT
		JP			BIT_JUD
BIT0:									; 0：0.5ms脉宽
		LD			A,BIT_STEP
		HSUBIA		D'4'
		SNZB		STATUS,C
		JP			END_TRANSMIT 
BIT_JUD:
		CLR			BIT_STEP
		SZINCR		BIT_NUM
		NOP
		RLCR		TRANS_DATA2
		RLCR		TRANS_DATA1
		LDIA		B'00000100'			; P2.2为数据发送口
		XORR		P2
		JP			END_TRANSMIT
STOP_TRANSMIT:							; 结束0.5ms低电平
		LD			A,BIT_STEP
		HSUBIA		D'4'
		SZB			STATUS,C
		CLR			BIT_NUM
SEND0:
		CLRB		OUT_DATA
		JP			END_TRANSMIT
SEND1:
		SETB		OUT_DATA
END_TRANSMIT:
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
		CLRB		CODE2,0				;BIT为"0"
		LD			A,TN
		HSUBIA		D'7'				; 1ms?
		SZB			STATUS,C
        SETB		CODE2,0				;BIT为"1"
YK_BITJUD:	
		CLR			TN
		SZINCR		REMOTE_NUM
		LD			A,REMOTE_NUM
		HSUBIA		D'12'
		SNZB		STATUS,C
		JP			END_REMOTE
		LD			A,CODE1
		LD			REMOTE_DATA1,A
		LD			A,CODE2
		LD			REMOTE_DATA2,A
		SETB		F_REMOTE
		JP			END_REMOTE
YK_NPULSE:
  	    SNZB		F_RISE_YK
		JP			END_REMOTE
		CLRB		F_RISE_YK			; 下降沿
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
		CLR			TC0C					;clean register
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
		SZINCR		T_SEND
		NOP
        LD			A,T_SEND
		HSUBIA		D'6'
		SNZB		STATUS,C
		JP			END_TIMER_SUB
		CLR			T_SEND						;记发送数据时间,12ms发送一次
		LD			A,FLAG0
		LD			TRANS_BUF1,A
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
		RET
;******************************************************************;
SCANREMOTE:
		LD	        A,T_REMOTE1
		HSUBIA		D'250'
		SNZB	    STATUS,C
		SZINCR	    T_REMOTE1
		LD	        A,T_REMOTE2
		HSUBIA		D'250'
		SNZB	    STATUS,C
		SZINCR	    T_REMOTE2
		LD	        A,T_REMOTE3
		HSUBIA		D'250'
		SNZB	    STATUS,C
		SZINCR	    T_REMOTE3
SCANREMOTE0:
		SNZB	    F_REMOTE
		JP	        END_SCANREMOTE0
		CLRB	    F_REMOTE
		CLR	        T_REMOTE3
		LD	        A,REMOTE_DATA1
		XORIA		0DH
		SNZB	    STATUS,Z
		JP	        END_SCANREMOTE3
		LD	        A,REMOTE_DATA2	; 按键松开
		XORIA		80H
		SZB     	STATUS,Z
		JP	        OFF_YKKEY
		LD	        A,REMOTE_DATA2	; 连续接收两串相同码？
		XORA		REMOTE_BUF
		SZB	        STATUS,Z
		JP	        YKKEY_JUD
YKKEY_FIRST:
		LD	        A,REMOTE_DATA2
		LD	        REMOTE_BUF,A
		JP	        END_SCANREMOTE1
YKKEY_JUD:
		SZB	        F_ON_REMOTE			; 按键长按
		JP	        OLDYK
		LD	        A,T_REMOTE2	; <20ms?   ; 两串码的接收间隔为27ms？
		HSUBIA		D'10';3
		SNZB	    STATUS,C
		JP	        END_SCANREMOTE3
		LD	        A,T_REMOTE2	; >40ms?
		HSUBIA		D'20';5
		SZB	        STATUS,C
		JP	        END_SCANREMOTE3
		JP	        NEWYK
OLDYK:							; >80ms?
		JP	        END_SCANREMOTE2			;无遥控长按功能
		LD	        A,T_REMOTE1
		HSUBIA		D'220';60
		SNZB	    STATUS,C
		JP	        END_SCANREMOTE1;END_SCANREMOTE
		CLR	        T_REMOTE1
		LD	        A,REMOTE_DATA2
		XORIA		88H
		SZB	        STATUS,Z
		JP	        YKKEY_TIMER;YKKEY_TIMER_UP
		JP	        END_SCANREMOTE2
NEWYK:							; 键码判断
		SETB	    F_ON_REMOTE
		LD	        A,REMOTE_DATA2
		XORIA		81H
		SZB     	STATUS,Z
		JP	        YKKEY_POWER
		LD	        A,REMOTE_DATA2
		XORIA		82H
		SZB	        STATUS,Z
		JP	        YKKEY_SPEED
		LD	        A,REMOTE_DATA2
		XORIA		88H
		SZB	        STATUS,Z
		JP	        YKKEY_TIMER
YKKEY_POWER:
		CALL	   	KEY_POWER
		JP	       	END_YKKEY
YKKEY_SPEED:	
		CALL	   	KEY_SPEED
		JP	       	END_YKKEY
YKKEY_TIMER:	
		CALL	   	KEY_TIMER
		JP	       	END_YKKEY
END_YKKEY:	
		JP	       	END_SCANREMOTE2
OFF_YKKEY:	
		CLRB	   	F_ON_REMOTE
END_SCANREMOTE2:	
		CLR	       	T_REMOTE1
END_SCANREMOTE1:	
		CLR	       	T_REMOTE2
		JP	       	END_SCANREMOTE
END_SCANREMOTE3:	
		CLR	       	REMOTE_BUF
		CLR	       	T_REMOTE1
		CLR	       	T_REMOTE2
		JP	       	END_SCANREMOTE
END_SCANREMOTE0:	
		LD	       	A,T_REMOTE3
		NOP	
		HSUBIA     	D'25';13
		SNZB	   	STATUS,C
		JP	       	END_SCANREMOTE
		CLR        	REMOTE_BUF
		CLRB	   	F_ON_REMOTE
END_SCANREMOTE:
		RET
;******************************************************************;
		JP			RESET
		END
