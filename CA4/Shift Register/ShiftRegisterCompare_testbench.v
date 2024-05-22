`timescale 1ns/1ns
module ShiftRegisterCompare_TB();
	reg sln;
	reg clk = 1'b0;
	reg rst = 1'b1;
	wire [0:7]q_gen;
	wire [0:7]q_always;

	nBitShiftRegisterwGen #(8) sr_gen(sln, rst, clk, q_gen);
	nBitShiftRegisterwAlways #(8) sr_always(sln, rst, clk, q_always);

	always #200 clk = ~clk;
	initial begin
	sln = 1'b1;
	#420 rst = 1'b0;
	repeat (20) #250 sln = ~sln;
	$stop;
	end
endmodule
