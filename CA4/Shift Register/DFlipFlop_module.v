`timescale 1ns/1ns
module DFFWR(input d, input rst, input clk, output q, output q_bar);
	wire slaveClk;
	wire d_bar;
	not #(6,6) slvClk(slaveClk, clk);
	not #(6,6) dInv(d_bar, d);

	wire masterQ, masterQ_bar, masterD;
	nor #(12,12) (masterD, rst, d_bar);
	DLatch masterLatch(masterD, clk, masterQ, masterQ_bar);
	DLatch slaveLatch(masterQ, slaveClk, q, q_bar);
endmodule
