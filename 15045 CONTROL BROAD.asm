;*****************************************************;
		#INCLUDE 	CMS6053D.H
;*****************************************************;	
		REMOTE		EQU		P1,1
		OUT_DATA	EQU		P2,3
		
		SW_SEG1		EQU		P1,3
		SW_SEG2		EQU		P2,1
		SW_COM1		EQU		P1,2
		SW_COM2		EQU		P2,0
		
		LED_COM1	EQU		P0,0
		LED_COM2	EQU		P2,2
		
		LED_SEG1	EQU		P2,5
		LED_SEG2	EQU		P2,4
		LED_SEG3	EQU		P5,4
		LED_SEG4	EQU		P1,0
;*****************************************************;
		T2MS_TIMER	EQU		?
		KEY_VALUE	EQU		?
		LEDN		EQU		?
		FLAG0		EQU		?
		FLAG1		EQU		?
		TIMER_HOUR	EQU		?
		SPEED		EQU		?
		SPEED_BUF	EQU		?
		KEY_DELAY1	EQU		?
		KEY_DELAY2	EQU		?
		KEY_VALUE0	EQU		?
		REMOTE_NUM	EQU		?
		CODE1		EQU		?
		CODE2		EQU		?
		TN		EQU		?
		REMOTE_BUF      EQU		?
		T_REMOTE1       EQU		?
		T_REMOTE2       EQU		?
		T_REMOTE3       EQU		?
		BIT_CONT	EQU		?
		BIT_TIME        EQU		?
		DATA            EQU		?
		T_SEC0		EQU		?
		T_MIN		EQU		?
		T_SEC           EQU		?
		T_HOUR          EQU		?
		KEY_DELAY       EQU		?
		REMOTE_DATA1	EQU		?
		REMOTE_DATA2	EQU		?
;*****************************************************;
;		     Bit Flag Definition              ;
;*****************************************************;
		F_ONKEY		EQU		FLAG0,0
		F_ONOFF		EQU		FLAG0,1
		F_RISE_YK	EQU		FLAG0,2
		F_REMOTE	EQU		FLAG0,3
		F_OUT_HIG	EQU		FLAG0,4
		F_OUT_MID	EQU             FLAG0,5
		F_OUT_LOW       EQU             FLAG0,6
		F_OUT_OSC	EQU		FLAG0,7
		
		F_BIT0		EQU		FLAG1,0
		F_BIT1		EQU		FLAG1,1
		F_BIT_FIRST	EQU		FLAG1,2
		F_OSC		EQU		FLAG1,3
		F_ON_REMOTE	EQU		FLAG1,4
		F_BIT_END	EQU		FLAG1,5
		F_SEND		EQU		FLAG1,6

		
		T_2MS		EQU		T2MS_TIMER,4
;*****************************************************;
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
		JP			INIT_TIMER0
;**********************TIMER**************************;
INIT_TIMER0:
		PUSH
		SNZB		INTEN,TC0IEN
		JP			INIT_EXIT
		SNZB		INTRQ,TC0IRQ
		JP			INIT_EXIT
		CLRB		INTRQ,TC0IRQ
TIMER0:
		SZINCR		T2MS_TIMER
		NOP
ENDTINT:
;*********************REMOTE**************************;
REMOTE_RECEIVE:	
		LD      	A,TN
		HSUBIA  	D'200'
		SNZB		STATUS,C
		SZINCR 		TN
		SNZB		REMOTE
		JP	    	YK_NPULSE
YK_PPULSE:
  	    SZB 		F_RISE_YK
		JP	    	END_REMOTE
		SETB		F_RISE_YK			; 上升沿
		RLCR  		CODE2
		RLCR  		CODE1
		LD	    	A,TN				; >2ms
		HSUBIA		D'16'
		SZB  		STATUS,C
		JP	    	ERROR_REMOTE
		LD	    	A,TN
		HSUBIA		D'2'
		SNZB		STATUS,C
		JP	    	ERROR_REMOTE
		CLRB		CODE2,0
		LD	    	A,TN
		HSUBIA		D'7'				; 1ms?
		SZB 		STATUS,C
