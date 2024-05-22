`timescale 1ns/1ns
module ShiftRegister8bit_TB();
	reg sln;
	reg clk = 1'b0;
	wire [0:7]q;

	ShiftRegister8Bit #(8) sr(sln, clk, q);

	always #200 clk = ~clk;
	initial begin
	sln = 1'b1;
	repeat (4) #250 sln = ~sln;
	$stop;
	end
endmodule
