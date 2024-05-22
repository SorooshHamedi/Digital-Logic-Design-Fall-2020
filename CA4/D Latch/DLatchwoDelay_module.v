`timescale 1ns/1ns
module DLatchwoDelay(input d, input clk, output q, output qbar);
	wire set, reset;
	nand nSet(set, d, clk);
	nand nReset(reset, set, clk);
	
	nand nQ(q, qbar, set);
	nand nQbar(qbar, q, reset);
endmodule
