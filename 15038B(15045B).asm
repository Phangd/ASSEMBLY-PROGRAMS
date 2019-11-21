		#INCLUDE		CMS6052D.H    
;******************************************************************;
		FLAG0			EQU		?
		FLAG1			EQU     	?
		TIMER_2MS       	EQU     	?
		TN			EQU		?
		BIT_NUM         	EQU		?
		CODE1           	EQU		?
		CODE1_BUF       	EQU		?
		CODE2           	EQU		?
		DELAY_TIMER     	EQU		?
		TIMER_250MS     	EQU		?
		T_OUTPUT		EQU		?
		TIMER_TIMEOUT		EQU		?
;******************************************************************;
		F_T2MS			EQU		TIMER_2MS,4
		
		F_ONOFF			EQU		FLAG0,7
		F_OSC			EQU		FLAG0,6
		F_HIG			EQU		FLAG0,5
		F_MID			EQU		FLAG0,4
		F_LOW			EQU		FLAG0,3
		
		F_PULSE_DEAL		EQU		FLAG1,0
		F_RECEIVE_OK		EQU		FLAG1,1
		F_OUTPUT		EQU		FLAG1,2
;******************************************************************;
		OUT_HIG			EQU		P0,0
		OUT_MID			EQU		P1,0
		OUT_LOW			EQU		P5,4
		OUT_OSC			EQU		P1,3
		REMOTE			EQU		P1,1
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
		SNZB				INTRQ,TC0IRQ
		JP				EXIT_INT
		CLRB				INTRQ,TC0IRQ
;------------------------------------------------------------------;
TIMER:
		SZINCR				TIMER_2MS
		NOP
;------------------------------------------------------------------;
REMOTE_RECEIVE:
		LD				A,TN
		HSUBIA				D'200'
		SNZB				STATUS,C
		SZINCR				TN
		NOP
		SNZB				REMOTE
		JP				PLUSE_DOWN
PLUSE_UP:
		SZB				F_PULSE_DEAL
		JP				END_REMOTE_RECEIVE
		SETB				F_PULSE_DEAL
PULSE_JUD:
		LD				A,TN
		HSUBIA				D'2'
		SNZB				STATUS,C
		JP				ERROR_PULSE
		LD				A,TN
		HSUBIA				D'16'
		SZB				STATUS,C
		JP				ERROR_PULSE
		RLCR				CODE2
		RLCR				CODE1
		LD				A,TN
		HSUBIA				D'8'
		SZB				STATUS,C
		JP				BIT1
		CLRB				CODE2,0
		JP				BIT_DEAL
BIT1:
		SETB				CODE2,0
BIT_DEAL:
		SZINCR				BIT_NUM
		NOP
		LD				A,BIT_NUM
		HSUBIA				D'16'
		SNZB				STATUS,C
		JP				END_BIT_DEAL1
		LD				A,CODE2
		XORA				CODE1
		SNZB				STATUS,Z
		JP				ERROR_PULSE
		LD				A,CODE1
		LD				CODE1_BUF,A
		SETB				F_RECEIVE_OK
		JP				ERROR_PULSE
PLUSE_DOWN:
		SNZB				F_PULSE_DEAL
		JP				END_REMOTE_RECEIVE
		CLRB				F_PULSE_DEAL
		LD				A,TN
		HSUBIA				D'2'
		SNZB				STATUS,C
		JP				ERROR_PULSE
		LD				A,TN
		HSUBIA				D'16'
		SZB				STATUS,C
		JP				ERROR_PULSE
		JP				END_BIT_DEAL1
ERROR_PULSE:
		CLR				BIT_NUM
		CLR				CODE1
		CLR				CODE2
END_BIT_DEAL1:
		CLR				TN
END_REMOTE_RECEIVE:
;------------------------------------------------------------------;
EXIT_INT:
		POP
		RETI
;******************************************************************;
RESET:
		CLRWDT
		NOP
		CLR				STATUS
		CLRB				STKP,GIE
		OPTION
		LDIA				B'11111101'
		LD				P0M,A
		LD				P1M,A
		LD				P5M,A
		
		LDIA				B'00000000'
		LD				P0UR,A
		LD				P1UR,A
		LD				P5UR,A
		
		LDIA				B'11111111'
		LD				P0,A
		LD				P1,A
		LD				P5,A
		
		NOP
		NOP
		NOP
		NOP
		NOP
