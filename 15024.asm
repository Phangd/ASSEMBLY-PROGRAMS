		#INCLUDE		CMS6053D.H    
;*****************************************************;				
		FLAG0		    EQU 	?
		FLAG1		    EQU 	?
		FLAG2		    EQU 	?
		SPEED		    EQU 	?
		T2MS_TIMER	    EQU 	?
		T250MS_TIMER	    EQU 	?
		T_SEC0		    EQU 	?
		TIME_SEC	    EQU 	?
		TIME_MIN	    EQU 	?
		TIME_HOUR	    EQU 	?
		KEY_VALUE	    EQU 	?
		KEY_VALUE0	    EQU 	?
		KEY_DELAY	    EQU 	?
		KEY_DELAY1	    EQU 	?
		BIT_CONT	    EQU 	?
		BIT_TIME	    EQU 	?
		DATE		    EQU 	?
		T_SEC1		    EQU 	?
		DISP_NUM	    EQU 	?
		LED_BUF1	    EQU 	?
		LED_BUF2	    EQU 	?
		TN		        EQU 	?
		LEDN			EQU		?
		REMOTE_NUM	    EQU 	?
		T_REMOTE1	    EQU 	?
		T_REMOTE2	    EQU 	?
		T_REMOTE3	    EQU 	?
		CODE1		    EQU 	?
		CODE2		    EQU 	?
		REMOTE_DATA1	EQU 	?
		REMOTE_DATA2	EQU 	?
		REMOTE_BUF	    EQU 	?
		T_OUTPUT	    EQU 	?
		T_FLASH		    EQU 	?
		SPEED_BUF	    EQU 	?
		KEY_DELAY2		EQU 	?
;*****************************************************;
;				Bit Flag Definition					  ;	
;*****************************************************;
		F_ONOFF		    EQU	FLAG0,7
		F_OUT_OSC	    EQU	FLAG0,6
		F_OUT_ION   	EQU	FLAG0,5
		F_OUT_HIG   	EQU	FLAG0,4
		F_OUT_MID   	EQU	FLAG0,3
		F_OUT_LOW   	EQU	FLAG0,2
		F_OUT_SLOW   	EQU	FLAG0,1
		F_OUTPUT   		EQU	FLAG0,0

		F_ONKEY			EQU	FLAG1,0
		F_REMOTE		EQU	FLAG1,1
		F_ON_REMOTE		EQU	FLAG1,2
		F_SPEED_CH		EQU	FLAG1,3
		F_RISE_YK		EQU	FLAG1,4
		F_SEND	    	EQU	FLAG1,5
		F_BIT_END		EQU	FLAG1,6
		F_SLEEP			EQU	FLAG1,7

		F_BIT0			EQU	FLAG2,0
		F_BIT1			EQU	FLAG2,1
		F_BIT_FIRST		EQU	FLAG2,2
		F_TIMER_SET		EQU	FLAG2,3
		F_LONG_KEY		EQU	FLAG2,4
		F_TIME_KEY		EQU	FLAG2,5
		F_ION			EQU	FLAG2,6
		F_OSC			EQU	FLAG2,7
	
		F_T2MS			EQU	T2MS_TIMER,4
;*****************************************************;
		REMOTE   	EQU	P1,1

		LED_SEG1  	EQU	P1,0
		LED_SEG2    EQU	P2,0
		LED_SEG3 	EQU	P2,1

		LED_COM1	EQU	P5,4
		LED_COM2	EQU	P1,2

		OUT_HIG		EQU	P2,3
		OUT_MID		EQU	P2,5
		OUT_LOW		EQU	P2,4

		SW_TIMER	EQU	P0,0
;*****************************************************;										   
;				Code section
;*****************************************************;
;***************PROGRAM ENTRY*************************; 
		                         
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
		JP			INT_SUB					
;*****************************************************;
;*****************************************************;
INT_SUB:							; 125us
		PUSH
		SNZB		INTEN,TC0IEN
		JP			INT_EXIT
		SNZB		INTRQ,TC0IRQ
		JP			INT_EXIT
		CLRB		INTRQ,TC0IRQ	
;*********************REMOTE**************************;
REMOTE_RECEIVE:	
		LD      	A,TN
		HSUBIA  	D'200'
		SNZB		STATUS,C
		SZINCR 		TN
		NOP
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
;*****************************************************;
TIMER0:                                 			;定时2MS
		SZINCR	  	T2MS_TIMER
		NOP
