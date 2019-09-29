		#INCLUDE			SC8P1713S.H	
;*****************************************************;
		KEY_VALUE			EQU		20H
		KEY_VALUE0			EQU		21H
		TIME_500MS			EQU		22H
		TIME_2MS			EQU		23H
		BAT_LOW_TIME			EQU		24H
		BAT_HIG_TIME			EQU		25H
		SPEED				EQU		26H
		SPEED_BUF			EQU		27H
		KEY_DELAY1			EQU		28H
		KEY_DELAY2			EQU		29H
		FLASH_TIME			EQU		2AH
		FLASH_TIME1			EQU		2BH
		LEDN				EQU		2CH
		NTC_NUM				EQU		2DH
		NTC_RAM				EQU		2EH
		NTC_BUF				EQU		2FH
		LED_BUF				EQU		30H
		TIME_SEC			EQU		31H
		OFF_SPEED			EQU		32H
		LED_TIME			EQU		33H
		WAIT_AD_TIME			EQU		34H
		BRATH_TIME			EQU		35H
		BRATH_TIME1			EQU		36H
		LED_ON_TIME			EQU		37H
		MOTO_OUT_TIME			EQU		38H
		MOTOA_OUT_TIME			EQU		39H		;motoa_out_time=12
		MOTOA_SLEEP_TIME		EQU		3AH
		MOTOB_OUT_TIME			EQU		3BH
		MOTOB_SLEEP_TIME		EQU		3CH
		NO_CHARG_TIME			EQU		3DH
		ON_CHARG_TIME			EQU		3EH
		FULL_TIME			EQU		3FH
		OFF_SPEED_BUF			EQU		40H
		NO_FULL_TIME			EQU		41H
		SLEEP_DELAY			EQU		42H
		MOTOAB_STOP_TIME		EQU		43H
		MOTOAB_OUT_TIME			EQU		44H
		MOTOAB_OUT_MAX			EQU		45H
		MOTOAB_OUT_MIN			EQU		46H
		MOTOAB_STOP_MIN			EQU		47H
		MOTOAB_STOP_MAX			EQU		48H
		PULSE_TIME			EQU		49H
		LOW_3V_TIME			EQU		4AH
		WORK_TIME			EQU		4BH
		BRATH_CYCLE			EQU		4CH
		FLAG0				EQU		4DH
		FLAG1				EQU		4EH
		ACC_BAK				EQU		4FH
		STATUS_BAK			EQU		50H
		POWER_DELAY			EQU		51H
		KEY_DELAY			EQU		52H
		TIME_1S				EQU		53H
;*****************************************************;
		LED6				EQU		PORTA,3
		LED7				EQU		PORTA,2
		LED8				EQU		PORTB,5
		LED9				EQU		PORTA,1
		LED10				EQU		PORTA,0
		LED11				EQU		PORTB,4
		TEST_PORT			EQU		PORTA,5
		
		CHARG_PIN			EQU		PORTB,7
		VDD_PIN				EQU		PORTB,6
	
		SW_POWER			EQU		PORTB,3
		
		OUT_MOTA			EQU		PORTC,1
		OUT_MOTB			EQU		PORTC,2
;*****************************************************;	
		;F_2MS				EQU		FLAG0,0
		F_BAT_LOW			EQU		FLAG0,1
		F_CHARG				EQU		FLAG0,2
		F_FULL				EQU		FLAG0,3
		F_ONKEY				EQU		FLAG0,4
		F_ONOFF				EQU		FLAG0,5
		F_BRATH				EQU		FLAG0,6
		F_POWER_KEY			EQU		FLAG0,7
	
		F_LOW_3V			EQU		FLAG1,0
		F_OFF_SET			EQU		FLAG1,1
		F_SPEED_UP			EQU		FLAG1,2
		F_BRATH_CYCLE_HIG		EQU		FLAG1,3
		
		LED_BUF_0			EQU		LED_BUF,0
		LED_BUF_1			EQU		LED_BUF,1
		LED_BUF_2			EQU		LED_BUF,2
		LED_BUF_3			EQU		LED_BUF,3
		LED_BUF_4			EQU		LED_BUF,4
		LED_BUF_5			EQU		LED_BUF,5
		LED_BUF_6			EQU		LED_BUF,6
		LED_BUF_7			EQU		LED_BUF,7
		
		FLASH_TIME_0			EQU		FLASH_TIME,0
		
		F_T2MS				EQU		TIME_2MS,4
		F_T4MS				EQU		LED_TIME,5
		
		
		
		
		
		
		
		
		
;*****************************************************;			
		ORG		0000H
		JP		RESET
		ORG		0004H
		JP		INT_SERVICE
;*****************************************************;		
INT_SERVICE:
PUSH:	
		LD		ACC_BAK,A				;保护现场
		SWAPA	STATUS
		LD		STATUS_BAK,A
		SNZB	PIE1,TMR2IE				;检测是否允许TIMER2中断
		JP		INT_EXIT
		SNZB	PIR1,TMR2IF				;检测TIMER2溢出中断标志位
		JP		INT_EXIT
		CLRB	PIR1,TMR2IF				;清零TIMER2溢出中断标志位
;-----------------------------------------------------;
TIMER2:
		INCR	TIME_2MS
		INCR	LED_TIME
		INCR	WAIT_AD_TIME
END_TIMER2:
;-----------------------------------------------------;
LED_CLOSE:
		SNZB	F_T4MS
		JP		END_LED_CLOSE
		CLRB	F_T4MS					;if(led_time>=40)	L697
		SETB	LED6
		SETB	LED7
		SETB	LED8
		SETB	LED9
		SETB	LED10
		SETB	LED11
END_LED_CLOSE:
;-----------------------------------------------------;
		SZB		F_CHARG					;if(f_charg)	L707-716
		JP		CHARG_DETECT
		SZB		F_BRATH					;else if(f_brath)	L717-803
		JP		BRATH_DETECT
		JP		LED_DISPLAY_JUD			;else	L804-812
; -----------------------------------------------------;
CHARG_DETECT:
		CLR		SLEEP_DELAY
		SNZB	F_FULL					;if(f_full) LED11_ON;	L710
		JP		NOT_FULL
		CLRB	LED11
		JP		END_CHARG_DETECT
NOT_FULL:								;else	L711
		LD		A,LED_TIME	
		HSUBA	LED_ON_TIME
		SNZB	STATUS,C				;if(led_on_time>led_time) LED11_ON;
		CLRB	LED11					;else LED11_OFF;
		SZB		STATUS,C
		SETB	LED11
