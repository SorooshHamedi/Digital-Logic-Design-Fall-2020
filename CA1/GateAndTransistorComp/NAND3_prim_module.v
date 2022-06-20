`timescale 1ns/1ns
module NAND3( input inpA, inpB, inpC, output out);

	nand #(15,12) (out, inpA, inpB, inpC);
endmodule