END_TIMER0:
;*****************************************************;
INT_EXIT:   	
		POP
		RETI
;*****************************************************;
RESET:
		CLRWDT
		CLRB		STKP,GIE
		CLR	        STATUS

        LDIA		B'00000000' 
       	LD	        P0,A
		LDIA		B'00000100'
       	LD	        P1,A
		LDIA		B'00111000'
       	LD	        P2,A
		LDIA		B'00010000'
       	LD	        P5,A
 
		LDIA		B'00000000' 
		LD	        P0M,A
		LDIA		B'00000101'
		LD	        P1M,A
		LDIA		B'00111011' 
		LD	        P2M,A
		LDIA		B'00010000' 
		LD	        P5M,A

        
		LDIA		B'00000000'
       	LD	        P0,A
		LDIA		B'00000100'
       	LD	        P1,A
		LDIA		B'00111000'
       	LD	        P2,A
		LDIA		B'00010000'
       	LD	        P5,A
		
		LDIA		00H
        LD	        P1UR,A
        LD 	        P2UR,A
        LD	        P5UR,A
CLR_RAM:					    	    ;INITIAL RAM
		CLR	        FSRH				;Select bank 0 
		LDIA		2FH		
		LD	        FSRL,A		    	
CLRRAM10:
		SZDECR	    FSRL         		
		NOP
		CLR			INDF
		LD			A,FSRL
		HSUBIA		D'1'
		SZB			STATUS,C
		JP	        CLRRAM10
		CLR	        INDF				;Clear address 0x00
		
		LDIA		B'01100100'
		LD      	TC0M,A
		LDIA		D'131'				; 125us
		LD	        TC0C,A
		LD	        TC0R,A
		CLRB	    INTRQ,TC0IRQ
		SETB	    INTEN,TC0IEN
		SETB	    TC0M,TC0ENB
		SETB	    STKP,GIE
;*****************************************************;
;*****************************************************;
MAIN_LOOP:
		SNZB	    F_T2MS				;2MS
		JP	        MAIN_LOOP
		CLRB	    F_T2MS
		CLRWDT
		CALL	    SCANKEY
		CALL		SCANREMOTE
		CALL	    DISPLAY		
		CALL		WORK_MODE
		JP	        MAIN_LOOP
;*****************************************************;
WORK_MODE:
		SNZB		F_ONOFF
		JP			END_WORKING
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
		JP			END_WORKING
MODE_HIGH:
		CLRB		OUT_HIG
		SETB		OUT_MID
		SETB		OUT_LOW
		JP			END_WORK_MODE
MODE_MEDIUM:
		SETB		OUT_HIG
		CLRB		OUT_MID
		SETB		OUT_LOW
		JP			END_WORK_MODE
MODE_LOW:
		SETB		OUT_HIG
		SETB		OUT_MID
		CLRB		OUT_LOW
		JP			END_WORK_MODE
END_WORKING:
		SETB		OUT_HIG
		SETB		OUT_MID
		SETB		OUT_LOW	
		JP			END_WORK_MODE
END_WORK_MODE:
		RET
;*****************************************************;
;*********************DISPLAY*************************;
DISPLAY:
		SETB	    LED_COM1
		SETB	    LED_COM2
		CLRB	    LED_SEG1
		CLRB	    LED_SEG2
		CLRB	    LED_SEG3
		SZINCR		LEDN
		NOP
		LD			A,LEDN
		HSUBIA		D'5'
		SNZB		STATUS,C
		JP			LED0
		CLR			LEDN
		JP			END_DISPLAY
;*****************************************************;
LED0:		
        SNZB		F_ONOFF
		JP			END_DISPLAY
		LD   		A,LEDN
		ADDR		PCL
		JP			END_DISPLAY
		JP			LED1
		JP			LED2
		JP			LED3
		JP			LED4
		JP			END_DISPLAY
;*****************************************************;
LED1:
		LD			A,SPEED
		XORIA		00H
		SZB			STATUS,Z
		JP			SPEED_HIGH
		LD			A,SPEED
		XORIA		01H
		SZB			STATUS,Z
		JP			SPEED_MEDIUM
		LD			A,SPEED
		XORIA		02H
		SZB			STATUS,Z
		JP			SPEED_LOW
		JP			END_LED1
SPEED_HIGH:
		SETB	    LED_SEG3
		JP			END_LED1
SPEED_MEDIUM:
		SETB		LED_SEG2
		JP			END_LED1
SPEED_LOW:
		SETB		LED_SEG1