YK_BIT1:		
		SETB		CODE2,0
YK_BITJUD:		
		CLR	    	TN
		SZINCR		REMOTE_NUM
		NOP	
		LD	    	A,REMOTE_NUM
		HSUBIA		D'12'
		SNZB		STATUS,C
		JP	    	END_REMOTE
		LD	    	A,CODE1
		LD	    	REMOTE_DATA1,A
		LD	    	A,CODE2
		LD	    	REMOTE_DATA2,A
		SETB		F_REMOTE
		JP	    	END_REMOTE
YK_NPULSE:	
  	    SNZB		F_RISE_YK
		JP	    	END_REMOTE
		CLRB		F_RISE_YK			; 下降沿
		LD	    	A,TN
		HSUBIA		D'16'				; >2ms?
		SZB	    	STATUS,C
		JP	    	ERROR_REMOTE
		LD	    	A,TN				; >.2ms?
		HSUBIA		D'2'
		SNZB		STATUS,C
		JP	    	ERROR_REMOTE
		CLR	    	TN
		JP	    	END_REMOTE
ERROR_REMOTE:	
        CLR	   		TN
		CLR	   		CODE1
		CLR	   		CODE2
		CLR	   		REMOTE_NUM
END_REMOTE:
;********************SEND DATA**************************;
SEND_SEVEC:
		SNZB		F_SEND
		JP	    	DATA_BIT0
		SNZB		F_BIT_FIRST
		JP	    	BIT_FIRST
		SZB 		F_BIT_END
		JP	    	BIT_END
		SZB 		F_BIT0
		JP	    	SEND_BIT0
		SZB 		F_BIT1
		JP	    	SEND_BIT1
SEND_SEVEC1:	
		SZINCR		BIT_CONT
		RLCR		DATA
		SNZB		STATUS,C
		JP	    	SEND_SEVEC2
		SETB		DATA,0
		SETB		F_BIT1
		CLR	    	BIT_TIME
		JP	    	SEND_BIT1
SEND_SEVEC2:	
		CLRB		DATA,0
		SETB		F_BIT0
		CLR	    	BIT_TIME
		JP	    	SEND_BIT0
SEND_BIT1:		
		SZINCR		BIT_TIME
		NOP	
		LD	    	A,BIT_TIME
		HSUBIA  	D'5'
		SNZB		STATUS,C
		JP	    	DATA_BIT1
		LD	    	A,BIT_TIME
		NOP	
		HSUBIA  	D'17'
		SNZB		STATUS,C
		JP	    	DATA_BIT0
		CLR  		BIT_TIME
		CLRB		F_BIT1
		LD	    	A,BIT_CONT
		NOP	
		HSUBIA  	D'16';8
		SNZB		STATUS,C
		JP	    	END_SEND_SEVEC
		CLR	    	BIT_CONT
		SETB		OUT_DATA
		SETB		F_BIT_END
		JP	    	END_SEND_SEVEC
SEND_BIT0:		
		SZINCR		BIT_TIME
		NOP	
		LD	    	A,BIT_TIME
		HSUBIA  	D'5'
		SNZB		STATUS,C
		JP	    	DATA_BIT1
		LD	    	A,BIT_TIME
		NOP	
		HSUBIA  	D'9'
		SNZB		STATUS,C
		JP	    	DATA_BIT0
		CLRB		F_BIT0
		CLR	    	BIT_TIME
		LD	    	A,BIT_CONT
		NOP	
		HSUBIA  	D'16';8
		SNZB		STATUS,C
		JP	    	END_SEND_SEVEC
		CLR	    	BIT_CONT
		SETB		OUT_DATA
		SETB		F_BIT_END
		JP	    	END_SEND_SEVEC
BIT_END:	
		SETB		OUT_DATA
		SZINCR		BIT_TIME
		NOP	
		LD	    	A,BIT_TIME
		HSUBIA  	D'5'
		SNZB		STATUS,C
		JP	    	DATA_BIT1
		CLR	    	BIT_TIME
		CLRB		F_BIT_END
	    CLRB		F_BIT_FIRST
		CLRB		F_SEND
		JP	    	DATA_BIT0
