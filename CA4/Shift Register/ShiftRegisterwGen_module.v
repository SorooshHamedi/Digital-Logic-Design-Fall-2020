`timescale 1ns/1ns
module nBitShiftRegisterwGen #(parameter SIZE = 8) (sln, rst, clk, q);
	input sln;
	input rst;
	input clk;
	output [0:SIZE-1]q;
	
	wire [0:SIZE-1]q_bar;
	
	
	genvar k;
	generate
		for(k=0; k<SIZE; k=k+1) begin
			if(!k)  
				DFFWR ff(sln, rst, clk, q[k], q_bar[k]);
			else
				DFFWR ff(q[k-1], rst, clk, q[k], q_bar[k]);
		end
	endgenerate
endmodule