END_CHARG_DETECT:
		JP		WORK_DISPOSAL			;if(f_onoff)		L814
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BRATH_DETECT:
		CLR		SLEEP_DELAY
		LD		A,BRATH_TIME			;if(brath_time<1)	L720
		HSUBIA	D'2'		
		SZB		STATUS,C				
		JP		BRATH_TIME_LESS2		;else if(brath_time<2)	L739
		LD		A,SPEED
		XORIA	01H
		SZB		STATUS,Z				;if(speed==1) LED6_ON;
		JP		LED6_ON
		LD		A,SPEED
		XORIA	02H
		SZB		STATUS,Z				;else if(speed==2) LED7_ON;
		JP		LED7_ON
		LD		A,SPEED
		XORIA	03H
		SZB		STATUS,Z				;else if(speed==3) LED8_ON;
		JP		LED8_ON
		LD		A,SPEED
		XORIA	04H
		SZB		STATUS,Z				;else if(speed==4) LED9_ON;
		JP		LED9_ON
		LD		A,SPEED
		XORIA	05H
		SZB		STATUS,Z				;else if(speed==5) LED10_ON;
		JP		LED10_ON
		JP		BAT_LOW_DETECT
LED6_ON:
		CLRB	LED6
		JP		BAT_LOW_DETECT
LED7_ON:
		CLRB	LED7
		JP		BAT_LOW_DETECT
LED8_ON:
		CLRB	LED8
		JP		BAT_LOW_DETECT
LED9_ON:
		CLRB	LED9
		JP		BAT_LOW_DETECT
LED10_ON:
		CLRB	LED10
BAT_LOW_DETECT:
		SZB		F_BAT_LOW				;if((f_bat_low)||(f_low_3v))	L728
		JP		BAT_LOW
		SZB		F_LOW_3V
		JP		BAT_LOW
		LD		A,LED_TIME				;else	L733
		HSUBA	LED_ON_TIME
		SNZB	STATUS,C				;if(led_on_time>led_time)	L735
		CLRB	LED11
		SZB		STATUS,C				;else LED11_ON;	L736
		SETB	LED11
		JP		END_BRATH_DETECT
BAT_LOW:		
		SNZB	FLASH_TIME_0			;if(flash_time&0x01) LED11_OFF;	L730
		CLRB	LED11
		SZB		FLASH_TIME_0			;else LED11_ON;	L731
		SETB	LED11
		JP		END_BRATH_DETECT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
BRATH_TIME_LESS2:						;else if(brath_time<2)	L739
		LD		A,BRATH_TIME
		HSUBIA	D'2'
		SZB		STATUS,C				
		JP		BRATH_TIME_LESS3
		SZB		F_BAT_LOW				;if((f_bat_low)||(f_low_3v))	L741
		JP		BAT_LOW1
		SZB		F_LOW_3V
		JP		BAT_LOW1
		CLRB	LED11
		JP		LED_TIME_JUD
BAT_LOW1:
		SNZB	FLASH_TIME_0
		CLRB	LED11
		SZB		FLASH_TIME_0
		SETB	LED11
LED_TIME_JUD:							;if(led_on_time>led_time)	L747
		LD		A,LED_TIME
		HSUBA	LED_ON_TIME
		SNZB	STATUS,C
		JP		LED_ON_JUD
		SETB	LED6
		SETB	LED7
		SETB	LED8
		SETB	LED9
		SETB	LED10
		JP		END_BRATH_DETECT
LED_ON_JUD:
		LD		A,SPEED
		XORIA	01H
		SZB		STATUS,Z				;if(speed==1) LED6_ON;
		JP		LED6_ON1
		LD		A,SPEED
		XORIA	02H
		SZB		STATUS,Z				;else if(speed==2) LED7_ON;
		JP		LED7_ON1
		LD		A,SPEED
		XORIA	03H
		SZB		STATUS,Z				;else if(speed==3) LED8_ON;
		JP		LED8_ON1
		LD		A,SPEED
		XORIA	04H
		SZB		STATUS,Z				;else if(speed==4) LED9_ON;
		JP		LED9_ON1
		LD		A,SPEED
		XORIA	05H
		SZB		STATUS,Z				;else if(speed==5) LED10_ON;
		JP		LED10_ON1
		JP		END_BRATH_DETECT
LED6_ON1:
		CLRB	LED6
		JP		END_BRATH_DETECT
LED7_ON1:
		CLRB	LED7
		JP		END_BRATH_DETECT
LED8_ON1:
		CLRB	LED8
		JP		END_BRATH_DETECT
LED9_ON1:
		CLRB	LED9
		JP		END_BRATH_DETECT
LED10_ON1:
		CLRB	LED10
		JP		END_BRATH_DETECT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BRATH_TIME_LESS3:						;else if(brath_time<3)	L764
		LD		A,BRATH_TIME
		HSUBIA	D'3'
		SZB		STATUS,C
		JP		BRATH_TIME_ELSE
		SZB		F_BAT_LOW				;if((f_bat_low)||(f_low_3v))	L766
		JP		BAT_LOW2
		SZB		F_LOW_3V
		JP		BAT_LOW2
		CLRB	LED11
		JP		LED_TIME_JUD1
BAT_LOW2:
		SNZB	FLASH_TIME_0
		CLRB	LED11
		SZB		FLASH_TIME_0
		SETB	LED11
LED_TIME_JUD1:							;if(led_on_time>led_time)	L772
		LD		A,LED_TIME
		HSUBA	LED_ON_TIME
		SNZB	STATUS,C
		JP		LED_ON_JUD1
		SETB	LED6
		SETB	LED7
		SETB	LED8
		SETB	LED9
		SETB	LED10
		JP		END_BRATH_DETECT
LED_ON_JUD1:
		CLRB	LED6
		CLRB	LED7
		CLRB	LED8
		CLRB	LED9
		CLRB	LED10
		JP		END_BRATH_DETECT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BRATH_TIME_ELSE:						;else		L789
		CLRB	LED6
		CLRB	LED7
		CLRB	LED8
		CLRB	LED9
		CLRB	LED10
		SZB		F_BAT_LOW				;if((f_bat_low)||(f_low_3v))	L796
		JP		BAT_LOW3
		SZB		F_LOW_3V
		JP		BAT_LOW3
		CLRB	LED11
		JP		END_BRATH_DETECT
BAT_LOW3:
		SNZB	FLASH_TIME_0
		CLRB	LED11
		SZB		FLASH_TIME_0
		SETB	LED11
END_BRATH_DETECT:
		JP		WORK_DISPOSAL			;if(f_onoff)	L814
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LED_DISPLAY_JUD:						;else	L804-812
		SZB		LED_BUF_0
		CLRB	LED6
		SZB		LED_BUF_1
		CLRB	LED7
		SZB		LED_BUF_2
		CLRB	LED8
		SZB		LED_BUF_3
		CLRB	LED9
		SZB		LED_BUF_4
		CLRB	LED10
		SZB		LED_BUF_5
		CLRB	LED11
;-----------------------------------------------------;
WORK_DISPOSAL:							
		SZB		F_ONOFF
		JP		POW_ON					;if(f_onoff)	L814
		JP		POW_OFF					;else	L844
POW_OFF:
		CLR		MOTOAB_OUT_TIME
		CLR		WORK_TIME
		CLR		MOTOAB_OUT_TIME
		CLR		MOTOAB_STOP_TIME
		CLRB	OUT_MOTA
		CLRB	OUT_MOTB
		JP		END_WORK_DISPOSAL