BIT_FIRST:	
		SZINCR		BIT_TIME
		NOP	
		LD  		A,BIT_TIME
		HSUBIA  	D'32'
		SNZB		STATUS,C
		JP	    	DATA_BIT1
		LD	    	A,BIT_TIME
		HSUBIA  	D'49';63
		SNZB		STATUS,C
		JP	    	DATA_BIT0
		CLR	    	BIT_TIME
		SETB		F_BIT_FIRST
		JP	    	DATA_BIT0
DATA_BIT1:	
		SETB		OUT_DATA
		JP	    	END_SEND_SEVEC
DATA_BIT0:	
		CLRB		OUT_DATA
END_SEND_SEVEC:
;**********************恢复现场*************************;		
INIT_EXIT:
		POP
		RETI
;*******************************************************;
RESET:
		CLRWDT
		NOP
		CLRB		STKP,GIE
		CLR	        STATUS
		LDIA		B'00000001'
		LD			P0,A
		LDIA		B'00000000'
		LD			P1,A
		LDIA		B'00001100'
		LD			P2,A
		LDIA		B'00000000'
		LD			P5,A

		LDIA		B'00000001'
		LD			P0M,A
		LDIA		B'00000001'
		LD			P1M,A
		LDIA		B'00111100'
		LD			P2M,A
		LDIA		B'00010000'
		LD			P5M,A

		LDIA		B'00000001'
		LD			P0,A
		LDIA		B'00000000'
		LD			P1,A
		LDIA		B'00001100'
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
;********************************************************;
		CLR			FSRH					;清专用寄存器
		LDIA		30H
		LD			FSRL,A					;清指针寄存器		
CLR_RAM:
		SZDECR		FSRL					;FSRL--;
		NOP	
		CLR 		INDF					;清间接寻址寄存器
		LD			A,FSRL
		HSUBIA		D'1'
		SZB			STATUS,C
		JP			CLR_RAM
		CLR			INDF
INIT_RAM:
		LDIA		B'01100100'
		LD			TC0M,A
		LDIA		D'131'
		LD			TC0C,A				
		LD			TC0R,A				
		CLRB		INTRQ,TC0IRQ		
		SETB		INTEN,TC0IEN
		SETB		TC0M,TC0ENB	
		SETB		STKP,GIE		
;*****************************************************;
;*****************************************************;
MAINLOOP:
		SNZB		T_2MS
		JP			MAINLOOP
		CLRB		T_2MS
		CLRWDT
		CALL		SCANKEY
		CALL		SCANREMOTE
		CALL		DISPLAY
		CALL		WORKSUB
		JP			MAINLOOP
;*****************************************************;
;*****************************************************;
SCANKEY:
		CLR			KEY_VALUE
		NOP
		NOP
		NOP
		NOP
		NOP
		LDIA		B'00000001'
		LD			P1M,A
		LDIA		B'00111101'
		LD			P2M,A
		CLRB		SW_COM2
		NOP
		NOP
		SNZB		SW_SEG2
		SETB		KEY_VALUE,0				;POWER
		SNZB		SW_SEG1
		SETB		KEY_VALUE,3				;SPEED
		NOP
		NOP
		NOP
		NOP
		NOP
		LDIA		B'00000101'
		LD			P1M,A
		LDIA		B'00111100'
		LD			P2M,A
		CLRB		SW_COM1
		NOP
		NOP
		SNZB		SW_SEG2
		SETB		KEY_VALUE,1				;TIMER
		SNZB		SW_SEG1
		SETB		KEY_VALUE,2				;OSC
END_KEY_JUDG:		
		LD			A,KEY_VALUE
		HSUBIA  	D'1'
		SZB  		STATUS,C
		JP      	ON_KEY
NO_KEY:	
		LD   		A,KEY_DELAY2
		HSUBIA  	D'10'
		SZB  		STATUS,C
		JP      	NO_KEY1
		SZINCR  	KEY_DELAY2
		NOP	
		JP      	END_KEY
