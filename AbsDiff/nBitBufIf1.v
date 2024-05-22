`timescale 1ns/1ns
module nBitBufIf1(A, en, w);
	parameter SIZE = 8;
	input [SIZE-1:0]A;
	input en;
	output [SIZE-1:0]w;

	genvar i;
	generate 
		for(i=0; i<SIZE; i=i+1) begin
			BufIf1 buff(.w(w[i]), .A(A[i]), .en(en));
		end
	endgenerate
endmodule