POW_ON:
		INCR	MOTO_OUT_TIME
		CLR		SLEEP_DELAY
		
		LD		A,MOTOAB_OUT_TIME		;motoa_out_time=motoab_out_time;	L818
		LD		MOTO_OUT_TIME,A
		
		LD		A,MOTOAB_STOP_TIME		;motoa_sleep_time=motoa_out_time+motoab_stop_time;	L819
		ADDA	MOTOA_OUT_TIME
		LD		MOTOA_SLEEP_TIME,A
		
		LD		A,MOTOAB_OUT_TIME		;motob_out_time=motoa_sleep_time+motoab_out_time;	L820
		ADDA	MOTOA_SLEEP_TIME
		LD		MOTOB_OUT_TIME,A
		
		LD		A,MOTOAB_STOP_TIME		;motob_sleep_time=motob_out_time+motoab_stop_time;	L821
		ADDA	MOTOB_OUT_TIME
		LD		MOTOB_SLEEP_TIME,A
		
		LD		A,MOTOB_SLEEP_TIME
		HSUBA	MOTO_OUT_TIME
		SNZB	STATUS,C
		CLR		MOTO_OUT_TIME			;if(moto_out_time>motob_sleep_time) moto_out_time=0;	L822
		LD		A,MOTOA_OUT_TIME
		HSUBA	MOTO_OUT_TIME
		SZB		STATUS,C
		JP		MOTA_ON
		LD		A,MOTOA_SLEEP_TIME
		HSUBA	MOTO_OUT_TIME
		SZB		STATUS,C
		JP		MOTO_OFF
		LD		A,MOTOB_OUT_TIME
		HSUBA	MOTO_OUT_TIME
		SZB		STATUS,C
		JP		MOTB_ON
		JP		MOTO_OFF
MOTA_ON:
		SETB	OUT_MOTA
		CLRB	OUT_MOTB
		JP		END_WORK_DISPOSAL
MOTO_OFF:
		CLRB	OUT_MOTA
		CLRB	OUT_MOTB
		JP		END_WORK_DISPOSAL
MOTB_ON:
		CLRB	OUT_MOTA
		SETB	OUT_MOTB		
END_WORK_DISPOSAL:
;-----------------------------------------------------;
INT_EXIT:
POP:	
		SWAPA	STATUS_BAK				;恢复现场
		LD		STATUS,A
		SWAPR	ACC_BAK
		SWAPA	ACC_BAK
		RETI
;*****************************************************;		
RESET:
		CLRWDT
		CLRB	INTCON,GIE				;关闭全局中断
		CLRB	INTCON,PEIE				;关闭外设中断
POWER_ON_DELAY:							;上电延迟100us
		INCR	POWER_DELAY
		LD		A,POWER_DELAY
		HSUBIA	D'100'
		SNZB	STATUS,C
		JP		POWER_ON_DELAY
		CLR		POWER_DELAY
;----------------------端口赋值-----------------------;
		LDIA	B'11000000'				;PA0/1/2/3作输出
		LD		TRISA,A
		LDIA	B'11001111'				;SW_POWER--PB3
		LD		TRISB,A					;PB4/5作输出,PB7/6/3作输入
		LDIA	B'00000000'				;PC1/2作输出
		LD		TRISC,A
		
		LDIA	B'00001111'				;PA	'XXXX PA3 PA2 PA1 PA0'
		LD		PORTA,A
		LDIA	B'01110000'				;PB	'PB7 PB6 PB5 PB4 PB3 XXX'
		LD		PORTB,A
		LDIA	B'00000000'				;PC
		LD		PORTC,A

		CLRB	OPTION_REG,NOT_RBPU
		LDIA	B'11001000'				;PORTB7/6/3上拉电阻置1
		LD		WPUB,A
;----------------------清寄存器-----------------------;				
CLR_RAM:
										;BANK0
		CLR		FSR
		LDIA	01FH
		LD		FSR,A
CLR_LOOP:
		INCR	FSR
		CLR		INDF
		LD		A,FSR
		HSUBIA	07FH					;有借位C=0
		SNZB	STATUS,C
		JP		CLR_LOOP
		CLR		INDF	
;---------------------中断初始化----------------------;
		CLRB	PIE1,TMR2IE				;禁止TMR2与PR2匹配中断
		CLRB	T2CON,TMR2ON			;禁止TIMER2
		CLRB	PIR1,TMR2IF				;清零TIMER2中断标志位
		CLR		TMR2					;清零TIMER2计数器
			
		LDIA	B'00000000'			
		LD		T2CON,A					;预分配1:1,后分频1:1
			
		LDIA	D'124'					;125us
		LD		PR2,A				
		CLRB	PIR1,TMR2IF				;清零TIMER2中断标志位
		SETB	INTCON,GIE				;使能全局中断
		SETB	INTCON,PEIE				;使能外设中断
		SETB	PIE1,TMR2IE				;使能TMR2与PR2匹配中断
		SETB	T2CON,TMR2ON			;使能TIMER2
		SETB	F_ONKEY
		
		
		
		
		
		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;		
;*******************************MAINLOOP**********************************;
;*******************************MAINLOOP**********************************;
;*******************************MAINLOOP**********************************;
;*******************************MAINLOOP**********************************;
MAINLOOP:
		SNZB	F_T2MS
		JP		ADC_PRC
		CLRB	F_T2MS
		CLRWDT
		CALL	DISPLAY
		CALL	TIMER_PRC
		CALL	SCANKEY
		CALL	TEMP_DATA_PRC
		JP		MAINLOOP
















;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
;********************************ADC_PRC***********************************;
ADC_PRC:
		LDIA	B'00111110'				;Fosc/8、内部基准电压1.2v、启动AD转换、禁止ADC中断
		LD		ADCON0,A
		CLR		WAIT_AD_TIME
		NOP
		NOP
		NOP
		NOP								;等5条指令时间
		NOP
ADC_DONE_DETECT:
		SZB		ADCON0,GO
		JP		ADC_DONE
		NOP
		LD		A,WAIT_AD_TIME
		HSUBIA	D'16'
		SNZB	STATUS,C
		JP		ADC_DONE_DETECT
		JP		END_ADC_PRC
ADC_DONE:
		LD		A,ADRESH
		ADDR	NTC_BUF
		INCR	NTC_NUM
		LD		A,NTC_NUM
		HSUBIA	D'8'
		SNZB	STATUS,C
		JP		END_ADC_PRC
		CLR		NTC_NUM
		RRCR	NTC_BUF
		RRCR	NTC_BUF
		RRCR	NTC_BUF
		LD		A,NTC_BUF
		LD		NTC_RAM,A
		CLR		NTC_BUF
END_ADC_PRC:
		JP		MAINLOOP
		
		
		
		
		
		
		
		
		
		
		
		
		
		
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
;********************************DISPLAY***********************************;
DISPLAY:
		INCR	LEDN					;LEDN=0--DISPLAY	1--SCANKEY
		LD		A,LEDN					;3--TEMP_DATA_PRC
		HSUBIA	D'5'					;4/5--NULL
		SZB		STATUS,C				;if(++ledn>=5) ledn=0;	L539
		CLR		LEDN