NO_KEY1:	
		CLRB  		F_ONKEY
		CLR     	KEY_DELAY1
		CLR     	KEY_VALUE0
		JP    		END_KEY
ON_KEY:	
		LD			A,KEY_VALUE
		XORA		KEY_VALUE0
		SZB			STATUS,Z
		JP    		ON_KEY1
		CLR     	KEY_DELAY1
		LD			A,KEY_VALUE
		LD			KEY_VALUE0,A
		JP    		END_KEY
ON_KEY1:	
		LD   		A,KEY_DELAY1
		HSUBIA  	D'5'
		SZB  		STATUS,C
		JP      	KEY_JUD
		SZINCR  	KEY_DELAY1
		NOP	
		JP      	END_KEY
KEY_JUD:
		SZB  		F_ONKEY
		JP      	OLDKEY
		LD   		A,KEY_DELAY2
		HSUBIA  	D'3'
		SNZB  		STATUS,C
		JP      	ENDKEY0
		CLR     	KEY_DELAY2
		SETB  		F_ONKEY

		LD	    	A,KEY_VALUE
		XORIA		01H
		SZB	    	STATUS,Z
		JP	    	KEY_ONOFF
		
		LD	    	A,KEY_VALUE
		XORIA		02H
		SZB	    	STATUS,Z
		JP	    	KEY_TIMER
		
		LD	    	A,KEY_VALUE
		XORIA		04H
		SZB     	STATUS,Z
		JP	    	KEY_OSC
		
		LD	    	A,KEY_VALUE
		XORIA		08H
		SZB     	STATUS,Z
		JP	    	KEY_SPEED
		
		JP	    	END_KEY
OLDKEY:	
		JP			END_KEY
KEY_ONOFF:
		SZB			F_ONOFF
		JP			POWER_OFF
POWER_ON:
		SETB		F_ONOFF
		CLRB		F_OSC
		CLR			TIMER_HOUR
		LD			A,SPEED_BUF
		LD			SPEED,A
		JP			END_KEY
POWER_OFF:
		CLRB		F_ONOFF
		CLRB		F_OSC
		CLR			TIMER_HOUR
		JP			END_KEY
KEY_TIMER:
		SNZB		F_ONOFF
		JP			END_KEY
		LD			A,TIMER_HOUR
		HSUBIA		D'7'
		SNZB		STATUS,C
		JP			KEY_TIMER1
		CLR			TIMER_HOUR
		JP			END_KEY
KEY_TIMER1:
		SZINCR		TIMER_HOUR
		NOP
		JP			END_KEY
KEY_OSC:
		SNZB		F_ONOFF
		JP			END_KEY
		SZB			F_OSC
		JP			OSC_OFF
OSC_ON:
		SETB		F_OSC
		JP			END_KEY
OSC_OFF:
		CLRB		F_OSC
		JP			END_KEY
KEY_SPEED:
		SNZB		F_ONOFF
		JP			END_KEY
		SZINCR		SPEED
		NOP
		LD			A,SPEED
		HSUBIA		D'3'
		SNZB		STATUS,C
		JP			KEY_SPEED1
		CLR			SPEED
KEY_SPEED1:
		LD			A,SPEED
		LD			SPEED_BUF,A
		JP	        END_KEY
ENDKEY0:
        CLR     	KEY_DELAY2
		CLR			KEY_VALUE
        JP      	END_KEY
END_KEY:
		CLR	   		T_SEC
		CLR	   		T_MIN
		RET
;*****************************************************;
;******************************************************
DISPLAY:
		SETB		LED_COM1
		SETB		LED_COM2
		CLRB		LED_SEG1
		CLRB		LED_SEG2
		CLRB		LED_SEG3
		CLRB		LED_SEG4
		SZINCR		LEDN
		NOP
		LD			A,LEDN
		HSUBIA		D'4'
		SNZB		STATUS,C
		JP			LED0
		CLR			LEDN
		JP			END_DISPLAY
