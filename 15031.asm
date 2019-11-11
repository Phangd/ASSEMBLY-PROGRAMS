		#INCLUDE	CMS6053D.H
;*****************************************************;
		FLAG0		EQU	?
		T2MS_TIMER	EQU 	?
		TN		EQU	?
		CODE1		EQU	?
		CODE2		EQU	?
		REMOTE_NUM	EQU	?
		REMOTE_DATA1	EQU	?
		REMOTE_DATA2	EQU	?
		KEY_VALUE	EQU	?
		SPEED		EQU	?
		TIMER_HOUR	EQU	?
		LEDN		EQU	?
		KEY_VALUE0	EQU	?
		KEY_DELAY1	EQU	?
		KEY_DELAY2	EQU	?
		REMOTE_BUF	EQU	?
		T_REMOTE1   	EQU	?
		T_REMOTE2   	EQU	?
		T_REMOTE3	EQU	?
;*****************************************************;
		F_ONOFF		EQU	FLAG0,0
		F_RISE_YK	EQU	FLAG0,1
		F_REMOTE	EQU	FLAG0,2
		F_ONKEY		EQU	FLAG0,3
		F_ON_REMOTE	EQU	FLAG0,4
		
		F_T2MS		EQU	T2MS_TIMER,4
;*****************************************************;
		REMOTE		EQU	P1,1
		
		LEDCOM1		EQU	P0,0
		LEDCOM2		EQU	P2,5
		
		LEDSEG1		EQU	P2,0
		LEDSEG2		EQU	P2,3
		LEDSEG3		EQU	P2,4
		
		SWSPEED		EQU	P5,4
		SWONOFF		EQU	P1,0
		SWTIMER		EQU	P1,3
		
		OUTLOW		EQU	P1,2
		OUTMED		EQU	P2,2
		OUTHIG		EQU	P2,1
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
		JP			INIT_TIMER
;*****************************************************;		
INIT_TIMER:
		PUSH
		SNZB			INTEN,TC0IEN
		JP			INIT_EXIT
		SNZB			INTRQ,TC0IRQ
		JP			INIT_EXIT
		CLRB			INTRQ,TC0IRQ
;*****************************************************;
TIMER0:
		SZINCR			T2MS_TIMER
		NOP
;*****************************************************;
REMOTE_RECEIVE:
		LD			A,TN
		HSUBIA			D'200'
		SNZB			STATUS,C
		SZINCR			TN
		NOP
		SNZB			REMOTE
		JP			YK_NPULSE
YK_PPULSE:		
		SZB			F_RISE_YK
		JP			END_REMOTE
		SETB			F_RISE_YK
		RLCR			CODE2
		RLCR			CODE1
		LD			A,TN
		HSUBIA			D'16'
		SZB			STATUS,C
		JP			ERROR_REMOTE
		LD			A,TN
		HSUBIA			D'2'
		SNZB			STATUS,C
		JP	    		ERROR_REMOTE
		CLRB			CODE2,0
		LD	    		A,TN
		HSUBIA			D'7'
		SZB 			STATUS,C
YK_BIT1:
		SETB			CODE2,0
YK_BITJUD:
		CLR			TN
		SZINCR			REMOTE_NUM
		NOP
		LD			A,REMOTE_NUM
		HSUBIA			D'12'
		SNZB			STATUS,C
		JP			END_REMOTE
		LD			A,CODE1
		LD			REMOTE_DATA1,A
		LD			A,CODE2
		LD			REMOTE_DATA2,A
		SETB			F_REMOTE
		JP			END_REMOTE
YK_NPULSE:	
  	    	SNZB			F_RISE_YK
		JP	    		END_REMOTE
		CLRB			F_RISE_YK			; 
		LD	    		A,TN
		HSUBIA			D'16'				; >2ms?
		SZB	    		STATUS,C
		JP	    		ERROR_REMOTE
		LD	    		A,TN				; >.2ms?
		HSUBIA			D'2'
		SNZB			STATUS,C
		JP	    		ERROR_REMOTE
		CLR	    		TN
		JP	    		END_REMOTE
ERROR_REMOTE:		
        	CLR	   		TN
		CLR	   		CODE1
		CLR	   		CODE2
		CLR	   		REMOTE_NUM
END_REMOTE:
;*****************************************************;	
INIT_EXIT:
		RETI
