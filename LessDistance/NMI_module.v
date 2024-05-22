`timescale 1ns/1ns
module nBitIncrementor(A, sum, carryOut);
	parameter SIZE = 8;
	input [SIZE-1:0]A;
	output [SIZE-1:0]sum;
	output carryOut;
	wire [SIZE/2:0]carry;

	assign carryOut = carry[SIZE/2];
	assign carry[0] = 1'b1;
	
	genvar i;
	generate 
		for(i=0; i<SIZE/2; i=i+1) begin: TMI
			TwoBitMuxBasedHalfAdder tmi(.A({A[i*2+1], A[i*2]}), .B({1'b0, carry[i]}), .s({sum[i*2+1], sum[i*2]}), .carryOut(carry[i+1]));
		end
	endgenerate
endmodule
