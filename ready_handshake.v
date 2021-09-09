module ready_handshake(//都打一拍
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
	reg	ready_o_r;

	reg	data_r;


always @(posedge CLK or negedge rst_n) 
begin 
	if(~rst_n) 
	begin
		valid_o_r <= 0;
		ready_o_r <= 0;
		data_r <= 0;
	end 
	else 
	begin
		ready_o_r <= ready_i;//打一拍
		if (ready_o && valid_i) //写数据
		begin
			valid_o_r <= valid_i;
			data_r <= data_i;
		end
		else 
		begin
			if(valid_o && ready_i)//数据被读走，valid拉低
				valid_o_r <= 0;
			else 
				valid_o_r <= valid_o_r;
		end
	end
end

assign ready_o = ready_o_r;
assign valid_o = valid_o_r;
assign data_o = data_r;

endmodule