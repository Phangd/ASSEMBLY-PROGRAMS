
		#INCLUDE		CMS89F6285B.H

		#INCLUDE		"Touch_Kscan_Library.h"
		#INCLUDE 		"SendTouchKey_89F62x.h"
		
;******************************************************************;
;******************************************************************;

;工作RAM
		ACC_BUF			EQU 		?	       
		STATUS_BUF		EQU 		?        
		TCOUNT			EQU 		？	
		TEMP        	EQU         ?
		TEMP1			EQU 		?
		COUNT       	EQU         ?
	
		KFLAG			EQU 		?
	
		KEYF_OLD		EQU			?
		KEYF1_OLD		EQU			?
		FLAG0			EQU			?
		NUMBER			EQU			?
		LED_DATA1       EQU			?
		LED_DATA2       EQU			?
		LED_DATA3       EQU			?
		LED_DATA4       EQU			?
		LED_BUF1        EQU			?
		LED_BUF2        EQU			?
		LED_BUF5		EQU			?
		LED_BUF6        EQU			?
		DSP_BUF         EQU			?
		BITNUM          EQU			?
		WAIT_TIME1		EQU			?
		KEY_VALUE		EQU			?
		KEY_VALUE1      EQU			?
		KEY_DELAY       EQU			?
		MODE            EQU			?
		T_HOUR          EQU			?
		T_BUZ           EQU			?
		FLASH           EQU			?
		T100MS_TIMER	EQU			?
		T250MS_TIMER    EQU			?
		T_FLASH         EQU			?


;******************************************************************;
;******************************************************************;
;端口声明
		NTC			EQU		PORTA,RA0
		OUT_LOW		EQU		PORTA,RA1
		OSCL		EQU		PORTA,RA2
		OSCR		EQU		PORTA,RA3
		FANH		EQU		PORTA,RA6
		ZERO1		EQU		PORTA,RA7
		
		KEY_TIMER	EQU		PORTB,RB1
		KEY_UP		EQU		PORTB,RB2
		KEY_DOWN	EQU		PORTB,RB3
		KEY_POWER	EQU		PORTB,RB4
		KEY_MODE	EQU		PORTB,RB5
		KEY_OSC		EQU		PORTB,RB6
		BUZ			EQU		PORTB,RB7
		
		FANL		EQU		PORTC,RC1
		SCL			EQU		PORTC,RC2
		LEDN		EQU		PORTC,RC3
		LEDP		EQU		PORTC,RC4
		SDA			EQU		PORTC,RC5
		REMOTE		EQU		PORTC,RC6
		
		PC			EQU		PORTE,RE1
		ZERO2		EQU		PORTE,RE2
		
;******************************************************************;
;******************************************************************;

;标志位声明
		;FLAG1
		F_ONOFF			EQU	FLAG0,0
		F_BUZ			EQU	FLAG0,1
		F_ONKEY			EQU	FLAG0,2
		F_OSC			EQU	FLAG0,3
		F_AUTO			EQU	FLAG0,4
		F_TIMER_SET		EQU	FLAG0,5
		F_TEMP_SET      EQU	FLAG0,6
;******************************************************************;
;******************************************************************;
		ORG 		00H

   		JP  		START
		ORG 		04H
;------------------------------------------------------------------;
        LD  		ACC_BUF,A			;中断现场保9护
		SWAPR		ACC_BUF
		SWAPA		STATUS
		LD  		STATUS_BUF,A
;------------------------------------------------------------------;
INT_TMR2:
		CLR 		PIR1			;清中断响应标志位
		INCR		TCOUNT
;---------------------------- BUZZER ------------------------------;
		SNZB		F_BUZ
		JP			END_BUZZ
BUZZ:			
		LDIA		80H
		XORR		PORTB
		JP			END_BUZZ
END_BUZZ:		
;------------------------------------------------------------------;
INT_EXIT:
		SWAPA		STATUS_BUF
		LD  		STATUS,A
		SWAPA		ACC_BUF
		RETI
