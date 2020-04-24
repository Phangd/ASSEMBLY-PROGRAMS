
; ----------------------------------------------------------------------------
; CMS89FXXX系列MCU触摸传数据程序
; 文 件 名：SendTouchKey_89F62x.asm
; 版    本：V0.3
; 修改日期：2020/02/27
; ----------------------------------------------------------------------------
; 使用说明：
; 1.在主函数中 #include "SendTouchKey_89F62x.h"以及 #include "SendTouchKey_89F62x.asm"
; 2.根据项目实际情况配置好触摸库参数
; 3.在主函数中持续调用"SEND_TOUCHKEY"函数
; 4.在SendTouchKey_89F62x.h 把触摸调试使能打开即可
; ----------------------------------------------------------------------------


;-------------------------------------------
; 函数名称：SEND_TOUCHKEY
; 函数功能：触摸传数据函数
; 入口参数：无
; 出口参数：无
; 备    注：
;-------------------------------------------
SEND_TOUCHKEY:
		CLRWDT
;---------------间隔一个主循环发送一次数据---------------		
		LDIA		0x02
		XORR		_FLAG
		SNZB		_F_DELAY
		JP			$+3
		CALL		DATA_INIT			;发送参数初始化
		JP			SEND_TOUCHKEY_BACK
;---------------与软件通讯规则为   0xA0+数据长度+数据掩码+按键数据+检验和------------------
		CALL		IIC_SEND_START		;发送起始信号
		LDIA		0xA0
		CALL		IIC_SEND_DATA		;建立连接的命令
;---------------数据长度为   数据头+按键数据+校验码---------------			
		LD			A,DATA_LENGTH
		LD			TK_CHECKSUM,A	
		CALL		IIC_SEND_DATA
;---------------数据掩码为   帧数+帧号+数据索引---------------		
		LD			A,DATA_MASK
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA
		LDIA		SEND_ID
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA	
;---------------循环发送数据---------------
SEND_LOOP:
		CLR			DATA_NUMBER			;清零数据编号
		CALL		GET_TKLIBRARY		;获取触摸库键值
		LD			A,SEND_DATA0L		;发送基准值低位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA	
		LD			A,SEND_DATA0H		;发送基准值高位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA		
	
		INCR		DATA_NUMBER
		CALL		GET_TKLIBRARY		;获取触摸库键值		
		LD			A,SEND_DATA0L		;发送滤波值低位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA	
		LD			A,SEND_DATA0H		;发送滤波值高位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA

	#ifdef	VOL_VALUE
		INCR		DATA_NUMBER
		CALL		GET_TKLIBRARY		;获取触摸库键值		
		LD			A,SEND_DATA0L		;发送噪声值低位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA	
		LD			A,SEND_DATA0H		;发送噪声值高位
		ADDR		TK_CHECKSUM
		CALL		IIC_SEND_DATA	
	#endif

		INCR		SEND_NUMBER			;发送数+1
		SZDECR		SURPLUS_NUMBER		;剩余数-1
		JP			SEND_LOOP			;发送未完成则继续发送
;---------------结束发码---------------	
		LD			A,TK_CHECKSUM		;发送校验和
		CALL		IIC_SEND_DATA		
		CALL		IIC_SEND_STOP
SEND_TOUCHKEY_BACK:
		RET


;-------------------------------------------
; 函数名称：DATA_INIT
; 函数功能：发送参数初始化
; 入口参数：无
; 出口参数：无
; 备    注：
;-------------------------------------------
DATA_INIT:	
		LDIA		FRAME_SIZE
		SUBA		FRAME_NUMBER
		SNZB		STATUS,C			;判断是否已经发完最后一帧
		JP			$+4
		CLR			SEND_NUMBER
		CLR			FRAME_NUMBER		;重新发送
		JP			$+2
		INCR		FRAME_NUMBER
;---------------尾帧判断---------------
		LDIA		FRAME_SIZE
		SUBA		FRAME_NUMBER
		SNZB		STATUS,C			;判断当前是否为最后一帧
		JP			$+5
