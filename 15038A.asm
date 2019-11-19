	  	#INCLUDE		CMS6053D.H    
;******************************************************************;
		FLAG0			EQU		?
		FLAG1           EQU		?
		FLAG2			EQU		?
		KEY_DELAY1      EQU		?
		KEY_DELAY2      EQU		?
		KEY_VALUE       EQU		?
		KEY_VALUE0      EQU		?
		TIMER_2MS       EQU		?
		TN				EQU		?
		BIT_NUM         EQU		?
		CODE1           EQU		?
		CODE1_BUF       EQU		?
		CODE2           EQU		?
		CODE2_BUF       EQU		?
		SPEED			EQU		?
		SPEED_BUF		EQU		?
		HOURS           EQU		?
		HOURS_BUF		EQU		?
		COUNTER         EQU		?
		TIMER_250MS     EQU		?
		T_REMOTE1       EQU		?
		T_REMOTE2       EQU		?
		REMOTE_NUM		EQU		?
		PLUSE_TIME		EQU		?
		TIMER_MIN		EQU		?
		TIMER_SEC		EQU		?
		DATA			EQU		?
		DATA_BUF		EQU		?
		DELAY_TIMER		EQU		?
		RECORD_TIME		EQU		?
		BIT_TIME		EQU		?
		T_SEND			EQU		?
		BIT_CONT		EQU		?
;******************************************************************;
		F_T2MS			EQU		TIMER_2MS,4
		
		F_ONOFF			EQU		FLAG0,7
		F_OSC			EQU		FLAG0,6
		F_HIG			EQU		FLAG0,5
		F_MID			EQU		FLAG0,4
		F_LOW			EQU		FLAG0,3
		
		
		F_PULSE_DEAL	EQU		FLAG1,0
		F_PRESS			EQU		FLAG1,1
		F_ON_REMOTE		EQU		FLAG1,2
		F_RECEIVE_OK	EQU		FLAG1,3
		F_DISPLAY		EQU		FLAG1,4
		F_SEND			EQU		FLAG1,5
		F_BIT_HEAD      EQU		FLAG1,6
		F_BIT_END       EQU		FLAG1,7
		
		F_BIT1          EQU		FLAG2,0
		F_BIT0          EQU		FLAG2,1
;******************************************************************;
		OUT_DATA		EQU		P2,3
		REMOTE			EQU		P1,1
		
		SW_COM1			EQU		P1,2
		SW_COM2         EQU		P2,0
		SW_SEG1         EQU		P1,3
		SW_SEG2         EQU		P2,1
		LED_SEG1        EQU		P0,0
		LED_SEG2        EQU		P2,2
		LED_COM1        EQU		P2,5
		LED_COM2        EQU		P2,4
		LED_COM3        EQU		P5,4
		LED_COM4        EQU		P1,0
;******************************************************************;
		ORG				0000H
		JP				RESET
		NOP
		NOP
		JP				RESET
		JP				RESET
		NOP
		NOP
		JP				RESET
		ORG				0008H
		JP				INT_SERIVE
;******************************************************************;
INT_SERIVE:
		PUSH
		SNZB			INTRQ,TC0IRQ
		JP				EXIT_INT
		CLRB			INTRQ,TC0IRQ
;------------------------------------------------------------------;
TIMER:
		SZINCR			TIMER_2MS
		NOP
;------------------------------------------------------------------;
REMOTE_RECEIVE:
		LD				A,TN
		HSUBIA			D'200'
		SNZB			STATUS,C
		SZINCR			TN
		NOP
		SNZB			REMOTE
		JP				PLUSE_DOWN