;******************************************************************;
;******************************************************************;
START:
		NOP
		CLRWDT
;----------------------------初始化I/O-----------------------------;
		LDIA		071H
		LD			OSCCON,A
		
		LDIA		B'01001100'
		LD  		PORTA,A		
		LDIA		B'10110001'
		LD  		TRISA,A
	    LDIA		B'01001100'
		LD  		PORTA,A		
		
		LDIA		00H
		LD  		PORTB,A
		LDIA		B'00111111'
		LD  		TRISB,A
		LDIA		00H		
		LD  		PORTB,A		
		
		LDIA		B'00011010'
		LD  		PORTC,A
		LDIA		B'11000000'	
		LD  		TRISC,A			
	    LDIA		B'00011010'
		LD  		PORTC,A
		
		LDIA		00H
		LD  		PORTE,A
		LDIA		B'11111111'
		LD  		TRISE,A
		LDIA		00H
		LD  		PORTE,A

		CLR			INTCON

;-----------------------------清寄存器-----------------------------;
		CLRB		STATUS,IRP
CLR_RAM：
		LDIA		1FH					;从20H开始
		LD  		FSR,A
CLR_RAM_LOOP
		INCR		FSR
		CLR 		INDF
		LDIA		07FH
		ANDA		FSR
		SUBIA		07FH				;20-7F,A0-FF,120-17F,1A0-1FF
		SNZB 		STATUS,Z
		JP  		CLR_RAM_LOOP
		SZB 		FSR,7
		JP  		CLR_RAM_H
		LDIA		20H
		SZB 		STATUS,IRP
		LDIA		18H
		ADDR		FSR
		JP  		CLR_RAM_LOOP
CLR_RAM_H:						
		SZB 		STATUS,IRP			;判断是否已经是第3-4BANK
		JP  		CLR_RAM_BACK		;已经是第3-4BANK,清RAM结束
		SETB		STATUS,IRP			;不是3-4BANK,设置BANK标志位，开始清3-4BANK的RAM
		JP  		CLR_RAM
CLR_RAM_BACK:
		CLRB		STATUS,IRP
;------------------------------------------------------------------;
INIT_LOOP:						;上电延时9*256*256/2=300MS
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		SZDECR		COUNT
		JP  		INIT_LOOP
		CLRWDT
	
		SZDECR		TEMP
		JP  		INIT_LOOP
;------------------------------------------------------------------;
INIT_RAM:
		LDIA		.250			;8M下125US
		LD  		PR2,A			;TMR2设置成250US
		LDIA		B'00000100'
		LD  		T2CON,A
		LDIA		02H
		LD			PIE1,A
		LDIA		0C0H
		LD  		INTCON,A		;定时2中断使能
		
;******************************************************************;
;******************************************************************;
;******************************************************************;
MAIN:
		LDIA		.16					;125us*20=2.5ms一个主循环
		SUBA		TCOUNT
		SNZB		STATUS,C
		JP  		MAIN
		CLR 		TCOUNT
		CLRWDT
MAIN_SUB:
		;CALL		SET_SYS
		CALL  		KSCAN           ;触摸扫描程序	
		CALL        MAINK			;触摸处理程序
		CALL		DISPLAY_DATA
		CALL		DISPLAY
		CALL		TIMER_SUB
		#if (CMS_DEBUG_MODE == 1)
			CALL	SEND_TOUCHKEY	;触摸传数据	
		#endif	
		JP  		MAIN
;******************************************************************;
;系统寄存器设置
;******************************************************************;
SET_SYS:		
 	    LDIA		B'10110001'
		LD  		TRISA,A
		LDIA		B'00111111'
		LD  		TRISB,A
		LDIA		B'11000000'
		LD  		TRISC,A
		LDIA		B'11111111'		
		LD  		TRISE,A
		RET

