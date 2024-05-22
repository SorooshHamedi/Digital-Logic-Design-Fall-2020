`timescale 1ns/1ns
module nBitShiftRegisterwAlways #(parameter SIZE = 8) (sln, rst, clk, q);
	input sln;
	input rst;
	input clk;
	output reg [0:SIZE-1]q;
	
	always@(negedge clk or posedge rst) begin
		if(rst)
			#30 q <= {1'b0};
		else
			#30 q <= {sln, q[0:SIZE-2]};
	end
endmodule
