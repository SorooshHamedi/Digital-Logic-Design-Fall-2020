`timescale 1ns/1ns
module DLatchWR(input d, input clk, input rst, output q, output qbar);
	wire s, r;

	//active low reset input
	nand #(12,12) nSet(s, d, clk, rst);
	nand #(8,8) nReset(r, s, clk);
	
	nand #(8,8) nQ(q, qbar, s);
	nand #(12,12) nQbar(qbar, q, r, rst);
endmodule