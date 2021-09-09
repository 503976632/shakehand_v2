
`timescale 1ns/1ps

module tb_handshakee (); /* this is automatically generated */
	
	// clock
	reg clk;
	initial begin
		clk = 0;
		forever #(1) clk = ~clk;
	end

	reg rst_n;
	initial begin
		rst_n <= 0;
		#10
		rst_n <= 1;
	end


	// (*NOTE*) replace reset, clock, others

	reg  valid_i;
	reg  data_i;
	reg  ready_i;
	wire  ready_o;
	wire  valid_o;
	wire  data_o;


	handshakee inst_handshakee
		(
			.clk     (clk),
			.rst_n   (rst_n),
			.valid_i (valid_i),
			.data_i  (data_i),
			.ready_i (ready_i),
			.ready_o (ready_o),
			.valid_o (valid_o),
			.data_o  (data_o)
		);





	initial begin

		valid_i <= 0;
		data_i  <= 0;
		ready_i <= 0;
		repeat(10)@(posedge clk);
		data_i <= 1;
		repeat(2)@(posedge clk);
		valid_i <= 1;
		repeat(2)@(posedge clk);
		valid_i <= 0;
		ready_i <= 1;
		repeat(2)@(posedge clk);
		ready_i <= 0;



		repeat(2)@(posedge clk);
		valid_i <= 1;
		repeat(2)@(posedge clk);
		ready_i <= 1;
		repeat(2)@(posedge clk);
		valid_i <= 0;
		repeat(2)@(posedge clk);
		ready_i <= 0;




		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave


endmodule