;---------------最后一帧处理---------------		
		LDIA		LAST_NUMBER
		LD			SURPLUS_NUMBER,A	;设置发送个数
		LDIA		DATA_MINIMUM
		JP			SET_DATA
;---------------不是最后一帧处理---------------		
		LDIA		DATA_INTERVAL
		LD			SURPLUS_NUMBER,A
		LDIA		DATA_MAXIMUM
;---------------设置发送数据长度---------------			
SET_DATA:
		LD			DATA_LENGTH,A		;设置数据长度		
;---------------设置数据掩码 总帧数 + 帧号---------------	
		LDIA		FRAME_SIZE
		LD			DATA_MASK,A			;设置总帧数
		RLR			DATA_MASK
		RLR			DATA_MASK
		RLR			DATA_MASK
		RLR			DATA_MASK
		LD			A,FRAME_NUMBER		;设置帧号
		ORR			DATA_MASK

DATA_INIT_BACK:
		RET
			

;-------------------------------------------
; 函数名称：GET_TKLIBRARY
; 函数功能：获取触摸库键值
; 入口参数：
; 出口参数：
; 备	注：
;-------------------------------------------
GET_TKLIBRARY:
;---------------获取基准值---------------
GET_BASE_START：
		LDIA		.0
		SUBA		DATA_NUMBER
		SNZB		STATUS,Z
		JP			GET_BASE_END
		
	#ifdef	 VOL_VALUE
		LDIA		TK_K0BASEL			;获取EMC库基准值值数据	
		LD			_TK_ADDR,A
		LDIA		.2
		LD			_TK_ADDRSPACE,A		;设置地址查询间距为两倍	
	#else
		LDIA		TK_K0OLDL			;获取普通库基准值值数据	
		LD			_TK_ADDR,A		
		LDIA		.2
		LD			_TK_ADDRSPACE,A		;设置地址查询间距为两倍	
	#endif			
	
		CALL		GET_TKVALUE				
		LD			A,_TK_VALUEL
		LD			SEND_DATA0L,A	
		LD			A,_TK_VALUEH
		LD			SEND_DATA0H,A		
		JP			GET_TKLIBRARY_BACK
GET_BASE_END：
	
;---------------获取滤波值---------------
GET_WAVE_START：
		LDIA		.1
		SUBA		DATA_NUMBER
		SNZB		STATUS,Z
		JP			GET_WAVE_END

	#ifdef	 VOL_VALUE
		LDIA		TK_K0OLDL			;获取EMC库滤波值数据	
		LD			_TK_ADDR,A
		LDIA		.2
		LD			_TK_ADDRSPACE,A		;设置地址查询间距为两倍	
	#else
		LDIA		TK_K0DAT0L			;获取普通库滤波值数据	
		LD			_TK_ADDR,A
		LDIA		.6
		LD			_TK_ADDRSPACE,A		;设置地址查询间距为六倍			
	#endif
	
		CALL		GET_TKVALUE				
		LD			A,_TK_VALUEL
		LD			SEND_DATA0L,A	
		LD			A,_TK_VALUEH
		LD			SEND_DATA0H,A		
		JP			GET_TKLIBRARY_BACK		
GET_WAVE_END:
	
;---------------获取噪声值---------------
GET_NOISE_START:
		LDIA		.2
		SUBA		DATA_NUMBER
		SNZB		STATUS,Z
		JP			GET_NOISE_END

	#ifdef	VOL_VALUE					
		LDIA		TKL_K0DATL			;获取噪声值0数据		
		LD			_TK_ADDR,A	
		LDIA		.2
		LD			_TK_ADDRSPACE,A		;设置地址查询模式为两倍间距		
		CALL		GET_TKVALUE				
		LD			A,_TK_VALUEL
		LD			_TEMP0L,A	
		LD			A,_TK_VALUEH
		LD			_TEMP0H,A	

		LDIA		TKH_K0DATL			;获取噪声值1数据		
		LD			_TK_ADDR,A
		LDIA		.2
		LD			_TK_ADDRSPACE,A		;设置地址查询模式为两倍间距		
		CALL		GET_TKVALUE				
		LD			A,_TK_VALUEL
		LD			_TEMP1L,A	
		LD			A,_TK_VALUEH
		LD			_TEMP1H,A			
	
		CALL		ABS_VALUE_SUB		;获取噪声值
		LD			A,_TEMP1L
		LD			SEND_DATA0L,A	
		LD			A,_TEMP1H
		LD			SEND_DATA0H,A						
	#endif
