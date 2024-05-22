`timescale 1ns/1ns
module DFFWRwAlways_TB();
	reg clk = 1'b0;
	reg d;
	reg rst = 1'b0;
	wire q, q_bar;

	DFFWR ff(d, rst, clk, q, q_bar);

	always #100 clk = ~clk;
	initial begin
	#20 d = 1'b1;
	#120 d = 1'b0;
	#40 rst = 1'b1;
	#200 d = 1'b1;
	#200 rst = 1'b0;
	#45 d = 1'b0;
	#200;
	$stop;
	end
endmodule
	