END_LED1:
		CLRB	    LED_COM1
		JP			END_DISPLAY
;*****************************************************;
LED2:
		SNZB		TIME_HOUR,0
		JP			END_LED2
		SETB		LED_SEG3
		CLRB		LED_COM2
END_LED2:
		JP			END_DISPLAY
LED3:
		SNZB		TIME_HOUR,1
		JP			END_LED3
		SETB		LED_SEG2
		CLRB		LED_COM2
END_LED3:
		JP			END_DISPLAY
LED4:
		SNZB		TIME_HOUR,2
		JP			END_LED4
		SETB		LED_SEG1
		CLRB		LED_COM2
END_LED4:
		JP			END_DISPLAY
;*****************************************************;
END_DISPLAY:
		RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;       		SCAN KEY PROGRAM              ;
;                                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCANKEY:				 												  
		LDIA		B'00111000'
		LD			P2M,A
		LDIA		B'00000011'
		LD			P2UR,A
		SETB		P0UR,P00R
		SETB		P1UR,P11R
		SETB		LED_SEG2
		SETB		LED_SEG3
		SETB		LED_COM1
		SETB		LED_COM2
		SETB		SW_TIMER
		CLR	        KEY_VALUE
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
		SNZB	 	LED_SEG3
		SETB	  	KEY_VALUE,0
		SNZB		LED_SEG2
		SETB	  	KEY_VALUE,2
		SNZB		SW_TIMER
		SETB	  	KEY_VALUE,1
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
		LDIA		B'00111011'
		LD			P2M,A
		LDIA		B'00000000'
		LD			P2UR,A
		CLRB		LED_SEG2
		CLRB		LED_SEG3
		NOP
		NOP
		NOP
		NOP
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
		JP      	END_SCANKEY
NO_KEY1:	
		CLRB  		F_ONKEY
		CLR     	KEY_DELAY1
		CLR     	KEY_VALUE0
		JP    		END_SCANKEY
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
		JP	    	KEY_SPEED
		
		JP	    	END_SCANKEY
OLDKEY:	
		JP			END_SCANKEY
KEY_ONOFF:						
		SZB	        F_ONOFF
		JP	        KEY_OFF
KEY_ON:
		SETB	    F_ONOFF
		CLR			TIME_HOUR
		LD			A,SPEED_BUF
		LD			SPEED,A
		JP	        END_SCANKEY
KEY_OFF:
		CLRB	    F_ONOFF
		CLR			TIME_HOUR
		JP	        END_SCANKEY
KEY_SPEED:
		SNZB		F_ONOFF
		JP			END_SCANKEY
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
		JP	        END_SCANKEY
KEY_TIMER:
		SNZB		F_ONOFF
		JP			END_SCANKEY
		LD			A,TIME_HOUR
		HSUBIA		D'7'
		SNZB		STATUS,C
		JP			KEY_TIMER_1
		CLR			TIME_HOUR
		JP			END_KEY_TIMER
KEY_TIMER_1:
		SZINCR		TIME_HOUR
		NOP
END_KEY_TIMER:
		CLR			TIME_SEC
		CLR			TIME_MIN
		JP			END_SCANKEY
ENDKEY0:
        CLR     	KEY_DELAY2
		CLR			KEY_VALUE
        JP      	END_SCANKEY
END_SCANKEY:		
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
YKKEY_POWER:
		CALL	   KEY_ONOFF
		JP	       END_YKKEY
YKKEY_SPEED:
		CALL	   KEY_SPEED
		JP	       END_YKKEY
YKKEY_TIMER:
		CALL	   KEY_TIMER
		JP	       END_YKKEY
END_YKKEY:
		JP	       END_SCANREMOTE2
OFF_YKKEY:
		CLRB	   F_ON_REMOTE
END_SCANREMOTE2:
		CLR	       T_REMOTE1
END_SCANREMOTE1:
		CLR	       T_REMOTE2
		JP	       END_SCANREMOTE
END_SCANREMOTE3:
		CLR	       REMOTE_BUF
		CLR	       T_REMOTE1
		CLR	       T_REMOTE2
		JP	       END_SCANREMOTE
END_SCANREMOTE0:
		LD	       A,T_REMOTE3
		NOP
		HSUBIA     D'25';13
		SNZB	   STATUS,C
		JP	       END_SCANREMOTE
		CLR        REMOTE_BUF
		CLRB	   F_ON_REMOTE
END_SCANREMOTE:
		RET	
;*****************************************************;
;*****************************************************;
		JP		RESET
		END
