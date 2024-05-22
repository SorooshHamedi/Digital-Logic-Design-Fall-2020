`timescale 1ns/1ns
module DLatch_TB();
	reg d = 1'bx;
	reg clk = 1'b0;
	wire q, q_bar;

	DLatch latch(d, clk, q, q_bar);

	always #50 clk = ~clk;

	initial begin
	#20 d = 1'b1;
	#200;
	#5 d = ~d;
	#140 d = ~d;
	#200;
	$stop;
	end
endmodule