;-----------------------------------------------------;	
		LD		A,LEDN
		XORIA	00H
		SNZB	STATUS,Z				;if(ledn==0)	L540
		JP		END_DISPLAY
		CLR		LED_BUF
		SNZB	F_BAT_LOW				;L543
		JP		PART_JUD
		SNZB	F_ONOFF					;if((f_bat_low)&&(f_onoff))	L543
		JP		PART_JUD
		CLRB	F_ONOFF
		SETB	F_BRATH
		CLR		BRATH_TIME
		CLR		BRATH_CYCLE
;-----------------------------------------------------;
PART_JUD:
		SZB		F_ONOFF					
		JP		POWER_ON_JUD			;if(f_onoff)	L550
		SZB		F_ONKEY
		JP		F_ONKEY_JUD				;else if(f_onkey)	L578
		JP		END_DISPLAY
;-----------------------------------------------------;		
POWER_ON_JUD:		
		SZB		F_BAT_LOW
		JP		BAT_LOW_WORK
		SZB		F_LOW_3V				;if((f_bat_low)||(f_low_3v))	L552
		JP		BAT_LOW_WORK
		JP		WORK_DISPLAY
BAT_LOW_WORK:
		SETB	LED_BUF_5				;led_buf|=0x20;
		SNZB	FLASH_TIME_0			;if(flash_time&0x01) led_buf&=0xdf;	L555
		JP		WORK_DISPLAY
		LDIA	B'11011111'
		LD		LED_BUF,A
		CLRB	LED_BUF_5				;led_buf&=0xdf	L555
WORK_DISPLAY:							;switch(speed)	L557
		LD		A,SPEED
		XORIA	D'1'						;case 1:
		SZB		STATUS,Z
		JP		LED6_ON2
		
		LD		A,SPEED
		XORIA	D'2'						;case 2:
		SZB		STATUS,Z
		JP		LED7_ON2
		
		LD		A,SPEED
		XORIA	D'3'						;case 3:
		SZB		STATUS,Z
		JP		LED8_ON2
		
		LD		A,SPEED
		XORIA	D'4'						;case 4:
		SZB		STATUS,Z
		JP		LED9_ON2
		
		LD		A,SPEED
		XORIA	D'5'						;case 5:
		SZB		STATUS,Z
		JP		LED10_ON2
		JP		END_POWER_ON_JUD
LED6_ON2:
		SETB	LED_BUF_0
		JP		END_POWER_ON_JUD
LED7_ON2:
		SETB	LED_BUF_1
		JP		END_POWER_ON_JUD
LED8_ON2:
		SETB	LED_BUF_2
		JP		END_POWER_ON_JUD
LED9_ON2:
		SETB	LED_BUF_3
		JP		END_POWER_ON_JUD
LED10_ON2:
		SETB	LED_BUF_4
END_POWER_ON_JUD:
		JP		END_DISPLAY
;-----------------------------------------------------;
F_ONKEY_JUD:
		LD		A,KEY_DELAY
		HSUBIA	D'4'
		SNZB	STATUS,C
		JP		F_ONKEY_JUD1
		LD		A,OFF_SPEED_BUF
		XORA	OFF_SPEED
		SZB		STATUS,Z				;if((key_delay>3)&&(off_speed!=off_speed_buf)) led_buf|=0x1f;
		JP		F_ONKEY_JUD1
		LDIA	B'00011111'				;led_buf|=0x1f;
		LD		LED_BUF,A
		JP		END_DISPLAY
F_ONKEY_JUD1:
		LD		A,OFF_SPEED_BUF
		HSUBA	OFF_SPEED
		SNZB	STATUS,C
		JP		F_ONKEY_JUD2
		LD		A,OFF_SPEED
		XORIA	01H
		SNZB	STATUS,Z				;else if((off_speed_buf>off_speed)&&(off_speed==1))	L581
		JP		F_ONKEY_JUD2
		LDIA	B'00011111'				;led_buf|=0x1f;
		LD		LED_BUF,A
		JP		END_DISPLAY
F_ONKEY_JUD2:
		LD		A,OFF_SPEED_BUF
		HSUBA	OFF_SPEED
		SZB		STATUS,C				;else if((off_speed_buf<off_speed)&&(off_speed==5))	L585
		JP		F_ONKEY_JUD3
		LD		A,OFF_SPEED
		XORIA	05H
		SNZB	STATUS,Z
		JP		F_ONKEY_JUD3
		LDIA	B'00011111'				;led_buf|=0x1f;
		LD		LED_BUF,A
		JP		END_DISPLAY
F_ONKEY_JUD3:							;switch(off_speed)	L591
		LD		A,OFF_SPEED
		XORIA	D'1'						;case 1:
		SZB		STATUS,Z
		JP		OFF_SPEED1
		
		LD		A,OFF_SPEED
		XORIA	D'2'						;case 2:
		SZB		STATUS,Z
		JP		OFF_SPEED2
		
		LD		A,OFF_SPEED
		XORIA	D'3'						;case 3:
		SZB		STATUS,Z
		JP		OFF_SPEED3
		
		LD		A,OFF_SPEED
		XORIA	D'4'						;case 4:
		SZB		STATUS,Z
		JP		OFF_SPEED4
		
		LD		A,OFF_SPEED
		XORIA	D'5'						;case 5:
		SZB		STATUS,Z
		JP		OFF_SPEED5
		JP		END_DISPLAY
OFF_SPEED1:
		SETB	LED_BUF_0
		JP		END_DISPLAY
OFF_SPEED2:
		SETB	LED_BUF_1
		JP		END_DISPLAY
OFF_SPEED3:
		SETB	LED_BUF_2
		JP		END_DISPLAY
OFF_SPEED4:
		SETB	LED_BUF_3
		JP		END_DISPLAY
OFF_SPEED5:
		SETB	LED_BUF_4
END_DISPLAY:
		RET
		
		
		
		
		
		
		
		
		
		
		
		
		
		
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
;*********************************TIMER_PRC***********************************;
TIMER_PRC:
		INCR	FLASH_TIME1
		LD		A,FLASH_TIME1
		HSUBIA	D'150'					;if(++flash_time1>=150)
		SNZB	STATUS,C
		JP		END_FLASH_TIME1_JUD
		CLR		FLASH_TIME1
		INCR	FLASH_TIME
END_FLASH_TIME1_JUD:
		SZB		F_CHARG
		JP		CHARG_DETECT1
		SZB		F_BRATH
		JP		BRATH_DETECT1
		JP		TIME_500MS_JUD