;------------------------------------------------------------------;
		CLR				FSRH
		LDIA				30H
		LD				FSRL,A
CLR_RAM:
		SZDECR				FSRL
		NOP
		CLR				INDF
		LD				A,FSRL
		HSUBIA				01H
		SZB				STATUS,C
		JP				CLR_RAM
		CLR				INDF
;------------------------------------------------------------------;
POWER_ON_DELAY:
		SZINCR				DELAY_TIMER
		NOP
		LD				A,DELAY_TIMER
		HSUBIA				D'250'
		SNZB				STATUS,C
		JP				POWER_ON_DELAY
		CLR				DELAY_TIMER
		CLRWDT
INIT_INT:
		CLRB				INTRQ,TC0IRQ
		LDIA				B'01110100'
		LD				TC0M,A
		LDIA				D'131'
		LD				TC0R,A
		LD				TC0C,A
		SETB				STKP,GIE
		SETB				INTEN,TC0IEN
		SETB				TC0M,TC0ENB
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
MAINLOOP:
		SNZB				F_T2MS
		JP				MAINLOOP
		CLRB				F_T2MS
		CLRWDT
		CALL				TIMER_SUB
		CALL				WORK_SUB
		JP				MAINLOOP
;******************************************************************;
;******************************************************************;
;******************************************************************;
;******************************************************************;
TIMER_SUB:
		SZINCR				TIMER_250MS
		NOP
		LD				A,TIMER_250MS
		HSUBIA				D'125'
		SNZB				STATUS,C
		JP				TIMER_SUB1
		CLR				TIMER_250MS
		LD				A,TIMER_TIMEOUT
		HSUBIA				D'200'
		SNZB				STATUS,C
		SZINCR				TIMER_TIMEOUT
		NOP
		SNZB				F_RECEIVE_OK
		JP				TIMER_SUB1
		CLR				TIMER_TIMEOUT
		CLRB				F_RECEIVE_OK
TIMER_SUB1:
		SNZB				F_ONOFF
		JP				TIMEOUT_COUNT
		SZINCR				T_OUTPUT
		NOP
		LD				A,T_OUTPUT
		HSUBIA				D'25'
		SZB				STATUS,C
		SETB				F_OUTPUT
		LD				A,T_OUTPUT
		HSUBIA				D'250'
		SNZB				STATUS,C
		JP				TIMEOUT_COUNT
		CLR				T_OUTPUT
TIMEOUT_COUNT:
		LD				A,TIMER_TIMEOUT
		HSUBIA				D'20'
		SNZB				STATUS,C
		JP				END_TIMER_SUB
		CLRB				F_ONOFF
END_TIMER_SUB:
		RET
;******************************************************************;		
WORK_SUB:
		LD				A,FLAG0
		XORA			CODE1_BUF
		SZB				STATUS,Z
		JP				WORK_JUD
		LD				A,CODE1_BUF
		LD				FLAG0,A
		CLRB				F_OUTPUT
		CLR				T_OUTPUT
WORK_JUD:
		SNZB				F_ONOFF
		JP				WORK_STOP
		SZB				F_HIG
		JP				SPEED_HIG
		SZB				F_MID
		JP				SPEED_MID
		SZB				F_LOW
		JP				SPEED_LOW
		JP				WORK_STOP
SPEED_HIG:
		SETB				OUT_MID
		SETB				OUT_LOW
		SZB				F_OUTPUT
		CLRB				OUT_HIG
		JP				OSC_JUD
SPEED_MID:
		SETB				OUT_HIG
		SETB				OUT_LOW
		SZB				F_OUTPUT
		CLRB				OUT_MID
		JP				OSC_JUD
SPEED_LOW:
		SETB				OUT_HIG
		SETB				OUT_MID
		SZB				F_OUTPUT
		CLRB				OUT_LOW
OSC_JUD:
		SNZB				F_OSC
		SETB				OUT_OSC
		SZB				F_OSC
		CLRB				OUT_OSC
		JP				END_WORK_SUB
WORK_STOP:
		SETB				OUT_HIG
		SETB				OUT_MID
		SETB				OUT_LOW
		SETB				OUT_OSC
END_WORK_SUB:
		RET
;******************************************************************;
		JP				RESET
		END
