`timescale 1ns/1ns
module nBitSubtractor #(parameter SIZE = 6) (a,b, out);
	input [SIZE-1:0]a, b;
	output logic [SIZE-1:0]out;
	logic [SIZE-1:0]b_bar;  
	always@(a or b) begin
		b_bar = (~b)+1'b1;
		out = a+b_bar;
	end
endmodule