LED0:
		SNZB		F_ONOFF
		JP			END_DISPLAY
		LD   		A,LEDN
		ADDR		PCL
		JP			END_DISPLAY
		JP			LEDPOWER
		JP			LED1					;DIS_SPEED
		JP			LED2					;DIS_TIMER
		JP			END_DISPLAY
;*****************************************************;
LEDPOWER:
		SETB		LED_SEG2				;POWERLED
		CLRB		LED_COM2
END_LEDPOWER:
		JP			END_DISPLAY
;*****************************************************;
LED1:
		LD			A,SPEED
		XORIA		00H
		SZB			STATUS,Z
		JP			SPEED_HIG
		
		LD			A,SPEED
		XORIA		01H
		SZB			STATUS,Z
		JP			SPEED_MED
		
		LD			A,SPEED
		XORIA		02H
		SZB			STATUS,Z
		JP			SPEED_LOW
		JP			END_LED1
SPEED_HIG:
		SETB	    LED_SEG3
		JP			END_LED1
SPEED_MED:
		SETB		LED_SEG4
		JP			END_LED1
SPEED_LOW:
		SETB		LED_SEG1		
END_LED1:
		CLRB		LED_COM2
		JP			END_DISPLAY
;*****************************************************;
LED2:	
		LD			A,TIMER_HOUR
		XORIA		00H
		SZB			STATUS,Z
		JP			END_LED2
		SETB		LED_SEG1
		SZB			TIMER_HOUR,0
		SETB		LED_SEG2
		SZB			TIMER_HOUR,1
		SETB		LED_SEG3
		SZB			TIMER_HOUR,2
		SETB		LED_SEG4
		CLRB		LED_COM1
END_LED2:
;*****************************************************;
END_DISPLAY:
		RET
;*****************************************************;		
WORKSUB:
		CLRB		F_SEND
		SZB			F_ONOFF
		JP			WORK_JUD
WORK_STOP:
		CLRB		F_OUT_HIG
		CLRB		F_OUT_MID
	    CLRB		F_OUT_LOW
		CLRB		F_OUT_OSC
		JP			END_WORK_SUB
WORK_JUD:
		LD			A,SPEED
		XORIA		00H
		SZB			STATUS,Z
		JP			MODE_HIGH
		LD			A,SPEED
		XORIA		01H
		SZB			STATUS,Z
		JP			MODE_MEDIUM
		LD			A,SPEED
		XORIA		02H
		SZB			STATUS,Z
		JP			MODE_LOW
		JP			END_WORK_SUB
MODE_HIGH:
		SETB		F_OUT_HIG
		CLRB		F_OUT_MID
		CLRB		F_OUT_LOW
		JP	    	END_FAN_WORK
MODE_MEDIUM:
		CLRB		F_OUT_HIG
		SETB		F_OUT_MID
		CLRB		F_OUT_LOW
		JP	    	END_FAN_WORK
MODE_LOW:
		CLRB		F_OUT_HIG
		CLRB		F_OUT_MID
		SETB		F_OUT_LOW
END_FAN_WORK:
		SNZB		F_OSC
		CLRB		F_OUT_OSC
		SZB 		F_OSC
		SETB		F_OUT_OSC
END_WORK_SUB:
		CLR	    	BIT_CONT
		CLR	    	BIT_TIME
		LD	    	A,FLAG0
		LD	    	DATA,A
		CLRB		F_BIT_FIRST
		SETB		F_SEND
END_WORK_SUB1:
		RET
;*****************************************************;			
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
		LD	    	A,REMOTE_DATA2
		XORIA		90H
		SZB     	STATUS,Z
		JP	    	YKKEY_OSC
YKKEY_POWER:
		CALL	   	KEY_ONOFF
		JP	       	END_YKKEY
YKKEY_SPEED:	
		CALL	   	KEY_SPEED
		JP	       	END_YKKEY
YKKEY_TIMER:	
		CALL	   	KEY_TIMER
		JP	       	END_YKKEY
YKKEY_OSC:
		CALL		KEY_OSC
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
;*****************************************************;
		JP	RESET
		END
