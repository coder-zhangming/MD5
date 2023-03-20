module	MD5(

	input	[511:0]		i_data		,
	input				i_clk		,
	input				i_reset		,
	input				i_start		,
	input				last512		,
	output reg [127:0]	o_data		,
	output				o_fBusy		,
	output				o_fDone		);
	
	
	parameter	IDLE=2'd0,	RUN=2'd1,  DONE=2'd2;

	wire	[511:0]	data_endian_con_o	;
	wire	[31:0]	a_o					;
	wire	[31:0]	b_o					;
	wire	[31:0]	c_o					;
	wire	[31:0]	d_o					;
	wire	[31:0]	add_initial_a		;
	wire	[31:0]	add_initial_b		;
	wire	[31:0]	add_initial_c		;
	wire	[31:0]	add_initial_d		;

	reg		[1:0]	c_state				;
	reg		[1:0]	n_state				;
	reg     [31:0]  a_0 ,b_0 ,c_0 ,d_0  ;
	reg     [31:0]  a_1 ,b_1 ,c_1 ,d_1  ;
	reg     [31:0]  a_2 ,b_2 ,c_2 ,d_2  ;
	reg     [31:0]  a_3 ,b_3 ,c_3 ,d_3  ;
	reg     [31:0]  a_4 ,b_4 ,c_4 ,d_4  ;
	reg     [31:0]  a_5 ,b_5 ,c_5 ,d_5  ;
	reg     [31:0]  a_6 ,b_6 ,c_6 ,d_6  ;
	reg     [31:0]  a_7 ,b_7 ,c_7 ,d_7  ;
	reg     [31:0]  a_8 ,b_8 ,c_8 ,d_8  ;
	reg     [31:0]  a_9 ,b_9 ,c_9 ,d_9  ;
	reg     [31:0]  a_10 ,b_10 ,c_10 ,d_10  ;
	reg     [31:0]  a_11 ,b_11 ,c_11 ,d_11  ;
	reg     [31:0]  a_12 ,b_12 ,c_12 ,d_12  ;
	reg     [31:0]  a_13 ,b_13 ,c_13 ,d_13  ;
	reg     [31:0]  a_14 ,b_14 ,c_14 ,d_14  ;
	reg     [31:0]  a_15 ,b_15 ,c_15 ,d_15  ;
	reg     [31:0]  a_16 ,b_16 ,c_16 ,d_16  ;
	reg     [31:0]  a_17 ,b_17 ,c_17 ,d_17  ;
	reg     [31:0]  a_18 ,b_18 ,c_18 ,d_18  ;
	reg     [31:0]  a_19 ,b_19 ,c_19 ,d_19  ;
	reg     [31:0]  a_20 ,b_20 ,c_20 ,d_20  ;
	reg     [31:0]  a_21 ,b_21 ,c_21 ,d_21  ;
	reg     [31:0]  a_22 ,b_22 ,c_22 ,d_22  ;
	reg     [31:0]  a_23 ,b_23 ,c_23 ,d_23  ;
	reg     [31:0]  a_24 ,b_24 ,c_24 ,d_24  ;
	reg     [31:0]  a_25 ,b_25 ,c_25 ,d_25  ;
	reg     [31:0]  a_26 ,b_26 ,c_26 ,d_26  ;
	reg     [31:0]  a_27 ,b_27 ,c_27 ,d_27  ;
	reg     [31:0]  a_28 ,b_28 ,c_28 ,d_28  ;
	reg     [31:0]  a_29 ,b_29 ,c_29 ,d_29  ;
	reg     [31:0]  a_30 ,b_30 ,c_30 ,d_30  ;
	reg     [31:0]  a_31 ,b_31 ,c_31 ,d_31  ;
	reg     [31:0]  a_32 ,b_32 ,c_32 ,d_32  ;
	reg     [31:0]  a_33 ,b_33 ,c_33 ,d_33  ;
	reg     [31:0]  a_34 ,b_34 ,c_34 ,d_34  ;
	reg     [31:0]  a_35 ,b_35 ,c_35 ,d_35  ;
	reg     [31:0]  a_36 ,b_36 ,c_36 ,d_36  ;
	reg     [31:0]  a_37 ,b_37 ,c_37 ,d_37  ;
	reg     [31:0]  a_38 ,b_38 ,c_38 ,d_38  ;
	reg     [31:0]  a_39 ,b_39 ,c_39 ,d_39  ;
	reg     [31:0]  a_40 ,b_40 ,c_40 ,d_40  ;
	reg     [31:0]  a_41 ,b_41 ,c_41 ,d_41  ;
	reg     [31:0]  a_42 ,b_42 ,c_42 ,d_42  ;
	reg     [31:0]  a_43 ,b_43 ,c_43 ,d_43  ;
	reg     [31:0]  a_44 ,b_44 ,c_44 ,d_44  ;
	reg     [31:0]  a_45 ,b_45 ,c_45 ,d_45  ;
	reg     [31:0]  a_46 ,b_46 ,c_46 ,d_46  ;
	reg     [31:0]  a_47 ,b_47 ,c_47 ,d_47  ;
	reg     [31:0]  a_48 ,b_48 ,c_48 ,d_48  ;
	reg     [31:0]  a_49 ,b_49 ,c_49 ,d_49  ;
	reg     [31:0]  a_50 ,b_50 ,c_50 ,d_50  ;
	reg     [31:0]  a_51 ,b_51 ,c_51 ,d_51  ;
	reg     [31:0]  a_52 ,b_52 ,c_52 ,d_52  ;
	reg     [31:0]  a_53 ,b_53 ,c_53 ,d_53  ;
	reg     [31:0]  a_54 ,b_54 ,c_54 ,d_54  ;
	reg     [31:0]  a_55 ,b_55 ,c_55 ,d_55  ;
	reg     [31:0]  a_56 ,b_56 ,c_56 ,d_56  ;
	reg     [31:0]  a_57 ,b_57 ,c_57 ,d_57  ;
	reg     [31:0]  a_58 ,b_58 ,c_58 ,d_58  ;
	reg     [31:0]  a_59 ,b_59 ,c_59 ,d_59  ;
	reg     [31:0]  a_60 ,b_60 ,c_60 ,d_60  ;
	reg     [31:0]  a_61 ,b_61 ,c_61 ,d_61  ;
	reg     [31:0]  a_62 ,b_62 ,c_62 ,d_62  ;
	reg     [31:0]  a_63 ,b_63 ,c_63 ,d_63  ;
	reg     [31:0]  a_64 ,b_64 ,c_64 ,d_64  ;
	reg     en_0 ,en_1 ,en_2 ,en_3 			;
	reg     en_4 ,en_5 ,en_6 ,en_7  		;
	reg     en_8 ,en_9 ,en_10 ,en_11		;
	reg     en_12 ,en_13 ,en_14 ,en_15 	 	;
	reg     en_16 ,en_17 ,en_18 ,en_19  	;
	reg     en_20 ,en_21 ,en_22 ,en_23 		;
	reg    	en_24 ,en_25 ,en_26 ,en_27 		;
	reg    	en_28 ,en_29 ,en_30 ,en_31 	    ;
	reg    	en_32 ,en_33 ,en_34 ,en_35  	;
	reg    	en_36 ,en_37 ,en_38 ,en_39  	;
	reg    	en_40 ,en_41 ,en_42 ,en_43 	    ;
	reg    	en_44 ,en_45 ,en_46 ,en_47  	;
	reg    	en_48 ,en_49 ,en_50 ,en_51  	;
	reg    	en_52 ,en_53 ,en_54 ,en_55  	;
	reg    	en_56 ,en_57 ,en_58 ,en_59  	;
	reg    	en_60 ,en_61 ,en_62 ,en_63  	;
	reg     [512:0] data_0,data_1,data_2,data_3 	;
	reg     [512:0] data_4,data_5,data_6,data_7 	;
	reg     [512:0] data_8,data_9,data_10,data_11 	;
	reg     [512:0] data_12,data_13,data_14,data_15 ;
	reg     [512:0] data_16,data_17,data_18,data_19 ;
	reg     [512:0] data_20,data_21,data_22,data_23 ;
	reg     [512:0] data_24,data_25,data_26,data_27 ;
	reg     [512:0] data_28,data_29,data_30,data_31 ;
	reg     [512:0] data_32,data_33,data_34,data_35 ;
	reg     [512:0] data_36,data_37,data_38,data_39 ;
	reg     [512:0] data_40,data_41,data_42,data_43 ;
	reg     [512:0] data_44,data_45,data_46,data_47 ;
	reg     [512:0] data_48,data_49,data_50,data_51 ;
	reg     [512:0] data_52,data_53,data_54,data_55 ;
	reg     [512:0] data_56,data_57,data_58,data_59 ;
	reg     [512:0] data_60,data_61,data_62,data_63 ;
 	reg     [127:0] constant    		;

	
	//状态转移
	always@(*)	begin
		n_state	 =	c_state						;	
		case(c_state)
			IDLE:	begin
				if(i_start)	begin
					n_state	 =	RUN				;
				end
			end
			RUN: begin
				if(en_63)	begin
					n_state	 =	DONE;
				end
				else begin
				  n_state	=	RUN				;
				end
			end
			DONE:	begin
				n_state	 =	IDLE				;
				end
		endcase
	end
	
	//状态更新
	always@(posedge i_clk or negedge i_reset)	begin
		if(!i_reset)	begin
			c_state	<=	2'd0	;
		end
		else	begin
			c_state	<=	n_state	;
		end
	end


	ENDIAN_CON	e0	(	.i_data(	i_data[511:480]	),	.o_data(	data_endian_con_o[511:480]	))	;
	ENDIAN_CON	e1	(	.i_data(	i_data[479:448]	),	.o_data(	data_endian_con_o[479:448]	))	;
	ENDIAN_CON	e2	(	.i_data(	i_data[447:416]	),	.o_data(	data_endian_con_o[447:416]	))	;
	ENDIAN_CON	e3	(	.i_data(	i_data[415:384]	),	.o_data(	data_endian_con_o[415:384]	))	;
	ENDIAN_CON	e4	(	.i_data(	i_data[383:352]	),	.o_data(	data_endian_con_o[383:352]	))	;
	ENDIAN_CON	e5	(	.i_data(	i_data[351:320]	),	.o_data(	data_endian_con_o[351:320]	))	;
	ENDIAN_CON	e6	(	.i_data(	i_data[319:288]	),	.o_data(	data_endian_con_o[319:288]	))	;
	ENDIAN_CON	e7	(	.i_data(	i_data[287:256]	),	.o_data(	data_endian_con_o[287:256]	))	;
	ENDIAN_CON	e8	(	.i_data(	i_data[255:224]	),	.o_data(	data_endian_con_o[255:224]	))	;
	ENDIAN_CON	e9	(	.i_data(	i_data[223:192]	),	.o_data(	data_endian_con_o[223:192]	))	;
	ENDIAN_CON	e10	(	.i_data(	i_data[191:160]	),	.o_data(	data_endian_con_o[191:160]	))	;
	ENDIAN_CON	e11	(	.i_data(	i_data[159:128]	),	.o_data(	data_endian_con_o[159:128]	))	;
	ENDIAN_CON	e12	(	.i_data(	i_data[127:96]	),	.o_data(	data_endian_con_o[127:96]	))	;
	ENDIAN_CON	e13	(	.i_data(	i_data[95:64]	),	.o_data(	data_endian_con_o[95:64]	))	;
	ENDIAN_CON	e14	(	.i_data(	i_data[63:32]	),	.o_data(	data_endian_con_o[63:32]	))	;
	ENDIAN_CON	e15	(	.i_data(	i_data[31:0]	),	.o_data(	data_endian_con_o[31:0]		))	;
	

	always@(posedge i_start) begin
	  	constant[127:96]  =  32'h67452301   ;
		constant[95:64]   =  32'hEFCDAB89   ;
		constant[63:32]   =  32'h98BADCFE   ;
		constant[31:0]    =  32'h10325476   ;
	end

	always@(posedge i_clk) begin
		data_0<=data_endian_con_o;
		a_0 <= 	constant[127:96] ;
		b_0 <= 	constant[95:64]  ;
		c_0 <= 	constant[63:32]  ;
		d_0 <= 	constant[31:0]   ;
	end

	//第0~15级 非线性函数：F1
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				a_1 <= d_0 ;
				b_1 <= ((((( b_0 & c_0 ) | ( (~b_0) & d_0 )) + a_0 + data_0[511:480] + 32'hd76aa478) << 7) | (((( b_0 & c_0 ) | ( (~b_0) & d_0 )) + a_0 + data_0[511:480] + 32'hd76aa478) >> 25 )) + b_0 ;
				c_1 <= b_0 ;
				d_1 <= c_0 ;
				en_0<= 1'b1;
				data_1<=data_0;
			end
		endcase
	end
	//1
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_0) begin
					a_2 <= d_1 ;
					b_2 <= ((((( b_1 & c_1 ) | ( (~b_1) & d_1 )) + a_1 + data_1[479:448] + 32'he8c7b756) << 12) | (((( b_1 & c_1 ) | ( (~b_1) & d_1 )) + a_1 + data_1[479:448] + 32'he8c7b756) >> 20)) + b_1 ;
					c_2 <= b_1 ;
					d_2 <= c_1 ;
					en_1<= 1'b1;
					data_2<=data_1;
				end
			end
		endcase
	end
	//2
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_1) begin
					a_3 <= d_2 ;
					b_3 <= ((((( b_2 & c_2 ) | ( (~b_2) & d_2 )) + a_2 + data_2[447:416] + 32'h242070db) << 17) | (((( b_2 & c_2 ) | ( (~b_2) & d_2 )) + a_2 + data_2[447:416] + 32'h242070db) >> 15)) + b_2 ;
					c_3 <= b_2 ;
					d_3 <= c_2 ;
					en_2<= 1'b1;
					data_3<=data_2;
				end
			end
		endcase
	end
	//3
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_2) begin
					a_4 <= d_3 ;
					b_4 <= ((((( b_3 & c_3 ) | ( (~b_3) & d_3 )) + a_3 + data_3[415:384] + 32'hc1bdceee) << 22) | (((( b_3 & c_3 ) | ( (~b_3) & d_3 )) + a_3 + data_3[415:384] + 32'hc1bdceee) >> 10)) + b_3 ;
					c_4 <= b_3 ;
					d_4 <= c_3 ;
					en_3<= 1'b1;
					data_4<=data_3;
				end
			end
		endcase
	end
	//4
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_3) begin
					a_5 <= d_4 ;
					b_5 <= ((((( b_4 & c_4 ) | ( (~b_4) & d_4 )) + a_4 + data_4[383:352] + 32'hf57c0faf) << 7) | (((( b_4 & c_4 ) | ( (~b_4) & d_4 )) + a_4 + data_4[383:352] + 32'hf57c0faf) >> 25)) + b_4 ;
					c_5 <= b_4 ;
					d_5 <= c_4 ;
					en_4<= 1'b1;
					data_5<=data_4;
				end
			end
		endcase
	end
	//5
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_4) begin
					a_6 <= d_5 ;
					b_6 <= ((((( b_5 & c_5 ) | ( (~b_5) & d_5 )) + a_5 + data_5[351:320] + 32'h4787c62a) << 12) | (((( b_5 & c_5 ) | ( (~b_5) & d_5 )) + a_5 + data_5[351:320] + 32'h4787c62a) >> 20)) + b_5 ;
					c_6 <= b_5 ;
					d_6 <= c_5 ;
					en_5<= 1'b1;
					data_6<=data_5;
				end
			end
		endcase
	end	
	//6
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_5) begin
					a_7 <= d_6 ;
					b_7 <= ((((( b_6 & c_6 ) | ( (~b_6) & d_6 )) + a_6 + data_6[319:288] + 32'ha8304613) << 17) | (((( b_6 & c_6 ) | ( (~b_6) & d_6 )) + a_6 + data_6[319:288] + 32'ha8304613) >> 15)) + b_6 ;
					c_7 <= b_6 ;
					d_7 <= c_6 ;
					en_6<= 1'b1;
					data_7<=data_6;		
				end
			end
		endcase
	end	
	//7
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_6) begin
					a_8 <= d_7 ;
					b_8 <= ((((( b_7 & c_7 ) | ( (~b_7) & d_7 )) + a_7 + data_7[287:256] + 32'hfd469501) << 22) | (((( b_7 & c_7 ) | ( (~b_7) & d_7 )) + a_7 + data_7[287:256] + 32'hfd469501) >> 10)) + b_7 ;
					c_8 <= b_7 ;
					d_8 <= c_7 ;
					en_7<= 1'b1;
					data_8<=data_7;		
				end
			end
		endcase
	end	
	//8
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_7) begin
					a_9 <= d_8 ;
					b_9 <= ((((( b_8 & c_8 ) | ( (~b_8) & d_8 )) + a_8 + data_8[255:224] + 32'h698098d8) << 7) | (((( b_8 & c_8 ) | ( (~b_8) & d_8 )) + a_8 + data_8[255:224] + 32'h698098d8) >> 25)) + b_8 ;
					c_9 <= b_8 ;
					d_9 <= c_8 ;
					en_8<= 1'b1;
					data_9<=data_8;		
				end
			end
		endcase
	end
	//9
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_8) begin
					a_10 <= d_9 ;
					b_10 <= ((((( b_9 & c_9 ) | ( (~b_9) & d_9 )) + a_9 + data_9[223:192] + 32'h8b44f7af) << 12) | (((( b_9 & c_9 ) | ( (~b_9) & d_9 )) + a_9 + data_9[223:192] + 32'h8b44f7af) >> 20)) + b_9 ;
					c_10 <= b_9 ;
					d_10 <= c_9 ;
					en_9<= 1'b1;
					data_10<=data_9;		
				end
			end
		endcase
	end		
	//10
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_9) begin
					a_11 <= d_10 ;
					b_11 <= ((((( b_10 & c_10 ) | ( (~b_10) & d_10 )) + a_10 + data_10[191:160] + 32'hffff5bb1) << 17) | (((( b_10 & c_10 ) | ( (~b_10) & d_10 )) + a_10 + data_10[191:160] + 32'hffff5bb1) >> 15)) + b_10 ;
					c_11 <= b_10 ;
					d_11 <= c_10 ;
					en_10<= 1'b1;
					data_11<=data_10;		
				end
			end
		endcase
	end	
	//11
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_10) begin
					a_12 <= d_11 ;
					b_12 <= ((((( b_11 & c_11 ) | ( (~b_11) & d_11 )) + a_11 + data_11[159:128] + 32'h895cd7be) << 22) | (((( b_11 & c_11 ) | ( (~b_11) & d_11 )) + a_11 + data_11[159:128] + 32'h895cd7be) >> 10)) + b_11 ;
					c_12 <= b_11 ;
					d_12 <= c_11 ;
					en_11<= 1'b1;
					data_12<=data_11;		
				end
			end
		endcase
	end	
	//12
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_11) begin
					a_13 <= d_12 ;
					b_13 <= ((((( b_12 & c_12 ) | ( (~b_12) & d_12 )) + a_12 + data_12[127:96] + 32'h6b901122) << 7) | (((( b_12 & c_12 ) | ( (~b_12) & d_12 )) + a_12 + data_12[127:96] + 32'h6b901122) >> 25)) + b_12 ;
					c_13 <= b_12 ;
					d_13 <= c_12 ;
					en_12<= 1'b1;
					data_13<=data_12;		
				end
			end
		endcase
	end	
	//13
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_12) begin
					a_14 <= d_13 ;
					b_14 <= ((((( b_13 & c_13 ) | ( (~b_13) & d_13 )) + a_13 + data_13[95:64] + 32'hfd987193) << 12) | (((( b_13 & c_13 ) | ( (~b_13) & d_13 )) + a_13 + data_13[95:64] + 32'hfd987193) >> 20)) + b_13 ;
					c_14 <= b_13 ;
					d_14 <= c_13 ;
					en_13<= 1'b1;
					data_14<=data_13;
				end
			end
		endcase
	end
	//14
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_13) begin
					a_15 <= d_14 ;
					b_15 <= ((((( b_14 & c_14 ) | ( (~b_14) & d_14 )) + a_14 + data_14[63:32] + 32'ha679438e) << 17) | (((( b_14 & c_14 ) | ( (~b_14) & d_14 )) + a_14 + data_14[63:32] + 32'ha679438e) >> 15)) + b_14 ;
					c_15 <= b_14 ;
					d_15 <= c_14 ;
					en_14<= 1'b1;
					data_15<=data_14;
				end
			end
		endcase
	end
	//15
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_14) begin
					a_16 <= d_15 ;
					b_16 <= ((((( b_15 & c_15 ) | ( (~b_15) & d_15 )) + a_15 + data_15[31:0] + 32'h49b40821) << 22) | (((( b_15 & c_15 ) | ( (~b_15) & d_15 )) + a_15 + data_15[31:0] + 32'h49b40821) >> 10)) + b_15 ;
					c_16 <= b_15 ;
					d_16 <= c_15 ;
					en_15<= 1'b1;
					data_16<=data_15;
				end
			end
		endcase
	end
	//第16~31级 非线性函数：F2
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_15) begin
					a_17 <= d_16 ;
					b_17 <= ((((( b_16 & d_16 ) | ( (~d_16) & c_16 )) + a_16 + data_16[479:448] + 32'hf61e2562) << 5) | (((( b_16 & d_16 ) | ( (~d_16) & c_16 )) + a_16 + data_16[479:448] + 32'hf61e2562) >> 27)) + b_16 ;
					c_17 <= b_16 ;
					d_17 <= c_16 ;
					en_16<= 1'b1;
					data_17<=data_16;
				end
			end
		endcase
	end	
	//17
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_16) begin
					a_18 <= d_17 ;
					b_18 <= ((((( b_17 & d_17 ) | ( (~d_17) & c_17 )) + a_17 + data_17[319:288] + 32'hc040b340) << 9) | (((( b_17 & d_17 ) | ( (~d_17) & c_17 )) + a_17 + data_17[319:288] + 32'hc040b340) >> 23)) + b_17 ;
					c_18 <= b_17 ;
					d_18 <= c_17 ;
					en_17<= 1'b1;
					data_18<=data_17;
				end
			end
		endcase
	end	
	//18
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_17) begin
					a_19 <= d_18 ;
					b_19 <= ((((( b_18 & d_18 ) | ( (~d_18) & c_18 )) + a_18 + data_18[159:128] + 32'h265e5a51) << 14) | (((( b_18 & d_18 ) | ( (~d_18) & c_18 )) + a_18 + data_18[159:128] + 32'h265e5a51) >> 18)) + b_18 ;
					c_19 <= b_18 ;
					d_19 <= c_18 ;
					en_18<= 1'b1;
					data_19<=data_18;
				end
			end
		endcase
	end	
	//19
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_18) begin
					a_20 <= d_19 ;
					b_20 <= ((((( b_19 & d_19 ) | ( (~d_19) & c_19 )) + a_19 + data_19[511:480] + 32'he9b6c7aa) << 20) | (((( b_19 & d_19 ) | ( (~d_19) & c_19 )) + a_19 + data_19[511:480] + 32'he9b6c7aa) >> 12)) + b_19 ;
					c_20 <= b_19 ;
					d_20 <= c_19 ;
					en_19<= 1'b1;
					data_20<=data_19;
				end
			end
		endcase
	end
	//20
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_19) begin
					a_21 <= d_20 ;
					b_21 <= ((((( b_20 & d_20 ) | ( (~d_20) & c_20 )) + a_20 + data_20[351:320] + 32'hd62f105d) << 5) | (((( b_20 & d_20 ) | ( (~d_20) & c_20 )) + a_20 + data_20[351:320] + 32'hd62f105d) >> 27)) + b_20 ;
					c_21 <= b_20 ;
					d_21 <= c_20 ;
					en_20<= 1'b1;
					data_21<=data_20;
				end
			end
		endcase
	end
	//21
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_20) begin
					a_22 <= d_21 ;
					b_22 <= ((((( b_21 & d_21 ) | ( (~d_21) & c_21 )) + a_21 + data_21[191:160] + 32'h02441453) << 9) | (((( b_21 & d_21 ) | ( (~d_21) & c_21 )) + a_21 + data_21[191:160] + 32'h02441453) >> 23)) + b_21 ;
					c_22 <= b_21 ;
					d_22 <= c_21 ;
					en_21<= 1'b1;
					data_22<=data_21;
				end
			end
		endcase
	end
	//22
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_21) begin
					a_23 <= d_22 ;
					b_23 <= ((((( b_22 & d_22 ) | ( (~d_22) & c_22 )) + a_22 + data_22[31:0] + 32'hd8a1e681) << 14) | (((( b_22 & d_22 ) | ( (~d_22) & c_22 )) + a_22 + data_22[31:0] + 32'hd8a1e681) >> 18)) + b_22 ;
					c_23 <= b_22 ;
					d_23 <= c_22 ;
					en_22<= 1'b1;
					data_23<=data_22;
				end
			end
		endcase
	end
	//23
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_22) begin
					a_24 <= d_23 ;
					b_24 <= ((((( b_23 & d_23 ) | ( (~d_23) & c_23 )) + a_23 + data_23[383:352] + 32'he7d3fbc8) << 20) | (((( b_23 & d_23 ) | ( (~d_23) & c_23 )) + a_23 + data_23[383:352] + 32'he7d3fbc8) >> 12)) + b_23 ;
					c_24 <= b_23 ;
					d_24 <= c_23 ;
					en_23<= 1'b1;
					data_24<=data_23;
				end
			end
		endcase
	end
	//24
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_23) begin
					a_25 <= d_24 ;
					b_25 <= ((((( b_24 & d_24 ) | ( (~d_24) & c_24 )) + a_24 + data_24[223:192] + 32'h21e1cde6) << 5) | (((( b_24 & d_24 ) | ( (~d_24) & c_24 )) + a_24 + data_24[223:192] + 32'h21e1cde6) >> 27)) + b_24 ;
					c_25 <= b_24 ;
					d_25 <= c_24 ;
					en_24<= 1'b1;
					data_25<=data_24;
				end
			end
		endcase
	end
	//25
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_24) begin
					a_26 <= d_25 ;
					b_26 <= ((((( b_25 & d_25 ) | ( (~d_25) & c_25 )) + a_25 + data_25[63:32] + 32'hc33707d6) << 9) | (((( b_25 & d_25 ) | ( (~d_25) & c_25 )) + a_25 + data_25[63:32] + 32'hc33707d6) >> 23)) + b_25 ;
					c_26 <= b_25 ;
					d_26 <= c_25 ;
					en_25<= 1'b1;
					data_26<=data_25;
				end
			end
		endcase
	end
	//26
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_25) begin
					a_27 <= d_26 ;
					b_27 <= ((((( b_26 & d_26 ) | ( (~d_26) & c_26 )) + a_26 + data_26[415:384] + 32'hf4d50d87) << 14) | (((( b_26 & d_26 ) | ( (~d_26) & c_26 )) + a_26 + data_26[415:384] + 32'hf4d50d87) >> 18)) + b_26 ;
					c_27 <= b_26 ;
					d_27 <= c_26 ;
					en_26<= 1'b1;
					data_27<=data_26;
				end
			end
		endcase
	end
	//27
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_26) begin
					a_28 <= d_27 ;
					b_28 <= ((((( b_27 & d_27 ) | ( (~d_27) & c_27 )) + a_27 + data_27[255:224] + 32'h455a14ed) << 20) | (((( b_27 & d_27 ) | ( (~d_27) & c_27 )) + a_27 + data_27[255:224] + 32'h455a14ed) >> 12)) + b_27 ;
					c_28 <= b_27 ;
					d_28 <= c_27 ;
					en_27<= 1'b1;
					data_28<=data_27;
				end
			end
		endcase
	end
	//28
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_27) begin
					a_29 <= d_28 ;
					b_29 <= ((((( b_28 & d_28 ) | ( (~d_28) & c_28 )) + a_28 + data_28[95:64] + 32'ha9e3e905) << 5) | (((( b_28 & d_28 ) | ( (~d_28) & c_28 )) + a_28 + data_28[95:64] + 32'ha9e3e905) >> 27)) + b_28 ;
					c_29 <= b_28 ;
					d_29 <= c_28 ;
					en_28<= 1'b1;
					data_29<=data_28;
				end
			end
		endcase
	end
	//29
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_28) begin
					a_30 <= d_29 ;
					b_30 <= ((((( b_29 & d_29 ) | ( (~d_29) & c_29 )) + a_29 + data_29[447:416] + 32'hfcefa3f8) << 9) | (((( b_29 & d_29 ) | ( (~d_29) & c_29 )) + a_29 + data_29[447:416] + 32'hfcefa3f8) >> 23)) + b_29 ;
					c_30 <= b_29 ;
					d_30 <= c_29 ;
					en_29<= 1'b1;
					data_30<=data_29;
				end
			end
		endcase
	end
	//30
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_29) begin
					a_31 <= d_30 ;
					b_31 <= ((((( b_30 & d_30 ) | ( (~d_30) & c_30 )) + a_30 + data_30[287:256] + 32'h676f02d9) << 14) | (((( b_30 & d_30 ) | ( (~d_30) & c_30 )) + a_30 + data_30[287:256] + 32'h676f02d9) >> 18)) + b_30 ;
					c_31 <= b_30 ;
					d_31 <= c_30 ;
					en_30<= 1'b1;
					data_31<=data_30;
				end
			end
		endcase
	end
	//31
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_30) begin
					a_32 <= d_31 ;
					b_32 <= ((((( b_31 & d_31 ) | ( (~d_31) & c_31 )) + a_31 + data_31[127:96] + 32'h8d2a4c8a) << 20) | (((( b_31 & d_31 ) | ( (~d_31) & c_31 )) + a_31 + data_31[127:96] + 32'h8d2a4c8a) >> 12)) + b_31 ;
					c_32 <= b_31 ;
					d_32 <= c_31 ;
					en_31<= 1'b1;
					data_32<=data_31;
				end
			end
		endcase
	end
	//第32~47级 非线性函数：F3
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_31) begin
					a_33 <= d_32 ;
					b_33 <= (((( b_32 ^ c_32 ^ d_32 ) + a_32 + data_32[351:320] + 32'hfffa3942) << 4) | ((( b_32 ^ c_32 ^ d_32 ) + a_32 + data_32[351:320] + 32'hfffa3942) >> 28)) + b_32 ;
					c_33 <= b_32 ;
					d_33 <= c_32 ;
					en_32<= 1'b1;
					data_33<=data_32;
				end
			end
		endcase
	end
	//33
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_32) begin
					a_34 <= d_33 ;
					b_34 <= (((( b_33 ^ c_33 ^ d_33 ) + a_33 + data_33[255:224] + 32'h8771f681) << 11) | ((( b_33 ^ c_33 ^ d_33 ) + a_33 + data_33[255:224] + 32'h8771f681) >> 21)) + b_33 ;
					c_34 <= b_33 ;
					d_34 <= c_33 ;
					en_33<= 1'b1;
					data_34<=data_33;
				end
			end
		endcase
	end
	//34
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_33) begin
					a_35 <= d_34 ;
					b_35 <= (((( b_34 ^ c_34 ^ d_34 ) + a_34 + data_34[159:128] + 32'h6d9d6122) << 16) | ((( b_34 ^ c_34 ^ d_34 ) + a_34 + data_34[159:128] + 32'h6d9d6122) >> 16)) + b_34 ;
					c_35 <= b_34 ;
					d_35 <= c_34 ;
					en_34<= 1'b1;
					data_35<=data_34;
				end
			end
		endcase
	end
	//35
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_34) begin
					a_36 <= d_35 ;
					b_36 <= (((( b_35 ^ c_35 ^ d_35 ) + a_35 + data_35[63:32] + 32'hfde5380c) << 23) | ((( b_35 ^ c_35 ^ d_35 ) + a_35 + data_35[63:32] + 32'hfde5380c) >> 9)) + b_35 ;
					c_36 <= b_35 ;
					d_36 <= c_35 ;
					en_35<= 1'b1;
					data_36<=data_35;
				end
			end
		endcase
	end
	//36
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_35) begin
					a_37 <= d_36 ;
					b_37 <= (((( b_36 ^ c_36 ^ d_36 ) + a_36 + data_36[479:448] + 32'ha4beea44) << 4) | ((( b_36 ^ c_36 ^ d_36 ) + a_36 + data_36[479:448] + 32'ha4beea44) >> 28)) + b_36 ;
					c_37 <= b_36 ;
					d_37 <= c_36 ;
					en_36<= 1'b1;
					data_37<=data_36;
				end
			end
		endcase
	end
	//37
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_36) begin
					a_38 <= d_37 ;
					b_38 <= (((( b_37 ^ c_37 ^ d_37 ) + a_37 + data_37[383:352] + 32'h4bdecfa9) << 11) | ((( b_37 ^ c_37 ^ d_37 ) + a_37 + data_37[383:352] + 32'h4bdecfa9) >> 21)) + b_37 ;
					c_38 <= b_37 ;
					d_38 <= c_37 ;
					en_37<= 1'b1;
					data_38<=data_37;
				end
			end
		endcase
	end
	//38
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_37) begin
					a_39 <= d_38 ;
					b_39 <= (((( b_38 ^ c_38 ^ d_38 ) + a_38 + data_38[287:256] + 32'hf6bb4b60) << 16) | ((( b_38 ^ c_38 ^ d_38 ) + a_38 + data_38[287:256] + 32'hf6bb4b60) >> 16)) + b_38 ;
					c_39 <= b_38 ;
					d_39 <= c_38 ;
					en_38<= 1'b1;
					data_39<=data_38;
				end
			end
		endcase
	end
	//39
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_38) begin
					a_40 <= d_39 ;
					b_40 <= (((( b_39 ^ c_39 ^ d_39 ) + a_39 + data_39[191:160] + 32'hbebfbc70) << 23) | ((( b_39 ^ c_39 ^ d_39 ) + a_39 + data_39[191:160] + 32'hbebfbc70) >> 9)) + b_39 ;
					c_40 <= b_39 ;
					d_40 <= c_39 ;
					en_39<= 1'b1;
					data_40<=data_39;
				end
			end
		endcase
	end
	//40
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_39) begin
					a_41 <= d_40 ;
					b_41 <= (((( b_40 ^ c_40 ^ d_40 ) + a_40 + data_40[95:64] + 32'h289b7ec6) << 4) | ((( b_40 ^ c_40 ^ d_40 ) + a_40 + data_40[95:64] + 32'h289b7ec6) >> 28)) + b_40 ;
					c_41 <= b_40 ;
					d_41 <= c_40 ;
					en_40<= 1'b1;
					data_41<=data_40;
				end
			end
		endcase
	end
	//41
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_40) begin
					a_42 <= d_41 ;
					b_42 <= (((( b_41 ^ c_41 ^ d_41 ) + a_41 + data_41[511:480] + 32'heaa127fa) << 11) | ((( b_41 ^ c_41 ^ d_41 ) + a_41 + data_41[511:480] + 32'heaa127fa) >> 21)) + b_41 ;
					c_42 <= b_41 ;
					d_42 <= c_41 ;
					en_41<= 1'b1;
					data_42<=data_41;
				end
			end
		endcase
	end
	//42
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_41) begin
					a_43 <= d_42 ;
					b_43 <= (((( b_42 ^ c_42 ^ d_42 ) + a_42 + data_42[415:384] + 32'hd4ef3085) << 16) | ((( b_42 ^ c_42 ^ d_42 ) + a_42 + data_42[415:384] + 32'hd4ef3085) >> 16)) + b_42 ;
					c_43 <= b_42 ;
					d_43 <= c_42 ;
					en_42<= 1'b1;
					data_43<=data_42;
				end
			end
		endcase
	end
	//43
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_42) begin
					a_44 <= d_43 ;
					b_44 <= (((( b_43 ^ c_43 ^ d_43 ) + a_43 + data_43[319:288] + 32'h04881d05) << 23) | ((( b_43 ^ c_43 ^ d_43 ) + a_43 + data_43[319:288] + 32'h04881d05) >> 9)) + b_43 ;
					c_44 <= b_43 ;
					d_44 <= c_43 ;
					en_43<= 1'b1;
					data_44<=data_43;
				end
			end
		endcase
	end
	//44
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_43) begin
					a_45 <= d_44 ;
					b_45 <= (((( b_44 ^ c_44 ^ d_44 ) + a_44 + data_44[223:192] + 32'hd9d4d039) << 4) | ((( b_44 ^ c_44 ^ d_44 ) + a_44 + data_44[223:192] + 32'hd9d4d039) >> 28)) + b_44 ;
					c_45 <= b_44 ;
					d_45 <= c_44 ;
					en_44<= 1'b1;
					data_45<=data_44;
				end
			end
		endcase
	end
	//45
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_44) begin
					a_46 <= d_45 ;
					b_46 <= (((( b_45 ^ c_45 ^ d_45 ) + a_45 + data_45[127:96] + 32'he6db99e5) << 11) | ((( b_45 ^ c_45 ^ d_45 ) + a_45 + data_45[127:96] + 32'he6db99e5) >> 21)) + b_45 ;
					c_46 <= b_45 ;
					d_46 <= c_45 ;
					en_45<= 1'b1;
					data_46<=data_45;
				end
			end
		endcase
	end
	//46
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_45) begin
					a_47 <= d_46 ;
					b_47 <= (((( b_46 ^ c_46 ^ d_46 ) + a_46 + data_46[31:0] + 32'h1fa27cf8) << 16) | ((( b_46 ^ c_46 ^ d_46 ) + a_46 + data_46[31:0] + 32'h1fa27cf8) >> 16)) + b_46 ;
					c_47 <= b_46 ;
					d_47 <= c_46 ;
					en_46<= 1'b1;
					data_47<=data_46;
				end
			end
		endcase
	end
	//47
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_46) begin
					a_48 <= d_47 ;
					b_48 <= (((( b_47 ^ c_47 ^ d_47 ) + a_47 + data_47[447:416] + 32'hc4ac5665) << 23) | ((( b_47 ^ c_47 ^ d_47 ) + a_47 + data_47[447:416] + 32'hc4ac5665) >> 9)) + b_47 ;
					c_48 <= b_47 ;
					d_48 <= c_47 ;
					en_47<= 1'b1;
					data_48<=data_47;
				end
			end
		endcase
	end
	//第48~63级 非线性函数：F4
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_47) begin
					a_49 <= d_48 ;
					b_49 <= (((( c_48 ^ ( b_48 | (~d_48)) ) + a_48 + data_48[511:480] + 32'hf4292244) << 6) | ((( c_48 ^ ( b_48 | (~d_48)) ) + a_48 + data_48[511:480] + 32'hf4292244) >> 26)) + b_48 ;
					c_49 <= b_48 ;
					d_49 <= c_48 ;
					en_48<= 1'b1;
					data_49<=data_48;
				end
			end
		endcase
	end
	//49
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_48) begin
					a_50 <= d_49 ;
					b_50 <= (((( c_49 ^ ( b_49 | (~d_49)) ) + a_49 + data_49[287:256] + 32'h432aff97) << 10) | ((( c_49 ^ ( b_49 | (~d_49)) ) + a_49 + data_49[287:256] + 32'h432aff97) >> 22)) + b_49 ;
					c_50 <= b_49 ;
					d_50 <= c_49 ;
					en_49<= 1'b1;
					data_50<=data_49;
				end
			end
		endcase
	end
	//50
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_49) begin
					a_51 <= d_50 ;
					b_51 <= (((( c_50 ^ ( b_50 | (~d_50)) ) + a_50 + data_50[63:32] + 32'hab9423a7) << 15) | ((( c_50 ^ ( b_50 | (~d_50)) ) + a_50 + data_50[63:32] + 32'hab9423a7) >> 17)) + b_50 ;
					c_51 <= b_50 ;
					d_51 <= c_50 ;
					en_50<= 1'b1;
					data_51<=data_50;
				end
			end
		endcase
	end
	//51
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_50) begin
					a_52 <= d_51 ;
					b_52 <= (((( c_51 ^ ( b_51 | (~d_51)) ) + a_51 + data_51[351:320] + 32'hfc93a039) << 21) | ((( c_51 ^ ( b_51 | (~d_51)) ) + a_51 + data_51[351:320] + 32'hfc93a039) >> 11)) + b_51 ;
					c_52 <= b_51 ;
					d_52 <= c_51 ;
					en_51<= 1'b1;
					data_52<=data_51;
				end
			end
		endcase
	end
	//52
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_51) begin
					a_53 <= d_52 ;
					b_53 <= (((( c_52 ^ ( b_52 | (~d_52)) ) + a_52 + data_52[127:96] + 32'h655b59c3) << 6) | ((( c_52 ^ ( b_52 | (~d_52)) ) + a_52 + data_52[127:96] + 32'h655b59c3) >> 26)) + b_52 ;
					c_53 <= b_52 ;
					d_53 <= c_52 ;
					en_52<= 1'b1;
					data_53<=data_52;
				end
			end
		endcase
	end
	//53
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_52) begin
					a_54 <= d_53 ;
					b_54 <= (((( c_53 ^ ( b_53 | (~d_53)) ) + a_53 + data_53[415:384] + 32'h8f0ccc92) << 10) | ((( c_53 ^ ( b_53 | (~d_53)) ) + a_53 + data_53[415:384] + 32'h8f0ccc92) >> 22)) + b_53 ;
					c_54 <= b_53 ;
					d_54 <= c_53 ;
					en_53<= 1'b1;
					data_54<=data_53;
				end
			end
		endcase
	end
	//54
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_53) begin
					a_55 <= d_54 ;
					b_55 <= (((( c_54 ^ ( b_54 | (~d_54)) ) + a_54 + data_54[191:160] + 32'hffeff47d) << 15) | ((( c_54 ^ ( b_54 | (~d_54)) ) + a_54 + data_54[191:160] + 32'hffeff47d) >> 17)) + b_54 ;
					c_55 <= b_54 ;
					d_55 <= c_54 ;
					en_54<= 1'b1;
					data_55<=data_54;
				end
			end
		endcase
	end
	//55
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_54) begin
					a_56 <= d_55 ;
					b_56 <= (((( c_55 ^ ( b_55 | (~d_55)) ) + a_55 + data_55[479:448] + 32'h85845dd1) << 21) | ((( c_55 ^ ( b_55 | (~d_55)) ) + a_55 + data_55[479:448] + 32'h85845dd1) >> 11)) + b_55 ;
					c_56 <= b_55 ;
					d_56 <= c_55 ;
					en_55<= 1'b1;
					data_56<=data_55;
				end
			end
		endcase
	end
	//56
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_55) begin
					a_57 <= d_56 ;
					b_57 <= (((( c_56 ^ ( b_56 | (~d_56)) ) + a_56 + data_56[255:224] + 32'h6fa87e4f) << 6) | ((( c_56 ^ ( b_56 | (~d_56)) ) + a_56 + data_56[255:224] + 32'h6fa87e4f) >> 26)) + b_56 ;
					c_57 <= b_56 ;
					d_57 <= c_56 ;
					en_56<= 1'b1;
					data_57<=data_56;
				end
			end
		endcase
	end
	//57
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_56) begin
					a_58 <= d_57 ;
					b_58 <= (((( c_57 ^ ( b_57 | (~d_57)) ) + a_57 + data_57[31:0] + 32'hfe2ce6e0) << 10) | ((( c_57 ^ ( b_57 | (~d_57)) ) + a_57 + data_57[31:0] + 32'hfe2ce6e0) >> 22)) + b_57 ;
					c_58 <= b_57 ;
					d_58 <= c_57 ;
					en_57<= 1'b1;
					data_58<=data_57;
				end
			end
		endcase
	end
	//58
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_57) begin
					a_59 <= d_58 ;
					b_59 <= (((( c_58 ^ ( b_58 | (~d_58)) ) + a_58 + data_58[319:288] + 32'ha3014314) << 15) | ((( c_58 ^ ( b_58 | (~d_58)) ) + a_58 + data_58[319:288] + 32'ha3014314) >> 17)) + b_58 ;
					c_59 <= b_58 ;
					d_59 <= c_58 ;
					en_58<= 1'b1;
					data_59<=data_58;
				end
			end
		endcase
	end
	//59
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_58) begin
					a_60 <= d_59 ;
					b_60 <= (((( c_59 ^ ( b_59 | (~d_59)) ) + a_59 + data_59[95:64] + 32'h4e0811a1) << 21) | ((( c_59 ^ ( b_59 | (~d_59)) ) + a_59 + data_59[95:64] + 32'h4e0811a1) >> 11)) + b_59 ;
					c_60 <= b_59 ;
					d_60 <= c_59 ;
					en_59<= 1'b1;
					data_60<=data_59;
				end
			end
		endcase
	end
	//60
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_59) begin
					a_61 <= d_60 ;
					b_61 <= (((( c_60 ^ ( b_60 | (~d_60)) ) + a_60 + data_60[383:352] + 32'hf7537e82) << 6) | ((( c_60 ^ ( b_60 | (~d_60)) ) + a_60 + data_60[383:352] + 32'hf7537e82) >> 26)) + b_60 ;
					c_61 <= b_60 ;
					d_61 <= c_60 ;
					en_60<= 1'b1;
					data_61<=data_60;
				end
			end
		endcase
	end
	//61
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_60) begin
					a_62 <= d_61 ;
					b_62 <= (((( c_61 ^ ( b_61 | (~d_61)) ) + a_61 + data_61[159:128] + 32'hbd3af235) << 10) | ((( c_61 ^ ( b_61 | (~d_61)) ) + a_61 + data_61[159:128] + 32'hbd3af235) >> 22)) + b_61 ;
					c_62 <= b_61 ;
					d_62 <= c_61 ;
					en_61<= 1'b1;
					data_62<=data_61;
				end
			end
		endcase
	end
	//62
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_61) begin
					a_63 <= d_62 ;
					b_63 <= (((( c_62 ^ ( b_62 | (~d_62)) ) + a_62 + data_62[447:416] + 32'h2ad7d2bb) << 15) | ((( c_62 ^ ( b_62 | (~d_62)) ) + a_62 + data_62[447:416] + 32'h2ad7d2bb) >> 17)) + b_62 ;
					c_63 <= b_62 ;
					d_63 <= c_62 ;
					en_62<= 1'b1;
					data_63<=data_62;
				end
			end
		endcase
	end
	//63
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
				if(en_62) begin
					a_64 <= d_63 ;
					b_64 <= (((( c_63 ^ ( b_63 | (~d_63)) ) + a_63 + data_63[223:192] + 32'heb86d391) << 21) | ((( c_63 ^ ( b_63 | (~d_63)) ) + a_63 + data_63[223:192] + 32'heb86d391) >> 11)) + b_63 ;
					c_64 <= b_63 ;
					d_64 <= c_63 ;
					if(last512) en_63<= 1'b1;
				end
			end
		endcase
	end

	//输出处理结果
	always@(posedge i_clk) begin
		case(c_state)
			RUN: begin
					o_data <= {a_o,b_o,c_o,d_o} ;
				end
			default: o_data <= 0				;
		endcase
	end

	assign	add_initial_a	=	 a_64	+	constant[127:96] ;
	assign	add_initial_b	=	 b_64	+	constant[95:64]	 ;
	assign	add_initial_c	=	 c_64	+	constant[63:32]	 ;
	assign	add_initial_d	=	 d_64	+	constant[31:0]	 ;
	
	ENDIAN_CON	e16	(	.i_data(	add_initial_a	),	.o_data(	a_o	))	;
	ENDIAN_CON	e17	(	.i_data(	add_initial_b	),	.o_data(	b_o	))	;
	ENDIAN_CON	e18	(	.i_data(	add_initial_c	),	.o_data(	c_o	))	;
	ENDIAN_CON	e19	(	.i_data(	add_initial_d	),	.o_data(	d_o	))	;
		
	assign	o_fBusy	=	(c_state==RUN)	?	128'd1	:	128'd0			    ;
	assign	o_fDone	=	(c_state==DONE)	?	128'd1	:	128'd0			    ;

endmodule
