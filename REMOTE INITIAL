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
		LD	    	A,TN		; >2ms
		HSUBIA		D'16'
		SZB  		STATUS,C
		JP	    	ERROR_REMOTE
		LD	    	A,TN
		HSUBIA		D'2'
		SNZB		STATUS,C
		JP	    	ERROR_REMOTE
		CLRB		CODE2,0
		LD	    	A,TN
		HSUBIA		D'7'		; 1ms?
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