;******************************************************************;
;******************************************************************;		
TIMER_SUB:
		INCR		T100MS_TIMER
		LD			A,T100MS_TIMER
		HSUBIA		D'50'
		SNZB		STATUS,C
		JP			T1
T_05SEC:
		CLR			T100MS_TIMER
		INCR		T_FLASH
		LD			A,T_FLASH
		HSUBIA		D'25'
		SZB			STATUS,C
		CLRB		F_TIMER_SET
		LD			A,T_FLASH
		HSUBIA		D'50'
		SZB			STATUS,C
		CLRB		F_TEMP_SET
;------------------------------------------------------------------;
T1:
		INCR		T250MS_TIMER
		LD			A,T250MS_TIMER
		HSUBIA		D'125'
		SNZB		STATUS,C
		JP			END_T1
		CLR			T250MS_TIMER
		INCR		FLASH
END_T1:
;------------------------------------------------------------------;
BUZ_TIMER:
		SNZB		F_BUZ
		JP			END_BUZ_TIMER
		INCR   		T_BUZ
		LD   		A,T_BUZ
		HSUBIA  	D'80'
		SZB  		STATUS,C
		CLRB  		F_BUZ
END_BUZ_TIMER:
;------------------------------------------------------------------;
END_TIMER_SUB:
		RET
;******************************************************************;
;******************************************************************;
DISPLAY_DATA:
		INCR		NUMBER
		NOP
		LD			A,NUMBER
		HSUBIA		D'3'
		SNZB		STATUS,C
		JP			END_DISPLAY_DATA
		CLR			NUMBER
		
		CLR			LED_DATA1
		CLR			LED_DATA2
		CLR			LED_DATA3
		CLR			LED_DATA4
		SZB			F_ONOFF
		JP			DISP_DATA
SHUTDOWN_DISP:	
		SETB		LEDN
		SETB		LEDP
		JP			END_DISPLAY_DATA
DISP_DATA:
		LDIA		B'00010001'
		LD			LED_DATA3,A
		LDIA		B'00001110'
		LD			LED_DATA4,A
		SZB			F_TIMER_SET
		JP			DISP_DATA1
		SZB			F_TEMP_SET
		JP			DISP_DATA2
		SZB			F_AUTO
		JP			DISP_DATA4
		JP			DISP_DATA3
;------------------------------------------------------------------;
DISP_DATA1:							;时间设置显示
		SZB			FLASH,1
		JP			DISP_DATA2
		LD			A,T_HOUR
		LD			LED_BUF5,A
		CALL		CALL_TABLE
		LD			A,LED_BUF5
		LD			LED_DATA1,A
		LDIA		6BH
		LD			LED_DATA2,A
		JP			END_DISPLAY_DATA
;------------------------------------------------------------------;		
DISP_DATA2:							;温度设置显示
		
		JP			END_DISPLAY_DATA
;------------------------------------------------------------------;		
DISP_DATA3:							;档位显示	
		LDIA		6BH
		LD			LED_DATA1,A
		LD			A,MODE
		XORIA		00H
		SZB			STATUS,Z
		JP			HIG_MODE
		
		LD			A,MODE
		XORIA		01H
		SZB			STATUS,Z
		JP			MID_MODE

		LD			A,MODE
		XORIA		02H
		SZB			STATUS,Z
		JP			LOW_MODE
HIG_MODE:
		LDIA		5DH
		LD			LED_DATA2,A
		JP			END_DISPLAY_DATA
MID_MODE:
		LDIA		3DH
		LD			LED_DATA2,A
		JP			END_DISPLAY_DATA
LOW_MODE:
		LDIA		48H
		LD			LED_DATA2,A
		JP			END_DISPLAY_DATA
;------------------------------------------------------------------;
DISP_DATA4:								;温度显示
		
END_DISPLAY_DATA:
		RET
