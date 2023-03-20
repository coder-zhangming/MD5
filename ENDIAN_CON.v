module	ENDIAN_CON(

	input	wire	[31:0]	i_data	,
	
	output	wire	[31:0]	o_data	);

	assign	o_data	[31:24]	=	i_data	[7:0]	;
	assign	o_data	[23:16]	=	i_data	[15:8]	;
	assign	o_data	[15:8]	=	i_data	[23:16]	;
	assign	o_data	[7:0]	=	i_data	[31:24]	;

endmodule
