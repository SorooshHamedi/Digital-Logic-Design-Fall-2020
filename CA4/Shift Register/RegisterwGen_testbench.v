`timescale 1ns/1ns
module nBitRegisterwGen_TB();
	reg [7:0]data = 8'b11111111;
	reg clk = 1'b0;
	reg rst;
	wire [7:0]q;

	nBitRegisterwGen #(8) register(data, rst, clk, q);

	always #100 clk = ~clk;

	initial begin
	rst = 1'b1;
	#200 data = 8'b10110100;
	#150 rst = 1'b0;
	#300 data = 8'd175;
	#300
	$stop;
	end
endmodule