;******************************************************************;
;******************************************************************;		
DISPLAY:
		LD			A,NUMBER
		XORIA		D'1'
		SNZB		STATUS,Z
		JP			END_DISPLAY
		CLR			LED_BUF1
		CLR			LED_BUF2
		
		SNZB		F_ONOFF
		JP			DISP_LED
		LD			A,T_HOUR
		HSUBIA		D'1'
		SNZB		STATUS,C
		JP			NO_TIMER
		SETB		LEDN
		CLRB		LEDP
		JP			DISPLAY1
NO_TIMER:
		CLRB		LEDN
		SETB		LEDP
DISPLAY1:		
		SZB			LED_DATA1,0			;A
		SETB		LED_BUF1,0
		SZB			LED_DATA1,1			;B
		SETB		LED_BUF1,1
		SZB			LED_DATA1,2			;C
		SETB		LED_BUF1,2
		SZB			LED_DATA1,3			;D
		SETB		LED_BUF1,3
		SZB			LED_DATA1,4			;E
		SETB		LED_BUF1,4
		SZB			LED_DATA1,5			;F
		SETB		LED_BUF1,5
		SZB			LED_DATA1,6			;G
		SETB		LED_BUF1,6
		SZB			LED_DATA1,7
		SETB		LED_BUF1,7

		SZB			LED_DATA2,0			;A
		SETB		LED_BUF2,0
		SZB			LED_DATA2,1			;B
		SETB		LED_BUF2,1
		SZB			LED_DATA2,2			;STATUS,C
		SETB		LED_BUF2,2
		SZB			LED_DATA2,3			;D
		SETB		LED_BUF2,3
		SZB			LED_DATA2,4			;E
		SETB		LED_BUF2,4
		SZB			LED_DATA2,5			;F
		SETB		LED_BUF2,5
		SZB			LED_DATA2,6			;G
		SETB		LED_BUF2,6
		SZB			LED_DATA2,7
		SETB		LED_BUF2,7
DISP_LED:
		CLRB		SCL
		CLRB		SDA
		LDIA		B'11111011'
		ANDR		TRISC
		NOP
		NOP
		CALL		I2C_START
		LDIA		68H
		CALL		TRANSING
		LD			A,LED_DATA3
		CALL		TRANSING
		CALL		I2C_STOP
		
		CALL		I2C_START
		LDIA		6AH
		CALL		TRANSING
		LD			A,LED_BUF2
		CALL		TRANSING
		CALL		I2C_STOP
		
		CALL		I2C_START
		LDIA		6CH
		CALL		TRANSING
		LD			A,LED_DATA4
		CALL		TRANSING
		CALL		I2C_STOP
		
		CALL		I2C_START
		LDIA		6EH
		CALL		TRANSING
		LD			A,LED_BUF1
		CALL		TRANSING
		CALL		I2C_STOP
		
		CALL		I2C_START
		LDIA		48H
		CALL		TRANSING
		LDIA		01H
		CALL		TRANSING			
		CALL		I2C_STOP
;------------------------------------------------------------------;
END_DISPLAY:
        RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           AIP650写指令/数据处理子程序	      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TRANSING:
		LD			DSP_BUF,A
		LDIA		D'8'
		LD			BITNUM,A
LBITL:
		CLRB		SCL
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RLCR		DSP_BUF
		SZB			STATUS,C
		JP			LBIT1
LBIT0:
		CLRB		SDA
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		JP			LRL
LBIT1:  
		SETB		SDA
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
LRL:              
		SETB		SCL
		NOP
		NOP
		DECR		BITNUM
		NOP
		LD			A,BITNUM
		HSUBIA		D'1'
		SZB			STATUS,C
		JP			LBITL
		CLRB		SCL
		LDIA		B'00000100'
		ORR			TRISC
		NOP
		NOP
		NOP
		NOP
TRANSING1:
		SNZB		SDA
		JP			END_TRANSING
		INCR		WAIT_TIME1
		NOP
		LD			A,WAIT_TIME1
		HSUBIA		D'20'
		SNZB		STATUS,C
		JP			TRANSING1
		CLR			WAIT_TIME1
