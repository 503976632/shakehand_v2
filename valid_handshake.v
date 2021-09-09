module valid_handshake(//valid和data打一拍
	input	clk,
	input	rst_n,

	input	valid_i, 
	input	data_i,  	
	input	ready_i,  

	output	ready_o, 
	output	valid_o, 
	output	data_o  
	);

	reg	valid_o_r;
	reg	data_r;

	always @(posedge clk or posedge rst_n) begin
		if (!rst_n) begin
			valid_o_r <= 0;
		end
		else  begin
			valid_o_r <= ready_i ? valid_i : valid_o;
		end
	end

	always @(posedge clk or posedge rst_n) begin
		if (!rst_n) begin
			data_r <= 0;
		end
		else  begin
			data_r <= (ready_i && valid_i) ? data_i : data_o;
		end
	end
assign ready_o = ready_i || !valid_o;
assign valid_o = valid_o_r;
assign data_o = data_r;

endmodule // valid_handshake


