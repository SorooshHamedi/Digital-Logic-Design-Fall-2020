`timescale 1ns/1ns
module ShiftRegisterwGen_TB();
	reg sln;
	reg clk = 1'b0;
	reg rst = 1'b1;
	wire [0:7]q;

	nBitShiftRegisterwGen #(8) sr_gen(sln, rst, clk, q);

	always #200 clk = ~clk;
	initial begin
	sln = 1'b1;
	#420 rst = 1'b0;
	repeat (10) #250 sln = ~sln;
	$stop;
	end
endmodule