PLUSE_UP:
		SZB				F_PULSE_DEAL
		JP				END_REMOTE_RECEIVE
		SETB			F_PULSE_DEAL
		RLCR			CODE2
		RLCR			CODE1
		LD				A,TN
		HSUBIA			D'2'
		SNZB			STATUS,C
		JP				ERROR_PULSE
		LD				A,TN
		HSUBIA			D'16'
		SZB				STATUS,C
		JP				ERROR_PULSE
		LD				A,TN
		HSUBIA			D'9'
		SZB				STATUS,C
		JP				RECEIVE_BIT1
		CLRB			CODE2,0
		JP				BIT_DEAL
RECEIVE_BIT1:
		SETB			CODE2,0
BIT_DEAL:
		CLR				TN
		SZINCR			REMOTE_NUM
		NOP
		LD				A,REMOTE_NUM
		HSUBIA			D'12'
		SNZB			STATUS,C
		JP				END_REMOTE_RECEIVE
		LD				A,CODE1
		LD				CODE1_BUF,A
		LD				A,CODE2
		LD				CODE2_BUF,A
		SETB			F_RECEIVE_OK
PLUSE_DOWN:
		SNZB			F_PULSE_DEAL
		JP				END_REMOTE_RECEIVE
		CLRB			F_PULSE_DEAL
		LD				A,TN
		HSUBIA			D'2'
		SNZB			STATUS,C
		JP				ERROR_PULSE
		LD				A,TN
		HSUBIA			D'16'
		SZB				STATUS,C
		JP				ERROR_PULSE
		CLR				TN
		JP				END_REMOTE_RECEIVE
ERROR_PULSE:
		CLR				TN
		CLR				CODE1
		CLR				CODE2
		CLR				REMOTE_NUM
END_REMOTE_RECEIVE:
;------------------------------------------------------------------;		
SEND_DATA:									
		SNZB			F_SEND				;BIT_END中才清零
		JP				SEND0               
		SNZB			F_BIT_HEAD          ;BIT_END中才清零,发完头部会置一
		JP				BIT_HEAD            
		SZB				F_BIT_END           ;发完数据才置1,BIT_END中会清零
		JP				BIT_END             
		SZB				F_BIT1              ;发完数据包头部被置0
		JP				SEND_BIT1           
		SZB				F_BIT0              ;发完数据包头部被置0
		JP				SEND_BIT0
SEND_COUNT:
		SZINCR			BIT_NUM				;发送的位数
		NOP
		RLCR			DATA
		SNZB			STATUS,C
		JP				BIT_ZERO
		SETB			F_BIT1				;DATA的第七位为1,置发1标志位,把第0位置1(左移之后第零位补得是C中的0)
		SETB			DATA,0
		CLR				PLUSE_TIME
		JP				SEND_BIT1
BIT_ZERO:
		SETB			F_BIT0				;第七位为0,置发0标志位为1,把第0位置0
		CLRB			DATA,0
		CLR 			PLUSE_TIME
SEND_BIT0:
		SZINCR			PLUSE_TIME
		NOP
		LD				A,PLUSE_TIME
		HSUBIA			D'5'
		SNZB			STATUS,C
		JP				SEND1
		LD				A,PLUSE_TIME
		HSUBIA			D'9'
		SNZB			STATUS,C
		JP				SEND0
		CLRB			F_BIT0
		JP				SEND_DEAL
SEND_BIT1:
		SZINCR			PLUSE_TIME
		NOP
		LD				A,PLUSE_TIME
		HSUBIA			D'5'
		SNZB			STATUS,C
		JP				SEND1
		LD				A,PLUSE_TIME
		HSUBIA			D'17'
		SNZB			STATUS,C
		JP				SEND0
		CLRB			F_BIT1
SEND_DEAL:
		CLR				PLUSE_TIME
		LD				A,BIT_NUM
		HSUBIA			D'16'
		SNZB			STATUS,C
		JP				END_SEND_DATA
		CLR				BIT_NUM
		SETB			OUT_DATA
		SETB			F_BIT_END
		JP				END_SEND_DATA
