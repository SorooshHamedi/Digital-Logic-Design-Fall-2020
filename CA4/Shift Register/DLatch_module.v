`timescale 1ns/1ns
module DLatch(input d, input clk, output q, output qbar);
	wire set, reset;
	nand #(8,8) nSet(set, d, clk);
	nand #(8,8) nReset(reset, set, clk);
	
	nand #(8,8) nQ(q, qbar, set);
	nand #(8,8) nQbar(qbar, q, reset);
endmodule