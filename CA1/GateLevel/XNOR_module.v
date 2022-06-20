`timescale 1ns/1ns
module XNOR( input inpA, input inpB, output out);

	xnor #(12,12) (out, inpA, inpB);
endmodule