BIT_HEAD:
		SZINCR			PLUSE_TIME
		NOP
		LD				A,PLUSE_TIME
		HSUBIA			D'32'
		SNZB			STATUS,C
		JP				SEND1
		LD				A,PLUSE_TIME
		HSUBIA			D'63'
		SNZB			STATUS,C
		JP				SEND0
		CLR				PLUSE_TIME
		SETB			F_BIT_HEAD
		CLRB			F_BIT0
		CLRB			F_BIT1
		JP				END_SEND_DATA
BIT_END:
		SZINCR			PLUSE_TIME
		NOP
		LD				A,PLUSE_TIME
		HSUBIA			D'5'
		SNZB			STATUS,C
		JP				SEND1
		CLR				PLUSE_TIME
		CLRB			F_BIT_END
		CLRB			F_BIT_HEAD
		CLRB			F_SEND
		JP				SEND0
SEND1:
		SETB			OUT_DATA
		JP				END_SEND_DATA
SEND0:
		CLRB			OUT_DATA
END_SEND_DATA:
;------------------------------------------------------------------;
EXIT_INT:
		POP
		RETI
;******************************************************************;
RESET:
		CLRWDT
		NOP
		CLR				STATUS
		CLRB			STKP,GIE
		OPTION
		LDIA			B'00000001'
		LD				P0M,A
		LDIA			B'00000001'
		LD				P1M,A
		LDIA			B'00111100'
		LD				P2M,A
		LDIA			B'00010000'
		LD				P5M,A
		
		LDIA			B'00000000'
		LD				P0UR,A
		LD				P5UR,A
		LDIA			B'00001100'
		LD				P1UR,A
		LDIA			B'00000011'
		LD				P2UR,A
		
		LDIA			B'00000001'
		LD				P0,A
		LDIA			B'00000000'
		LD				P1,A
		LD				P5,A
		LDIA			B'00001100'
		LD				P2,A
		
		
		NOP
		NOP
		NOP
		NOP
		NOP
;------------------------------------------------------------------;
		CLR				FSRH
		LDIA			30H
		LD				FSRL,A
CLR_RAM:
		SZDECR			FSRL
		NOP
		CLR				INDF
		LD				A,FSRL
		HSUBIA			01H
		SZB				STATUS,C
		JP				CLR_RAM
		CLR 			INDF
;------------------------------------------------------------------;
POWER_ON_DELAY:
		SZINCR			DELAY_TIMER
		NOP
		LD				A,DELAY_TIMER
		HSUBIA			D'250'
		SNZB			STATUS,C
		JP				POWER_ON_DELAY
		CLR				DELAY_TIMER
		CLRWDT
INIT_INT:
		CLRB			INTRQ,TC0IRQ
		LDIA			B'01110100'
		LD				TC0M,A
		LDIA			D'131'
		LD				TC0R,A
		LD				TC0C,A
		SETB			STKP,GIE
		SETB			INTEN,TC0IEN
		SETB			TC0M,TC0ENB
		LDIA			01H
		LD				SPEED_BUF,A
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
MAINLOOP:
		SNZB			F_T2MS
		JP				MAINLOOP
		CLRB			F_T2MS
		CLRWDT
		CALL			TIMER_SUB
		CALL			SCANKEY
		CALL			REMOTE_DEAL
		CALL			DISPLAY
		CALL			WORK_SUB
		JP				MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		SZINCR			TIMER_250MS
		NOP
		LD				A,TIMER_250MS
		HSUBIA			D'125'
		SNZB			STATUS,C
		JP				RECORD_SEND_DATA
		CLR				TIMER_250MS
		SZINCR			T_SEND
		NOP
		SZINCR			TIMER_SEC
		NOP
		HSUBIA			D'4'
		SNZB			STATUS,C
		JP				RECORD_SEND_DATA
		CLR				TIMER_SEC
		SZINCR			TIMER_MIN
		NOP
		HSUBIA			D'60'
		SNZB			STATUS,C
		JP				RECORD_SEND_DATA
		CLR				TIMER_MIN
		LD				A,HOURS_BUF
		HSUBIA			D'1'
		SNZB			STATUS,C
		JP				RECORD_SEND_DATA
		SZDECR			HOURS_BUF
		NOP
		LD				A,HOURS_BUF
		HSUBIA			D'1'
		SNZB			STATUS,C
		CLRB			F_ONOFF