;-----------------------------------------------------;
CHARG_DETECT1:		
		INCR	BRATH_TIME1
		LD		A,BRATH_TIME1
		HSUBIA	D'2'					;if(++brath_time1>=5)
		SNZB	STATUS,C
		JP		END_CHARG_DETECT1
		CLR		BRATH_TIME1
		INCR	BRATH_CYCLE
		
		LD		A,BRATH_CYCLE
		HSUBIA	D'255'					
		SNZB	STATUS,C
		JP		BRATH_CYCLE_HIG_JUD
		CLR		BRATH_CYCLE
		SETB	F_BRATH_CYCLE_HIG
BRATH_CYCLE_HIG_JUD:
		SNZB	F_BRATH_CYCLE_HIG
		JP		LED_ON_TIME_ADD
		LD		A,BRATH_CYCLE
		HSUBIA	D'196'					;if(brath_cycle<=450)
		SNZB	STATUS,C
		JP		LED_ON_TIME_ADD
		
		LD		A,BRATH_CYCLE
		HSUBIA	D'246'					;if(brath_cycle<=500)
		SNZB	STATUS,C
		JP		LED_ON_TIME_SUB
		
		CLR		BRATH_CYCLE				;else	brath_cycle=0;
		CLRB	F_BRATH_CYCLE_HIG		;同时清零高位标志
		JP		END_CHARG_DETECT1
LED_ON_TIME_ADD:
		LD		A,LED_ON_TIME
		HSUBIA	D'40'					;if(led_on_time<40)
		SNZB	STATUS,C
		INCR	LED_ON_TIME
		JP		END_CHARG_DETECT1
LED_ON_TIME_SUB:
		LD		A,LED_ON_TIME
		HSUBIA	D'1'					;if(led_on_time>=1)
		SZB		STATUS,C
		DECR	LED_ON_TIME
END_CHARG_DETECT1:
		JP		TIME_500MS_JUD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BRATH_DETECT1:
		SNZB	F_BRATH
		JP		END_BRATH_DETECT1
		INCR	BRATH_TIME1
		LD		A,BRATH_TIME1
		HSUBIA	D'2'					;if(++brath_time1>=5)
		SNZB	STATUS,C
		JP		END_BRATH_DETECT1
		CLR		BRATH_TIME1
		INCR	BRATH_CYCLE
		LD		A,BRATH_CYCLE
		HSUBIA	D'51'					;if(brath_cycle<=50)
		SNZB	STATUS,C
		JP		BRATH_TIME_ADD
		LD		A,BRATH_CYCLE
		HSUBIA	D'101'					;else if(brath_cycle<=100)
		SNZB	STATUS,C
		JP		BRATH_TIME_SUB
		CLR 	BRATH_CYCLE
		JP		END_BRATH_DETECT1
BRATH_TIME_ADD:
		LD		A,LED_ON_TIME
		HSUBIA	D'40'					;if(led_on_time<40)
		SNZB	STATUS,C
		INCR	LED_ON_TIME	
		LD		A,BRATH_CYCLE
		XORIA	D'50'					;if(brath_cycle==50)
		SNZB	STATUS,Z
		JP		END_BRATH_DETECT1
		INCR	BRATH_TIME
		LD		A,BRATH_TIME
		HSUBIA	D'5'					;if(brath_time>=5)
		SNZB	STATUS,C
		JP		END_BRATH_DETECT1
		CLRB	F_BRATH
		CLR		BRATH_TIME
		JP		END_BRATH_DETECT1
BRATH_TIME_SUB:
		LD		A,LED_ON_TIME
		HSUBIA	D'1'
		SZB		STATUS,C
		DECR	LED_ON_TIME
		LD		A,BRATH_CYCLE
		XORIA	D'100'
		SNZB	STATUS,Z
		JP		END_BRATH_DETECT1
		INCR	BRATH_TIME
		LD		A,BRATH_TIME
		HSUBIA	D'5'					;if(brath_time>=5)
		SNZB	STATUS,C
		JP		END_BRATH_DETECT1
		CLRB	F_BRATH
		CLR		BRATH_TIME	
