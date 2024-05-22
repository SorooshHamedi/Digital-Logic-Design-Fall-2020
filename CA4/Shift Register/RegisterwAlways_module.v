`timescale 1ns/1ns
module nBitRegisterwAlways(data, rst, clk, q);
	parameter SIZE = 8;
	input [SIZE-1:0]data;
	input clk, rst;
	output reg [SIZE-1:0]q;

	always@(negedge clk) begin
		if(rst)
			#30 q <= 0;
		else
			#30 q <= data;
	end
endmodule