RECORD_SEND_DATA:
		LD				A,T_SEND
		HSUBIA			D'6'
		SNZB			STATUS,C
		JP				END_TIMER_SUB
		CLR				T_SEND
		CLR				BIT_NUM
		CLR				BIT_TIME
		LD				A,DATA_BUF
		LD				DATA,A
		CLRB			F_BIT_HEAD
		SETB			F_SEND
END_TIMER_SUB:
		RET
;******************************************************************;		
SCANKEY:
		CLR				KEY_VALUE
		NOP
		NOP
		NOP
		NOP
		NOP
		LDIA			B'00000001'
		LD				P1M,A
		LDIA			B'00111101'
		LD				P2M,A
		CLRB			SW_COM2
		NOP
		NOP
		NOP
		NOP
		NOP
		SNZB			SW_SEG1
		SETB			KEY_VALUE,0			;SPEED
		SNZB			SW_SEG2
		SETB			KEY_VALUE,1			;POWER
		NOP
		NOP
		NOP
		NOP
		NOP
		LDIA			B'00000101'
		LD				P1M,A
		LDIA			B'00111100'
		LD				P2M,A
		CLRB			SW_COM1
		NOP
		NOP
		NOP
		NOP
		NOP
		SNZB			SW_SEG1
		SETB			KEY_VALUE,2			;OSC
		SNZB			SW_SEG2
		SETB			KEY_VALUE,3			;TIMER
;------------------------------------------------------------------;
END_KEY_JUD:
		LD				A,KEY_VALUE
		HSUBIA			D'1'
		SZB				STATUS,C
		JP				ON_KEY
NO_KEY:
		LD				A,KEY_DELAY2
		HSUBIA			D'10'
		SZB				STATUS,C
		JP				NO_KEY1
		SZINCR			KEY_DELAY2
		NOP
		JP				END_SCANKEY
NO_KEY1:
		CLRB			F_PRESS
		CLR				KEY_VALUE0
		CLR				KEY_DELAY1
		JP				END_SCANKEY
ON_KEY:
		LD				A,KEY_VALUE
		XORA			KEY_VALUE0
		SZB				STATUS,Z
		JP				ON_KEY1
		CLR				KEY_DELAY1
		LD				A,KEY_VALUE
		LD				KEY_VALUE0,A
		JP				END_SCANKEY
ON_KEY1:
		LD				A,KEY_DELAY1
		HSUBIA			D'5'
		SZB				STATUS,C
		JP				KEY_JUD
		SZINCR			KEY_DELAY1
		NOP
		JP				END_SCANKEY
KEY_JUD:
		SZB				F_PRESS
		JP				OLD_KEY
		LD				A,KEY_DELAY2
		HSUBIA			D'3'
		SNZB			STATUS,C
		JP				ILLEGAL_PRESS
		CLR				KEY_DELAY2
		SETB			F_PRESS
		
		LD				A,KEY_VALUE
		XORIA			01H
		SZB				STATUS,Z
		JP				KEY_SPEED
		LD				A,KEY_VALUE
		XORIA			02H
		SZB				STATUS,Z
		JP				KEY_POWER
		LD				A,KEY_VALUE
		XORIA			04H
		SZB				STATUS,Z
		JP				OSC_ONOFF
		LD				A,KEY_VALUE
		XORIA			08H
		SZB				STATUS,Z
		JP				KEY_TIMER
OLD_KEY:
		JP				END_SCANKEY				;NO LONG PRESSING FUNCTION
