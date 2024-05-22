`timescale 1ns/1ns
module nBitRegisterwGen(data, rst, clk, q);
	parameter SIZE = 8;
	input [SIZE-1:0]data;
	input clk;
	input rst;
	output [SIZE-1:0]q;
	wire [SIZE-1:0]q_bar;

	genvar i;
	generate 
		for(i=0; i<SIZE; i=i+1) begin
			DFFWR ff(data[i], rst, clk, q[i], q_bar[i]);
		end
	endgenerate
endmodule