GET_NOISE_END:

GET_TKLIBRARY_BACK:	
		RET
			

;-------------------------------------------
; 函数名称：GET_TKVALUE
; 函数功能：间接寻址获取触摸键值
; 入口参数：_TK_ADDR、_TK_ADDRSPACE
; 出口参数：_TK_VALUEL、_TK_VALUEH
; 备	注：
;-------------------------------------------
GET_TKVALUE:
	_TK_ADDR		EQU			?		;查询地址
	_TK_ADDRSPACE	EQU			?		;地址查询间隔
	_TK_VALUEL		EQU			?		;键值数据低位
	_TK_VALUEH		EQU			?		;键值数据高位
;---------------计算获取数据的地址---------------					
		LD			A,SEND_NUMBER		;当前查询序号
		LD			MULTIPLICAND,A		;赋予被乘数
		LD			A,_TK_ADDRSPACE
		LD			MULTIPLIER,A		;赋予乘数
		CALL		MULTIPLICATION_8BIT
		
		LD			A,_TK_ADDR
		ADDA		PRODUCT
		LD			_TK_ADDR,A
;---------------间接寻址获取按值数据---------------	
GET_TKDATA:
;---------------间接寻址获取键值低位---------------
		LD			A,_TK_ADDR
		LD			FSR,A
		CLRB		STATUS,IRP
		LD			A,INDF
		LD			_TK_VALUEL,A
;---------------间接寻址获取键值高位---------------		
		INCA		_TK_ADDR
		LD			FSR,A
		CLRB		STATUS,IRP
		LD			A,INDF
		LD			_TK_VALUEH,A
GET_TKVALUE_BACK:
		RET			


;-------------------------------------------
; 函数名称：ABS_VALUE_SUB
; 函数功能：绝对值减法
; 入口参数：_TEMP0L、_TEMP0H、_TEMP1L、_TEMP1H
; 出口参数：_TEMP1L、_TEMP1H
; 备	注：两个数据相减并输出绝对值
;-------------------------------------------
ABS_VALUE_SUB:
		_TEMP0L		EQU			?
		_TEMP0H		EQU			?
		_TEMP1L		EQU			?
		_TEMP1H		EQU			?
;---------------两个数相减---------------------	
		LD			A,_TEMP0L
		SUBR		_TEMP1L
		LD			A,_TEMP0H
		SNZB		STATUS,C
		DECR		_TEMP1H
		SUBR		_TEMP1H
;---------------取绝对值---------------------		
		SNZB		_TEMP1H,7			;判断数据最高位
		JP			ABS_VALUE_SUB_BACK
		COMR		_TEMP1L
		COMR		_TEMP1H
		INCR		_TEMP1L
		SZB			STATUS,Z
		INCR		_TEMP1H
ABS_VALUE_SUB_BACK:	
		RET

;-------------------------------------------
; 函数名称：MULTIPLICATION_8BIT
; 函数功能：8 x 8位乘法计数
; 入口参数：MULTIPLIER、MULTIPLICAND
; 出口参数：PRODUCT
; 备    注：返回8位结果
;-------------------------------------------	
MULTIPLICATION_8BIT:
		PRODUCT		 EQU		?		;结果返回值
		MULTIPLICAND EQU		?		;被乘数
		MULTIPLIER	 EQU		?		;乘数
		
		CLR			PRODUCT		
