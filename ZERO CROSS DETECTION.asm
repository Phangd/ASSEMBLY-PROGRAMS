INIT_TIMER0:
			PUSH
			SNZB	INTRQ,TC0IRQ
			JP		EXIT_INT
			CLRB    INTRQ,TC0IRQ
;---------------- 1ms TIMER -------------------
TIMER0:									
			SZINCR	T1MS_TIMER
			NOP							
ENDTINT:
;----------------------------------------------
ZERO_PRC:
			LD		A,ZERO_CNT		
			HSUBIA		D'250'
			SNZB		STATUS,C
			SZINCR		ZERO_CNT			;随中断自增
			NOP
			SNZB		ZERO_PORT			;检测过零口高低电平
			JP		ZERO_NPULSE
ZERO_PPULSE:
			SZB		F_ZERO_RISE			;标志位，在过零口电平未改变时，恒为1
			JP		END_ZERO_PRC			;过零口电平未改变时，一直跳转到END_ZERO_PRC，不清ZERO_CNT
			SETB		F_ZERO_RISE			;F_ZERO_RISE为0时，将其置为1，防止清掉ZERO_CNT的值
			CLR		ZERO_CNT
			JP		END_ZERO_PRC
ZERO_NPULSE:
			SNZB		F_ZERO_RISE
			JP		END_ZERO_PRC
			CLRB		F_ZERO_RISE
			CLR		ZERO_CNT
			JP		END_ZERO_PRC
END_ZERO_PRC:
;----------------------------------------------
EXIT_INT:
			POP
			RETI
