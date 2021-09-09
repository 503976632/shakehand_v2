module handshake(//都不打拍
	input	clk,
	input	rst_n,

	input	valid_i, 
	input	data_i,  	
	input	ready_i,  

	output	ready_o, 
	output	valid_o, 
	output	data_o  
	);

assign ready_o = ready_i;
assign valid_o = valid_i;
assign data_o = (ready_i && valid_i) ? data_i :data_o;

endmodule