END_BRATH_DETECT1:
;-----------------------------------------------------;
TIME_500MS_JUD:
		INCR	TIME_500MS
		LD		A,TIME_500MS
		HSUBIA	D'250'					;500ms
		SNZB	STATUS,C
		JP		END_TIME500MS_JUD
		CLR		TIME_500MS
		INCR	TIME_SEC
		INCR	WORK_TIME				;每500ms+1
		SNZB	F_ONOFF
		JP		TIMESEC_JUD
		LD		A,WORK_TIME
		HSUBIA	D'120'		;2mins		;if((f_onoff)&&(++work_time>=240)
		SNZB	STATUS,C
		JP		TIMESEC_JUD
		CLRB	F_ONOFF
		SETB	F_BRATH
		CLR		BRATH_TIME
		CLR		BRATH_CYCLE
		CLR		LED_ON_TIME
TIMESEC_JUD:
		LD		A,TIME_SEC
		HSUBIA	D'2'					;if(++time_sec>=4)	1s计时
		SNZB	STATUS,C
		JP		END_TIME500MS_JUD
		CLR		TIME_SEC
		INCR	SLEEP_DELAY
		LD		A,SLEEP_DELAY
		HSUBIA	D'1'					;if(++sleep_delay>=2)	L412
		SNZB	STATUS,C
		JP		END_TIME500MS_JUD
		CLRB	INTCON,GIE				;关闭全局中断
		CLRB	PIE1,TMR2IE				;禁止TMR2与PR2匹配中断
		CLRB	T2CON,TMR2ON			;禁止TIMER2
		CLRB	PIR1,TMR2IF				;清零TIMER2中断标志位
		CLR		TMR2					;清零TIMER2计数器
		
		LDIA	B'11110000'
		LD		TRISA,A
		LDIA	B'10001111'				;PORTB,6置输出(VDD_PIN)	0输出,1输入
		LD		TRISB,A					;11001111-->10001111
		
		LDIA	B'00001111'
		LD		PORTA,A
		LDIA	B'00110000'				;PORTB,6置0	
		LD		PORTB,A					;01110000-->00110000
		
		CLRB	OPTION_REG,NOT_RBPU
		LDIA	B'10001000'				;取消PORTB,6上拉电阻
		LD		WPUB,A
		
		CLRWDT
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
		LDIA	B'11110000'				;Refurbish_Sfr();	L428
		LD		TRISA,A
		LDIA	B'11001111'				;PORTB,6置输入(VDD_PIN)
		LD		TRISB,A		
		LDIA	B'00001111'
		LD		PORTA,A
		LDIA	B'01110000'				;PORTB,6置1
		LD		PORTB,A
		
		CLRB	OPTION_REG,NOT_RBPU
		LDIA	B'11001000'				;使能PORTB/6/3上拉电阻
		LD		WPUB,A
		
		LDIA	B'00001000'			
		LD		T2CON,A					;预分配1:1,后分频1:1	
		LDIA	D'124'					;125us
		LD		PR2,A				
		CLRB	PIR1,TMR2IF				;清零TIMER2中断标志位
		SETB	INTCON,GIE				;使能全局中断
		SETB	INTCON,PEIE				;使能外设中断(TMR2匹配中断和ADC中断为外设中断)
		SETB	PIE1,TMR2IE				;使能TMR2与PR2匹配中断
		SETB	T2CON,TMR2ON			;使能TIMER2
		CLR		SLEEP_DELAY
END_TIME500MS_JUD:
;-----------------------------------------------------;
; VDD_PIN_JUD:
		; SNZB	VDD_PIN					;if(VDD_PIN)
		; JP		NO_VDD_PIN
		; CLR		NO_CHARG_TIME
		; INCR	ON_CHARG_TIME
		; LD		A,ON_CHARG_TIME
		; HSUBIA	D'100'
		; SNZB	STATUS,C				;if(++on_charg_time>=100)
		; JP		END_VDD_PIN_JUD
		; SETB	F_CHARG
		; SZB		F_ONOFF					;if(f_onoff)	f_onoff=0;
		; CLRB	F_ONOFF					
		; JP		END_VDD_PIN_JUD
; NO_VDD_PIN:
		; CLR		ON_CHARG_TIME
		; INCR	NO_CHARG_TIME
		; LD		A,NO_CHARG_TIME
		; HSUBIA	D'100'
		; SZB		STATUS,C				;if(++no_charg_time>=100)
		; CLRB	F_CHARG
; END_VDD_PIN_JUD:
;-----------------------------------------------------;
; CHARG_PIN_JUD:
		; SNZB	CHARG_PIN				;if(CHAGE_PIN)
		; JP		NOT_FULL1
		; CLR		NO_FULL_TIME
		; INCR	FULL_TIME
		; LD		A,FULL_TIME
		; HSUBIA	D'200'
		; SZB		STATUS,C				;if(++full_time>=200) f_full=1;
		; SETB	F_FULL
		; JP		END_CHARG_PIN_JUD
; NOT_FULL1:
		; CLR		FULL_TIME
		; SZB		F_ONOFF					;if(f_onoff)	f_onoff=0;
		; CLRB	F_ONOFF					
		; INCR	NO_FULL_TIME
		; HSUBIA	D'201'
		; SZB		STATUS,C				;if(++no_full_time>200) f_full=0;
		; CLRB	F_FULL
; END_CHARG_PIN_JUD:
;-----------------------------------------------------;
WORK_ONOFF_JUD:
		SZB		F_ONOFF
		JP		WORK_ON
		CLR		PULSE_TIME
		JP		END_WORK_ONOFF_JUD
WORK_ON：								;每工作30秒停顿一下
		INCR	PULSE_TIME
		LD		A,WORK_TIME
		XORIA	D'30'
		SZB		STATUS,Z
		JP		MOTO_STOP
		LD		A,WORK_TIME
		XORIA	D'60'
		SZB		STATUS,Z
		JP		MOTO_STOP
		LD		A,WORK_TIME
		XORIA	D'90'					;if((work_time==120)||(work_time==240)||(work_time==360))
		SZB		STATUS,Z
		JP		MOTO_STOP
		JP		WORK_MODE2				;else if(speed==2)
MOTO_STOP:
		CLR		MOTOAB_OUT_TIME
		CLR		MOTOAB_STOP_TIME
		JP		END_WORK_ONOFF_JUD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WORK_MODE2:								;speed==2
		LD		A,SPEED
		XORIA	02H
		SNZB	STATUS,Z				;else if(speed==2)	L471
		JP		WORK_MODE3
		LD		A,PULSE_TIME
		HSUBIA	D'125'
		SNZB	STATUS,C				;if(pulse_time>=125)	L473
		JP		END_WORK_MODE2
		CLR		PULSE_TIME
		LD		A,MOTOAB_OUT_TIME
		HSUBA	MOTOAB_OUT_MAX
		SNZB	STATUS,C				;if(motoab_out_time>=motoab_out_max)	L476
		JP		SET_OUT_TIME
		LD		A,MOTOAB_OUT_MIN
		LD		MOTOAB_OUT_TIME,A
		LDIA	D'12'
		LD		MOTOAB_STOP_TIME,A
		JP		END_WORK_MODE2
SET_OUT_TIME:							;else			L481
		LD		A,MOTOAB_OUT_MAX
		LD		MOTOAB_OUT_TIME,A
		LDIA	D'8'
		LD		MOTOAB_STOP_TIME,A
END_WORK_MODE2:
		JP		END_TIMER_PRC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WORK_MODE3:								;speed==3
		LD		A,SPEED
		XORIA	03H
		SNZB	STATUS,Z				;else if(speed==3)		L488
		JP		WORK_MODE4
		LD		A,PULSE_TIME
		HSUBIA	D'17'
		SNZB	STATUS,C				;if(pulse_time>=17)		L490
		JP		END_WORK_MODE3
		CLR		PULSE_TIME
		LD		A,MOTOAB_OUT_TIME
		HSUBA	MOTOAB_OUT_MAX
		SNZB	STATUS,C				;if(motoab_out_time>=motoab_out_max)
		JP		SET_OUT_TIME1
		LD		A,MOTOAB_OUT_MIN
		LD		MOTOAB_OUT_TIME,A
		LDIA	D'8'
		LD		MOTOAB_STOP_TIME,A
		JP		END_WORK_MODE3
SET_OUT_TIME1:							;else
		LD		A,MOTOAB_OUT_MAX
		LD		MOTOAB_OUT_TIME,A
		LDIA	D'6'
		LD		MOTOAB_STOP_TIME,A
END_WORK_MODE3:
		JP		END_TIMER_PRC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WORK_MODE4:								;speed==4
		LD		A,SPEED
		XORIA	04H
		SNZB	STATUS,Z				;else if(speed==4)
		JP		WORK_MODE_ELSE
		LD		A,PULSE_TIME
		HSUBIA	D'226'					;if(pulse_time<=225)
		SZB		STATUS,C
		JP		PULSE_TIME_OVER225
		LD		A,MOTOAB_OUT_MIN
		LD		MOTOAB_OUT_TIME,A
		LDIA	D'8'
		LD		MOTOAB_STOP_TIME,A
		JP		END_WORK_MODE4
PULSE_TIME_OVER225:
		LD		A,PULSE_TIME
		HSUBIA	D'251'					;else if(pulse_time<=250)
		SZB		STATUS,C
		JP		PULSE_TIME_OVER250
		CLR		MOTOAB_OUT_TIME
		CLR		MOTOAB_STOP_TIME
		JP		END_WORK_MODE4
PULSE_TIME_OVER250:						;else	L517
		CLR		PULSE_TIME
END_WORK_MODE4:
		JP		END_TIMER_PRC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
WORK_MODE_ELSE:							;else	L522
		LD		A,MOTOAB_OUT_MIN
		LD		MOTOAB_OUT_TIME,A
		LD		A,SPEED
		XORIA	01H
		SZB		STATUS,Z				;if(speed==1) motoab_stop_time=10;
		JP		SET_STOP_TIME
		LDIA	D'13'
		LD		MOTOAB_STOP_TIME,A		;else motoab_stop_time=13;
		JP		END_WORK_ONOFF_JUD
SET_STOP_TIME:
		LDIA	D'10'
		LD		MOTOAB_STOP_TIME,A
END_WORK_ONOFF_JUD:
;-----------------------------------------------------;	
END_TIMER_PRC:
		RET
		
		
		
		
		
		
		
		
		
		
		
		
		
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 SCANKEY               					;
;                       		  SCANKEY                         			;
;                                 SCANKEY               					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
;*********************************SCANKEY***********************************;
SCANKEY:
		LD		A,LEDN
		XORIA	01H
		SNZB	STATUS,Z				;if(ledn==1)	L226
		JP		END_SCANKEY
		LDIA	B'11001111'
		LD		TRISB,A
		CLRB	OPTION_REG,NOT_RBPU
		LDIA	B'11001000'				;使能PORTB7/6/3上拉电阻
		LD		WPUB,A
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
		CLR		KEY_VALUE
		SNZB	SW_POWER				;if(!SW_POWER) key_value|=0x01;	L231
		SETB	KEY_VALUE,0
		LD		A,KEY_VALUE0
		XORA	KEY_VALUE				;if(key_value!=key_value0)	L232
		SZB		STATUS,Z
		JP		KEY_VALUE_SAME			;else	L237
		LD		A,KEY_VALUE
		LD		KEY_VALUE0,A
		CLR		KEY_DELAY
		JP		END_SCANKEY
KEY_VALUE_SAME:
		LD		A,KEY_DELAY
		HSUBIA	D'3'
		SNZB	STATUS,C				;if(key_delay>=3)	L239
		JP		END_KEY_PRESSING
		SNZB	KEY_VALUE,0				;if(key_value)	L241
		JP		KEY_VALUE_NULL
		CLR		SLEEP_DELAY
		SZB		F_ONKEY					;if(!f_onkey)	L244
		JP		LONG_PRESSING_JUD
		LD		A,KEY_VALUE			
		XORIA	01H
		SNZB	STATUS,Z				;if(key_value==0x01)	L246
		JP		END_SCANKEY
		SETB	F_ONKEY
		CLR		KEY_DELAY1
		SNZB	F_ONOFF					;if(!f_onoff) f_power_key=1;	L250
		SETB	F_POWER_KEY
		SZB		F_ONOFF					;else Key_power();	L251
		CALL	KEY_POWER				
		JP		END_SCANKEY
LONG_PRESSING_JUD:						;else	L254
		SZB		F_ONOFF
		JP		END_SCANKEY
		INCR	KEY_DELAY1
		LD		A,KEY_DELAY1
		HSUBIA	D'100'
		SNZB	STATUS,C
		JP		END_SCANKEY
		SZB		F_OFF_SET				;if((!f_onoff)&&(++key_delay1>=200)&&(!f_off_set))	L256
		JP		END_SCANKEY
		CLRB	F_POWER_KEY
		LDIA	D'75'
		LD		KEY_DELAY1,A
		LD		A,OFF_SPEED_BUF
		XORIA	00H
		SZB		STATUS,Z				;if(off_speed_buf==0)	L260
		JP		OFF_SPEED_BUF_ZERO
		
		LD		A,OFF_SPEED_BUF
		XORIA	06H
		SZB		STATUS,Z				;if(off_speed_buf==6)	L270
		JP		OFF_SPEED_BUF_SIX
		JP		END_SCANKEY
OFF_SPEED_BUF_ZERO:
		INCR	OFF_SPEED
		LD		A,OFF_SPEED
		HSUBIA	D'6'
		SNZB	STATUS,C				;if(off_speed>=6)	L263
		JP		END_SCANKEY
		LDIA	D'6'
		LD		OFF_SPEED,A
		LD		OFF_SPEED_BUF,A
		SETB	F_OFF_SET
		JP		END_SCANKEY
OFF_SPEED_BUF_SIX:
		LD		A,OFF_SPEED
		HSUBIA	D'1'
		SZB		STATUS,C				;if(off_speed>=1) off_speed--;	L272
		DECR	OFF_SPEED
		SZB		STATUS,C				;else		L273
		JP		END_SCANKEY
		CLR		OFF_SPEED
		CLR		OFF_SPEED_BUF
		SETB	F_OFF_SET
		JP		END_SCANKEY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
KEY_VALUE_NULL:
		SNZB	F_ONKEY					;else L283
		JP		END_SCANKEY
		INCR	KEY_DELAY
		LD		A,KEY_DELAY
		HSUBIA	D'5'
		SNZB	STATUS,C				;if((f_onkey)&&(++key_delay>=5))	L285
		JP		END_SCANKEY
		CLRB	F_ONKEY
		CLRB	F_OFF_SET
		CLR		KEY_DELAY1
		SZB		F_POWER_KEY
		JP		SHORT_KEY_PRESSING		;if(f_power_key)	L290		F_POWER_KEY=1短按键
		LD		A,OFF_SPEED_BUF
		XORA	OFF_SPEED
		SZB		STATUS,Z				;else if(off_speed!=off_speed_buf)	L295
		JP		END_KEY_VALUE_NULL
		LD		A,OFF_SPEED
		HSUBA	OFF_SPEED_BUF
		SZB		STATUS,C
		JP		SAVE_OFF_SPEED
		LD		A,OFF_SPEED
		HSUBIA	D'1'
		SNZB	STATUS,C				;if((off_speed_buf>off_speed)&&(off_speed>=1))	L297
		JP		SAVE_OFF_SPEED
		SETB	F_ONOFF
		LD		A,SPEED_BUF
		XORIA	00H						
		SNZB	STATUS,Z				;if(speed_buf==0) speed_buf=1;	L300
		JP		RESTORE_SPEED
		LDIA	D'1'
		LD		SPEED_BUF,A
RESTORE_SPEED:
		LD		A,SPEED_BUF
		LD		SPEED,A
		CALL	OUT_BUF_PRC				;L302
SAVE_OFF_SPEED:							;off_speed=off_speed_buf;	L304
		LD		A,OFF_SPEED_BUF
		LD		OFF_SPEED,A
END_KEY_VALUE_NULL:
		CLRB	F_POWER_KEY
		JP		END_SCANKEY
SHORT_KEY_PRESSING:
		CLRB	F_POWER_KEY
		CALL	KEY_POWER				;L293
		JP		END_SCANKEY
END_KEY_PRESSING:
		INCR	KEY_DELAY
END_SCANKEY:
		RET
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;		
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;
;*****************************KEY_POWER*********************************;
KEY_POWER:
		SZB		F_BAT_LOW
		JP		BAT_LOW_NOT_CHARG
		SZB		F_CHARG
		JP		BAT_LOW_NOT_CHARG					;if((!f_bat_low)&&(!f_charg))	L165
		SETB	F_OFF_SET
		SZB		F_ONOFF								;if(!f_onoff)	L168
		JP		PRESSING_AGAIN
		SETB	F_ONOFF
		LD		A,SPEED_BUF
		XORIA	00H
		SNZB	STATUS,Z
		JP		RESTORE_SPEED1
		LDIA	D'1'
		LD		SPEED_BUF,A
RESTORE_SPEED1:
		LD		A,SPEED_BUF
		LD		SPEED,A
		SZB		F_BRATH
		CLRB	F_BRATH
		JP		ONOFF_DETECT
PRESSING_AGAIN:
		LD		A,WORK_TIME
		HSUBIA	D'3'								;3S内再次按键换挡
		SZB		STATUS,C
		JP		STOP_WORKING						;大于3S后按键停止工作
CHANGE_SPEED:										;else if(work_time<=16)	L178
		INCR	SPEED
		LD		A,SPEED
		HSUBIA	D'6'
		SNZB	STATUS,C
		JP		END_CHANGE_SPEED
		LDIA	D'1'
		LD		SPEED,A
		CLRB	F_ONOFF
		SETB	F_BRATH
		CLR		BRATH_TIME
		CLR		BRATH_CYCLE
		CLR		LED_ON_TIME
END_CHANGE_SPEED:		
		LD		A,SPEED
		LD		SPEED_BUF,A
		CLR		WORK_TIME
		JP		ONOFF_DETECT
STOP_WORKING:										;else	L193
		CLRB	F_ONOFF
		SETB	F_BRATH
		CLR		BRATH_TIME
		CLR		BRATH_CYCLE
		CLR		LED_ON_TIME
;-----------------------------------------------------;			
ONOFF_DETECT:										;if(f_onoff)	L201
		SNZB	F_ONOFF
		JP		STOP_ALL_MOTO
		CALL	OUT_BUF_PRC							;L203
		JP		END_KEY_POWER
STOP_ALL_MOTO:										;else	L205
		CLR		MOTOAB_OUT_TIME
		CLR		MOTOAB_STOP_TIME
		CLR		MOTOAB_OUT_MIN
		CLR		MOTOAB_OUT_MAX
		JP		END_KEY_POWER
;-----------------------------------------------------;		
BAT_LOW_NOT_CHARG:
		SNZB	F_BAT_LOW
		JP		END_KEY_POWER
		SZB		F_BRATH
		JP		END_KEY_POWER
		SZB		F_CHARG
		JP		END_KEY_POWER
		CLRB	F_ONOFF
		SETB	F_BRATH
		CLR		BRATH_TIME
		CLR		BRATH_CYCLE
END_KEY_POWER:
		RET
		
		
		
		
		
		
		
		
		
		
		
		
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
;**************************OUT_BUF_PRC***************************;
OUT_BUF_PRC:										;L122
		LD		A,SPEED
		XORIA	01H
		SZB		STATUS,Z
		JP		MODE_SPEED_1
		LD		A,SPEED
		XORIA	02H
		SZB		STATUS,Z
		JP		MODE_SPEED_2
		LD		A,SPEED
		XORIA	03H
		SZB		STATUS,Z
		JP		MODE_SPEED_3
		LD		A,SPEED
		XORIA	04H
		SZB		STATUS,Z
		JP		MODE_SPEED_4
		LD		A,SPEED
		XORIA	05H
		SZB		STATUS,Z
		JP		MODE_SPEED_5
		JP		END_OUT_BUF_PRC
MODE_SPEED_1:
		LDIA	D'10'
		LD		MOTOAB_OUT_TIME,A
		LD		MOTOAB_STOP_TIME,A
		LD		MOTOAB_OUT_MIN,A
		LD		MOTOAB_OUT_MAX,A
		JP		END_OUT_BUF_PRC
MODE_SPEED_2:
		LDIA	D'8'
		LD		MOTOAB_OUT_TIME,A
		LD		MOTOAB_OUT_MIN,A
		LDIA	D'12'
		LD		MOTOAB_STOP_TIME,A
		LDIA	D'10'
		LD		MOTOAB_OUT_MAX,A
		JP		END_OUT_BUF_PRC		
MODE_SPEED_3:
		LDIA	D'12'
		LD		MOTOAB_OUT_TIME,A
		LD		MOTOAB_OUT_MAX,A
		LDIA	D'6'
		LD		MOTOAB_STOP_TIME,A
		LDIA	D'10'
		LD		MOTOAB_OUT_MIN,A
		JP		END_OUT_BUF_PRC
MODE_SPEED_4:
		LDIA	D'9'
		LD		MOTOAB_OUT_TIME,A
		LD		MOTOAB_OUT_MIN,A
		LD		MOTOAB_OUT_MAX,A
		LDIA	D'8'
		LD		MOTOAB_STOP_TIME,A
		JP		END_OUT_BUF_PRC
MODE_SPEED_5:
		LDIA	D'6'
		LD		MOTOAB_OUT_TIME,A
		LD		MOTOAB_OUT_MIN,A
		LD		MOTOAB_OUT_MAX,A
		LDIA	D'13'
		LD		MOTOAB_STOP_TIME,A
		JP		END_OUT_BUF_PRC
END_OUT_BUF_PRC:
		RET
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
;***********************TEMP_DATA_PRC***********************;
TEMP_DATA_PRC:
		LD		A,LEDN
		XORIA	03H
		SNZB	STATUS,Z
		JP		END_TEMP_DATA_PRC
		SNZB	F_CHARG
		JP		VDD_LOW
VDD_OVER3P7V:
		LD		A,NTC_RAM
		HSUBIA	D'84'
		SZB		STATUS,C
		JP		END_VDD_OVER3P7V
		INCR	BAT_HIG_TIME
		LD		A,BAT_HIG_TIME
		HSUBIA	D'10'
		SNZB	STATUS,C
		JP		VDD_LOW
		CLRB	F_BAT_LOW
		CLRB	F_LOW_3V
		JP		VDD_LOW
END_VDD_OVER3P7V:
		CLR		BAT_HIG_TIME
VDD_LOW:
		LD		A,NTC_RAM
		HSUBIA	D'110'
		SZB		STATUS,C
		JP		LESS_THAN2P8
		LD		A,NTC_RAM
		HSUBIA	D'103'
		SZB		STATUS,C
		JP		LESS_THAN3P0
		JP		WORK_NORMALLY
LESS_THAN2P8:		
		INCR	BAT_LOW_TIME
		LD		A,BAT_LOW_TIME
		HSUBIA	D'10'
		SZB		STATUS,C
		CLRB	F_BAT_LOW
		JP		END_TEMP_DATA_PRC
LESS_THAN3P0:		
		CLR		BAT_LOW_TIME
		INCR	LOW_3V_TIME
		LD		A,LOW_3V_TIME
		HSUBIA	D'10'
		SZB		STATUS,C
		CLRB	F_LOW_3V
		JP		END_TEMP_DATA_PRC
WORK_NORMALLY:
		CLR		BAT_LOW_TIME
		CLR		LOW_3V_TIME
END_TEMP_DATA_PRC:
		RET
		
		
		
		
		
		
		
		
;*****************************************************;
;*****************************************************;
;*****************************************************;
;*****************************************************;
		JP		RESET
		END