OSC_ONOFF:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SNZB			F_OSC
		JP				OSC_ON
		JP				OSC_OFF
OSC_ON:
		SETB			F_OSC
		JP				END_SCANKEY
OSC_OFF:
		CLRB			F_OSC
		JP				END_SCANKEY
KEY_POWER:
		SNZB			F_ONOFF
		JP				POWER_ON
		JP				POWER_OFF
POWER_ON:
		SETB			F_ONOFF
		LD				A,SPEED_BUF
		LD				SPEED,A
		CLRB			F_OSC
		CLR				HOURS
		CLR				HOURS_BUF
		JP				END_SCANKEY
POWER_OFF:
		CLRB			F_ONOFF
		LD				A,SPEED
		LD				SPEED_BUF,A
		CLRB			F_OSC
		CLR				HOURS
		CLR				HOURS_BUF
		JP				END_SCANKEY
KEY_SPEED:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SZINCR			SPEED
		NOP
		LD				A,SPEED
		HSUBIA			D'4'
		SNZB			STATUS,C
		JP				END_SCANKEY
		LDIA			01H
		LD				SPEED,A
		JP				END_SCANKEY
KEY_TIMER:
		SNZB			F_ONOFF
		JP				END_SCANKEY
		SZINCR			HOURS
		NOP
		LD				A,HOURS
		HSUBIA			D'8'
		SZB				STATUS,C
		CLR				HOURS
		LD				A,HOURS
		LD				HOURS_BUF,A
		CLR				TIMER_MIN
		CLR				TIMER_SEC
		JP				END_SCANKEY
ILLEGAL_PRESS:
		CLR				KEY_DELAY2
		CLR				KEY_VALUE
END_SCANKEY:
		RET
;******************************************************************;
DISPLAY:
		SETB			LED_SEG1
        SETB			LED_SEG2
		CLRB			LED_COM1
		CLRB			LED_COM2
		CLRB			LED_COM3
		CLRB			LED_COM4
		SNZB			F_ONOFF
		JP				END_DISPLAY
DIS_SPEED:
		SZB				F_DISPLAY
		JP				DIS_TIMER
		SETB			F_DISPLAY

		LD				A,SPEED
		XORIA			01H
		SZB				STATUS,Z
		JP				MODE_HIG
		LD				A,SPEED
		XORIA			02H
		SZB				STATUS,Z
		JP				MODE_MID
		LD				A,SPEED
		XORIA			03H
		SZB				STATUS,Z
		JP				MODE_LOW
		JP				END_DIS_SPEED
MODE_HIG:
		SETB			LED_COM3
		JP				END_DIS_SPEED
MODE_MID:
		SETB			LED_COM4
		JP				END_DIS_SPEED
MODE_LOW:
		SETB			LED_COM1
END_DIS_SPEED:
		CLRB			LED_SEG2
		SETB			LED_COM2
		JP				END_DISPLAY
;------------------------------------------------------------------;
DIS_TIMER:
		SNZB			F_DISPLAY
		JP				END_DISPLAY
		CLRB			F_DISPLAY
		SZB				HOURS,0
		SETB			LED_COM2
		SZB				HOURS,1
		SETB			LED_COM3
		SZB				HOURS,2
		SETB			LED_COM4
END_DIS_TIMER:
		CLRB			LED_SEG1
		SETB			LED_COM1
;------------------------------------------------------------------;	
END_DISPLAY:
		RET
;******************************************************************;
WORK_SUB:
		SZB				F_ONOFF
		JP				WORK_JUD
WORK_STOP:
		CLRB			F_HIG
		CLRB			F_MID
		CLRB			F_LOW
		CLRB			F_OSC
		JP				END_WORK_SUB