END_TRANSING:
		CLR     	DSP_BUF
		SETB		SCL
		LDIA		B'11111011'
		ANDR		TRISC
		RET
;******************************************************************;
I2C_START:						; 数据传输开始
		CLRB		SCL
		SETB		SDA
		SETB		SCL
		NOP
		NOP
		NOP
		NOP
		CLRB		SDA
		NOP
		NOP
		CLRB		SCL
		RET
;------------------------------------------------------------------;
I2C_STOP:						; 数据传输结束
		CLRB		SCL
		CLRB		SDA
		SETB		SCL
		NOP
		NOP
		NOP
		NOP
		SETB		SDA
		NOP
		NOP
		CLRB		SCL
		RET		
	
;******************************************************************;
;根据KEYF和KEYF1判断有没有按键
;当有多个按键的时候将错误标志位 "TK_FLAG,B_KERR" 置1
;******************************************************************;
MAINK:
		LD			A,KEYF
		#if	C_KCOUNT > 8
		ORA			KEYF1
		#endif
		SZB			STATUS,Z
		JP			MAINK_NO
		
		LD			A,KEYF
		XORA		KEYF_OLD		;相同
		SZB			STATUS,Z
		JP			MAINK_HIGH
		
		LD			KEYF_OLD,A
		
		LDIA		10H
		SNZB		KEYF_OLD,0
		JP			$+3
		SZB			KEYF,0
		JP			TIMER_SETUP
		
		LDIA		80H
		SNZB		KEYF_OLD,1
		JP			$+3
		SZB			KEYF,1
		JP			TEMP_UP
		
		LDIA		04H
		SNZB		KEYF_OLD,2
		JP			$+3
		SZB			KEYF,2
		JP			TEMP_DOWN
		
		LDIA		20H
		SNZB		KEYF_OLD,3
		JP			$+3
		SZB			KEYF,3
		JP			POWER_ONOFF
		
		LDIA		08H
		SNZB		KEYF_OLD,4
		JP			$+3
		SZB			KEYF,4
		JP			MODE_CHANGE
		
		LDIA		01H
		SNZB		KEYF_OLD,5
		JP			$+3
		SZB			KEYF,5
		JP			OSC_ONOFF
		
		LDIA		08H
		SNZB		KEYF_OLD,6
		JP			$+3
		SZB			KEYF,6
		;XORR		PORTE
		
		LDIA		40H
		SNZB		KEYF_OLD,7
		JP			$+3
		SZB			KEYF,7
		;XORR		PORTE

		LD			A,KEYF
		LD			KEYF_OLD,A
MAINK_HIGH:
		#if	C_KCOUNT > 8
		LD			A,KEYF1
		XORA		KEYF1_OLD
		SZB			STATUS,Z
		JP			MAINK_BACK
		
		LD			KEYF1_OLD,A
		
		LDIA		02H
		SNZB		KEYF1_OLD,0
		JP			$+3
		SZB			KEYF1,0
		XORR		PORTA
		
		LDIA		02H
		SNZB		KEYF1_OLD,1
		JP			$+3
		SZB			KEYF1,1
		XORR		PORTE
		
		LDIA		10H
		SNZB		KEYF1_OLD,2
		JP			$+3
		SZB			KEYF1,2
		XORR		PORTE
		
		LDIA		80H
		SNZB		KEYF1_OLD,3
		JP			$+3
		SZB			KEYF1,3
		XORR		PORTE
		
		LD			A,KEYF1
		LD			KEYF1_OLD,A
		#endif
		JP			MAINK_BACK
;------------------------------------------------------------------;
POWER_ONOFF:
		SZB			F_ONOFF
		JP			POWER_OFF
		SETB		F_ONOFF
		CLRB		F_OSC
		CLR			MODE
		CLR			T_HOUR
		CLR			FLASH
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		JP			BUZ_ON
POWER_OFF:
		CLRB		F_ONOFF
		CLRB		F_OSC
		CLR			MODE
		CLR			T_HOUR
		CLR			FLASH
		JP			BUZ_ON