;*****************************************************;		
RESET:		
		CLRWDT
		CLRB			STKP,GIE
		CLR	        	STATUS
		
		LDIA			B'00000001' 
       		LD	       	 	P0,A
		LDIA			B'00000100'
       		LD	        	P1,A
		LDIA			B'00100110'
       		LD	        	P2,A
		LDIA			B'00000000'
       		LD	        	P5,A
		
		LDIA			B'00000001' 
		LD	        	P0M,A
		LDIA			B'00000100'
		LD	        	P1M,A
		LDIA			B'00111111' 
		LD	        	P2M,A
		LDIA			B'00000000' 
		LD	        	P5M,A
		
		LDIA			B'00000000'
		LD			P0UR,A
		LDIA			B'00001001'
		LD			P1UR,A
		LDIA			B'00000000'
		LD			P2UR,A
		LDIA			B'00010000'
		LD			P5UR,A
		
		LDIA			B'00000001' 
       		LD	       		P0,A
		LDIA			B'00000100'
       		LD	        	P1,A
		LDIA			B'00100110'
       		LD	        	P2,A
		LDIA			B'00000000'
       		LD	        	P5,A
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
;*****************************************************;
		CLR			FSRH
		LDIA			2FH
		LD			FSRL,A
CLRRAM:
		CLR			INDF
		SZDECR			FSRL
		JP			CLRRAM
		CLR			INDF
INIT_TC0:		
		LDIA			B'01100100'
		LD			TC0M,A
		LDIA			D'131'
		LD			TC0R,A
		LD			TC0C,A
		CLRB			INTRQ,TC0IRQ
		SETB			INTEN,TC0IEN
		SETB			STKP,GIE
		SETB			TC0M,TC0ENB
;*****************************************************;
MAINLOOP:
		SNZB			F_T2MS
		JP			MAINLOOP
		CLRB			F_T2MS
		CLRWDT
		CALL			SCANKEY
		CALL			SCANREMOTE
		CALL			DISPLAY
		CALL			WORKSUB
		;CALL			TIMESUB
		JP			MAINLOOP
;*****************************************************;		
SCANKEY:
		CLR			KEY_VALUE
		
		LDIA			B'00000100'
		LD	        	P1M,A
		LDIA			B'00000000' 
		LD	        	P5M,A

		LDIA			B'00001001'
		LD			P1UR,A
		LDIA			B'00010000'
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
		SNZB			SWSPEED
		SETB			KEY_VALUE,0
		SNZB			SWONOFF
		SETB			KEY_VALUE,1
		SNZB			SWTIMER
		SETB			KEY_VALUE,2
		NOP
		NOP
		NOP
		NOP
		NOP
END_KEY_JUDG:		
		LD			A,KEY_VALUE
		HSUBIA  		D'1'
		SZB  			STATUS,C
		JP      		ON_KEY
NO_KEY:	
		LD   			A,KEY_DELAY2
		HSUBIA  		D'10'
		SZB  			STATUS,C
		JP      		NO_KEY1
		SZINCR  		KEY_DELAY2
		NOP	
		JP      		END_SCANKEY
NO_KEY1:	
		CLRB  			F_ONKEY
		CLR     		KEY_DELAY1
		CLR     		KEY_VALUE0
		JP    			END_SCANKEY
ON_KEY:	
		LD			A,KEY_VALUE
		XORA			KEY_VALUE0
		SZB			STATUS,Z
		JP    			ON_KEY1
		CLR     		KEY_DELAY1
		LD			A,KEY_VALUE
		LD			KEY_VALUE0,A
		JP    			END_SCANKEY
ON_KEY1:	
		LD   			A,KEY_DELAY1
		HSUBIA  		D'5'
		SZB  			STATUS,C
		JP      		KEY_JUD
		SZINCR  		KEY_DELAY1
		NOP	
		JP      		END_SCANKEY
KEY_JUD:	
		SZB  			F_ONKEY
		JP      		OLDKEY
		LD   			A,KEY_DELAY2
		HSUBIA  		D'3'
		SNZB  			STATUS,C
		JP      		ENDKEY0
		CLR     		KEY_DELAY2
		SETB  			F_ONKEY
		
		LD	    		A,KEY_VALUE
		XORIA			01H
		SZB     		STATUS,Z
		JP	    		KEY_SPEED
		
		LD	    		A,KEY_VALUE
		XORIA			02H
		SZB	    		STATUS,Z
		JP	    		KEY_ONOFF
		
		LD	    		A,KEY_VALUE
		XORIA			04H
		SZB	    		STATUS,Z
		JP	    		KEY_TIMER

		JP	    		END_SCANKEY
OLDKEY:	
		JP			END_SCANKEY
