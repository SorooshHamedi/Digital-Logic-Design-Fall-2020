`timescale 1ns/1ns
module NAND2( input inpA, inpB, output out);

	nand #(10,8) (out, inpA, inpB);
endmodule