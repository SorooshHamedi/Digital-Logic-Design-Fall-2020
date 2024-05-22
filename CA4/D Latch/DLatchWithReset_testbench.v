`timescale 1ns/1ns
module DLatchWR_TB();
	reg d = 1'bx;
	reg clk = 1'b0;
	reg reset = 1'b1;
	wire q, q_bar;

	DLatchWR latch(d, clk, reset, q, q_bar);

	always #50 clk = ~clk;

	initial begin
	#20 d = 1'b1;
	#130 reset = 1'b0;
	#70;
	#5 d = ~d;
	#80 reset = 1'b1;
	#60 d = ~d;
	#45 reset = 1'b0;
	#200;
	$stop;
	end
endmodule
