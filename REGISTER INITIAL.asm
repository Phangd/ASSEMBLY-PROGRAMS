		CLR			FSRH				
		LDIA		2FH           ;末尾地址
		LD			FSRL,A				
CLR_RAM:
		CLR			INDF
		SZDECR		FSRL
		NOP				
		JP			CLR_RAM
		CLR			INDF