;------------------------------------------------------------------;
TIMER_SETUP:
		SNZB		F_ONOFF
		JP			MAINK_BACK
		CLRB		F_TEMP_SET
		SETB		F_TIMER_SET
		CLR			T_FLASH
		INCR		T_HOUR
		LD			A,T_HOUR
		HSUBIA		D'9'
		SZB			STATUS,C
		CLR			T_HOUR
		JP			BUZ_ON
;------------------------------------------------------------------;
MODE_CHANGE:
		SNZB		F_ONOFF
		JP			MAINK_BACK
		CLRB		F_TEMP_SET
		CLRB		F_TIMER_SET
		INCR		MODE
		NOP
		LD			A,MODE
		HSUBIA		D'3'
		SZB			STATUS,C
		CLR			MODE
		CLRB		F_AUTO
		JP			BUZ_ON
;------------------------------------------------------------------;
TEMP_UP:
		JP			BUZ_ON



;------------------------------------------------------------------;
TEMP_DOWN:
		JP			BUZ_ON



;------------------------------------------------------------------;
OSC_ONOFF:
		SNZB		F_ONOFF
		JP			MAINK_BACK
		SNZB		F_OSC
		JP			OSC_ON
		CLRB		F_OSC
		JP			BUZ_ON
OSC_ON:
		SETB		F_OSC
;------------------------------------------------------------------;		
BUZ_ON:
		SETB		F_BUZ
		CLR			T_BUZ		
		JP			MAINK_BACK
;------------------------------------------------------------------;	
MAINK_NO:
		CLR			KEYF_OLD
		CLR			KEYF1_OLD		
MAINK_BACK:
        RET
;******************************************************************;
;调用按键库文件
;******************************************************************;
KSCAN：
		#INCLUDE	"Touch_Kscan_Library.lib"
;******************************************************************;

#if (CMS_DEBUG_MODE == 1)
		#INCLUDE 	"SendTouchKey_89F62x.asm"
#endif

;******************************************************************;
;******************************************************************;
CALL_TABLE:
		LD   		A,LED_BUF5
		HSUBIA		D'100'
		SZB  		STATUS,C
		JP      	CALL_TABLE3
		CLR     	LED_BUF6
CALL_TABLE1:	
		LD   		A,LED_BUF5
		HSUBIA  	D'10'
		SNZB  		STATUS,C
		JP      	CALL_TABLE2
		LD   		A,LED_BUF5
		HSUBIA  	D'10'
		LD   		LED_BUF5,A
		INCR   		LED_BUF6
		JP      	CALL_TABLE1
CALL_TABLE2:                
		LD			A,LED_BUF6
		LD			TABLE_SPL,A
		LDIA    	07H
		LD			TABLE_SPH,A
		TABLEA
		LD      	LED_BUF6,A

		LD			A,LED_BUF5
		LD			TABLE_SPL,A
		LDIA   	 	07H
		LD			TABLE_SPH,A
		TABLEA
		LD      	LED_BUF5,A
		RET
;------------------------------------------------------------------;
CALL_TABLE3:
		LDIA    	0F6H
		LD   		LED_BUF6,A
		LD   		LED_BUF5,A
		RET	
;------------------------------------------------------------------;
		ORG     0700H
DISP_TABLE:
		DW	07EH	; 0
		DW	048H	; 1
		DW	03DH	; 2
		DW	05DH	; 3
		DW	04BH	; 4
		DW	057H	; 5
		DW	077H	; 6
		DW	04CH	; 7
		DW	07FH	; 8
		DW	05FH	; 9
		DW	06FH	; A
		DW	073H	; b
		DW	05CH	; C
		DW	079H	; d
		DW	037H	; E
		DW	007H	; F
		END
		