WORK_JUD:
		LD				A,SPEED
		XORIA			01H
		SZB				STATUS,Z
		JP				WORK_HIG
		
		LD				A,SPEED
		XORIA			02H
		SZB				STATUS,Z
		JP				WORK_MID

		LD				A,SPEED
		XORIA			03H 
		SZB				STATUS,Z
		JP				WORK_LOW
WORK_HIG:
		CLRB			F_MID
		CLRB			F_LOW
		SETB			F_HIG
		JP				END_WORK_SUB
WORK_MID:
		CLRB			F_HIG
		CLRB			F_LOW
		SETB			F_MID
		JP				END_WORK_SUB
WORK_LOW:
		CLRB			F_HIG
		CLRB			F_MID
		SETB			F_LOW
		JP				END_WORK_SUB
END_WORK_SUB:
		LD				A,FLAG0
		XORA			DATA_BUF
		SZB				STATUS,Z
		JP				END_WORK_SUB1
		LD				A,FLAG0
		LD				DATA_BUF,A
		LDIA			D'20'
		LD				T_SEND,A
END_WORK_SUB1:
		RET
;******************************************************************;
REMOTE_DEAL:
		LD				A,T_REMOTE1
		HSUBIA			D'250'
		SNZB			STATUS,C
		SZINCR			T_REMOTE1
		NOP
		LD				A,T_REMOTE2
		HSUBIA			D'250'
		SNZB			STATUS,C
		SZINCR			T_REMOTE2
		NOP
SCANREMOTE0:
		SZB				F_RECEIVE_OK
		JP				SCANREMOTE1
		LD				A,T_REMOTE2
		HSUBIA			D'30'
		SNZB			STATUS,C
		JP				END_SCANREMOTE
		CLRB			F_ON_REMOTE
		JP				END_SCANREMOTE
SCANREMOTE1:
		CLRB			F_RECEIVE_OK
		SZB				F_PRESS
		JP				OFF_REMOTEKEY
		LD				A,CODE1_BUF
		XORIA			0DH
		SNZB			STATUS,Z
		JP				END_SCANREMOTE2
		SNZB			F_ON_REMOTE
		JP				NEW_REMOTE
OLD_REMOTE:	
		;JP				END_SCANREMOTE2
		;LD				A,T_REMOTE1
		;HSUBIA			D'200'
		;SNZB			FLAGS,C
		;JP				END_SCANREMOTE1
		;LD				A,CODE2_BUF
		;XORIA			8CH
		;SZB			FLAGS,Z
		;JP				YKKEY_TIMER
		JP				END_SCANREMOTE2				;NO LONG PRESSING
NEW_REMOTE:
		SETB			F_ON_REMOTE
		LD				A,CODE2_BUF
		XORIA			81H
		SZB				STATUS,Z
		JP				REMOTE_KEY_POWER
		LD				A,CODE2_BUF
		XORIA			82H
		SZB				STATUS,Z
		JP				REMOTE_KEY_SPEED
		LD				A,CODE2_BUF
		XORIA			88H
		SZB				STATUS,Z
		JP				REMOTE_KEY_TIMER
		LD				A,CODE2_BUF
		XORIA			90H
		SZB				STATUS,Z
		JP				REMOTE_KEY_OSC
REMOTE_KEY_POWER:
		CALL			KEY_POWER
		JP				END_REMOTE_KEY
REMOTE_KEY_SPEED:
		CALL			KEY_SPEED
		JP				END_REMOTE_KEY
REMOTE_KEY_TIMER:
		CALL			KEY_TIMER
		JP				END_REMOTE_KEY
REMOTE_KEY_OSC:
		CALL			OSC_ONOFF
END_REMOTE_KEY:
		JP				END_SCANREMOTE2
OFF_REMOTEKEY:
		CLRB			F_ON_REMOTE
END_SCANREMOTE2:
		CLR				T_REMOTE1
END_SCANREMOTE1:
		CLR				T_REMOTE2
END_SCANREMOTE:
		RET
;******************************************************************;
		JP				RESET
		END