KEY_SPEED:
		SNZB			F_ONOFF
		JP			END_SCANKEY
		SZINCR			SPEED
		NOP
		LD			A,SPEED
		HSUBIA			D'3'
		SZB			STATUS,C
		CLR			SPEED
		JP			END_SCANKEY
KEY_ONOFF:
		SZB			F_ONOFF
		JP			KEY_OFF
KEY_ON:
		SETB			F_ONOFF
		CLR			SPEED
		CLR			TIMER_HOUR
		JP			END_SCANKEY
KEY_OFF:
		CLRB			F_ONOFF
		CLR			SPEED
		CLR			TIMER_HOUR
		JP			END_SCANKEY
KEY_TIMER:
		SNZB			F_ONOFF
		JP			END_SCANKEY
		SZINCR			TIMER_HOUR
		NOP
		LD			A,TIMER_HOUR
		HSUBIA			D'4'
		SZB			STATUS,C
		CLR			TIMER_HOUR
		JP			END_SCANKEY
ENDKEY0:
		CLR     		KEY_DELAY2
		CLR			KEY_VALUE
        	JP      		END_SCANKEY
END_SCANKEY:
		RET
;*****************************************************;		
DISPLAY:
		SETB			LEDCOM1
		SETB			LEDCOM2
		CLRB			LEDSEG1
		CLRB			LEDSEG2
		CLRB			LEDSEG3
		SZINCR			LEDN
		NOP
		LD			A,LEDN
		HSUBIA			D'3'
		SNZB			STATUS,C
		JP			LED0
		CLR			LEDN
LED0:
		SNZB			F_ONOFF
		JP			END_DISPLAY
		LD			A,LEDN
		ADDR			PCL
		JP			END_DISPLAY
		JP			DIS_SPEED
		JP			DIS_TIMER
		JP			END_DISPLAY
DIS_SPEED:
		LD			A,SPEED
		XORIA			00H
		SZB			STATUS,Z
		JP			SPEEDHIG
		
		LD			A,SPEED
		XORIA			01H
		SZB			STATUS,Z
		JP			SPEEDMED
		
		LD			A,SPEED
		XORIA			02H
		SZB			STATUS,Z
		JP			SPEEDLOW
SPEEDHIG:
		SETB			LEDSEG3
		JP			END_DIS_SPEED
SPEEDMED:
		SETB			LEDSEG2
		JP			END_DIS_SPEED
SPEEDLOW:
		SETB			LEDSEG1
		JP			END_DIS_SPEED
END_DIS_SPEED:
		CLRB			LEDCOM1
		JP			END_DISPLAY
DIS_TIMER:
		LD			A,TIMER_HOUR
		XORIA			00H
		SZB			STATUS,Z
		JP			TIMEROFF
		
		LD			A,TIMER_HOUR
		XORIA			01H
		SZB			STATUS,Z
		JP			TIMER1H
		
		LD			A,TIMER_HOUR
		XORIA			02H
		SZB			STATUS,Z
		JP			TIMER2H
		
		LD			A,TIMER_HOUR
		XORIA			03H
		SZB			STATUS,Z
		JP			TIMER4H
TIMEROFF:
		CLRB			LEDSEG1
		CLRB			LEDSEG2
		CLRB			LEDSEG3
		SETB			LEDCOM2
		JP			END_DISPLAY
TIMER1H:
		SETB			LEDSEG3
		CLRB			LEDCOM2
		JP			END_DISPLAY
TIMER2H:
		SETB			LEDSEG2
		CLRB			LEDCOM2
		JP			END_DISPLAY
TIMER4H:
		SETB			LEDSEG1
		CLRB			LEDCOM2
		JP			END_DISPLAY
END_DISPLAY:
		RET
;*****************************************************;		
WORKSUB:
		SNZB			F_ONOFF
		JP			SHUTDOWN
		
		LD			A,SPEED
		XORIA			00H
		SZB			STATUS,Z
		JP			WORKHIG
		
		LD			A,SPEED
		XORIA			01H
		SZB			STATUS,Z
		JP			WORKMED
		
		LD			A,SPEED
		XORIA			02H
		SZB			STATUS,Z
		JP			WORKLOW
		JP			END_WORKSUB
SHUTDOWN:
		SETB			OUTHIG
		SETB			OUTMED
		SETB			OUTLOW
		JP			END_WORKSUB
WORKHIG:
		CLRB			OUTHIG
		SETB			OUTMED
		SETB			OUTLOW
		JP			END_WORKSUB