MULTIPLICATION_LOOP:
		LD			A,MULTIPLICAND
		SZB			MULTIPLIER,0
		ADDR		PRODUCT

		CLRB		STATUS,C		
		RLCR		MULTIPLICAND
		CLRB		STATUS,C
		RRCR		MULTIPLIER
		SZR			MULTIPLIER
		JP			MULTIPLICATION_LOOP
		RET				
		
	
;********************************************
;IIC通讯子程序
;********************************************
;-------------------------------------------
; 函数名称：IIC_SEND_START
; 函数功能：发送启动信号
; 入口参数：无
; 出口参数：无
; 备    注：SCL为高电平期间，SDA出现下降沿
;-------------------------------------------				
IIC_SEND_START:
		CLRB		IIC_SCL_IO			;将IIC数据时钟口设为输出口
		CLRB		IIC_SDA_IO
		CALL		IIC_DELAY			;延时一段时间
	
		SETB		IIC_SDA				;将SDA、SCL拉高，准备产生启动信号
		SETB		IIC_SCL
		CALL		IIC_DELAY
		CALL		IIC_DELAY
		CLRB		IIC_SDA				;将SDA拉低产生启动信号	
		
		CALL		IIC_DELAY
		CALL		IIC_DELAY
		CLRB		IIC_SCL				;将SCL拉低，完成启动信号操作
		
		RET

;-------------------------------------------
; 函数名称：IIC_SEND_STOP
; 函数功能：发送停止信号
; 入口参数：无
; 出口参数：无
; 备    注：SCL为高电平期间，SDA出现上升沿
;-------------------------------------------
IIC_SEND_STOP:
		CLRB		IIC_SCL_IO			;将IIC数据时钟口设为输出口
		CLRB		IIC_SDA_IO
		CALL		IIC_DELAY			;延时一段时间
	
		CLRB		IIC_SDA				;将SDA拉低，SCL拉高，准备产生停止信号
		SETB		IIC_SCL
		CALL		IIC_DELAY
		CALL		IIC_DELAY
		SETB		IIC_SDA				;将SDA拉高产生停止信号	
		
		CALL		IIC_DELAY
		CALL		IIC_DELAY
		CLRB		IIC_SCL				;将SCL拉低，完成停止信号操作
		
		RET						

;-------------------------------------------
; 函数名称：IIC_SEND_DATA
; 函数功能：模拟IIC主机发送8位数据
; 入口参数：_DATA
; 出口参数：返回ACK应答信号
; 备    注：ACK应答信号为SDA由高电平拉为低电平
;-------------------------------------------
IIC_SEND_DATA:
		_DATA		EQU			?
		_COUNT		EQU			?

		LD			_DATA,A
		LDIA		.8
		LD			_COUNT,A
		CLRB		IIC_SCL_IO			;将IIC数据时钟口设为输出口
		CLRB		IIC_SDA_IO
;---------------循环发送8位数据---------------			
IIC_SEND_MOVE_LOOP:					
		CLRB		IIC_SCL
		SZB			_DATA,7
		SETB		IIC_SDA	
		SNZB		_DATA,7
		CLRB		IIC_SDA
		
		SETB		IIC_SCL
		RLR			_DATA				;向左移一位
		NOP
		NOP	
		SZDECR		_COUNT
		JP			IIC_SEND_MOVE_LOOP
;---------------8位数据发送完成---------------		
		CLRB		IIC_SCL
		SETB		IIC_SDA_IO			;SDA作为输入接收ACK信号
		CALL		IIC_DELAY
		SETB 		IIC_SCL				;做个上升沿准备读应答信号
		CALL		IIC_DELAY
;---------------等待应答---------------			
		CLRB		_F_ACK
		SNZB		IIC_SDA
		SETB		_F_ACK		
		CLRB		IIC_SCL
		CLRB		IIC_SDA_IO
		
		RET
		
;---------------非精准延时---------------	
IIC_DELAY:
		JP			$+1
		JP			$+1
		JP			$+1		
		RET