WORKMED:
		SETB			OUTHIG
		CLRB			OUTMED
		SETB			OUTLOW
		JP			END_WORKSUB
WORKLOW:
		SETB			OUTHIG
		SETB			OUTMED
		CLRB			OUTLOW
END_WORKSUB:
		RET
;*****************************************************;		
SCANREMOTE:
		LD	        	A,T_REMOTE1
		HSUBIA			D'250'
		SNZB	   	 	STATUS,C
		SZINCR	    		T_REMOTE1
		LD	        	A,T_REMOTE2
		HSUBIA			D'250'
		SNZB	    		STATUS,C
		SZINCR	   		T_REMOTE2
		LD	       		A,T_REMOTE3
		HSUBIA			D'250'
		SNZB	    		STATUS,C
		SZINCR	    		T_REMOTE3
SCANREMOTE0:
		SNZB	    		F_REMOTE
		JP	        	END_SCANREMOTE0
		CLRB	    		F_REMOTE
		CLR	        	T_REMOTE3
		LD	        	A,REMOTE_DATA1
		XORIA			0DH
		SNZB	    		STATUS,Z
		JP	       	 	END_SCANREMOTE3
		LD	       	 	A,REMOTE_DATA2	; 按键松开
		XORIA			80H
		SZB     		STATUS,Z
		JP	        	OFF_YKKEY
		LD	        	A,REMOTE_DATA2	; 连续接收两串相同码？
		XORA			REMOTE_BUF
		SZB	        	STATUS,Z
		JP	        	YKKEY_JUD
YKKEY_FIRST:
		LD	        	A,REMOTE_DATA2
		LD	        	REMOTE_BUF,A
		JP	       	 	END_SCANREMOTE1
YKKEY_JUD:
		SZB	        	F_ON_REMOTE			; 按键长按
		JP	        	OLDYK
		LD	        	A,T_REMOTE2	; <20ms?   ; 两串码的接收间隔为27ms？
		HSUBIA			D'10';3
		SNZB	    		STATUS,C
		JP	        	END_SCANREMOTE3
		LD	        	A,T_REMOTE2	; >40ms?
		HSUBIA			D'20';5
		SZB	        	STATUS,C
		JP	        	END_SCANREMOTE3
		JP	        	NEWYK
OLDYK:							; >80ms?
		JP	        	END_SCANREMOTE2			;无遥控长按功能
		LD	        	A,T_REMOTE1
		HSUBIA			D'220';60
		SNZB	    		STATUS,C
		JP	        	END_SCANREMOTE1;END_SCANREMOTE
		CLR	        	T_REMOTE1
		LD	        	A,REMOTE_DATA2
		XORIA			88H
		SZB	        	STATUS,Z
		JP	       	 	YKKEY_TIMER;YKKEY_TIMER_UP
		JP	        	END_SCANREMOTE2
NEWYK:							; 键码判断
		SETB	    		F_ON_REMOTE
		LD	        	A,REMOTE_DATA2
		XORIA			81H
		SZB     		STATUS,Z
		JP	        	YKKEY_POWER
		LD	        	A,REMOTE_DATA2
		XORIA			82H
		SZB	        	STATUS,Z
		JP	        	YKKEY_SPEED
		LD	        	A,REMOTE_DATA2
		XORIA			88H
		SZB	       	 	STATUS,Z
		JP	        	YKKEY_TIMER
YKKEY_POWER:
		CALL	   		KEY_ONOFF
		JP	       		END_YKKEY
YKKEY_SPEED:
		CALL	   		KEY_SPEED
		JP	       		END_YKKEY
YKKEY_TIMER:
		CALL	   		KEY_TIMER
		JP	       		END_YKKEY
END_YKKEY:
		JP	       		END_SCANREMOTE2
OFF_YKKEY:
		CLRB	   		F_ON_REMOTE
END_SCANREMOTE2:
		CLR	       		T_REMOTE1
END_SCANREMOTE1:
		CLR	       		T_REMOTE2
		JP	       		END_SCANREMOTE
END_SCANREMOTE3:
		CLR	       		REMOTE_BUF
		CLR	       		T_REMOTE1
		CLR	       		T_REMOTE2
		JP	       		END_SCANREMOTE
END_SCANREMOTE0:
		LD	       		A,T_REMOTE3
		NOP
		HSUBIA    		D'25';13
		SNZB	   		STATUS,C
		JP	       		END_SCANREMOTE
		CLR       		REMOTE_BUF
		CLRB	   		F_ON_REMOTE
END_SCANREMOTE:
		RET			
;*****************************************************;
		JP			RESET
		END
