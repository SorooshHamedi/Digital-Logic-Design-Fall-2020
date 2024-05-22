`timescale 1ns/1ns
module TwoBitMuxBasedAdder(input [1:0]A, input [1:0]B, input carryIn, output [1:0]sum, output carryOut);
	
	wire carryIn_bar, a0_bar;
	
	assign #(5,7) carryIn_bar = ~carryIn;
	assign #(5,7) a0_bar = ~A[0];
	Mux4to1 muxS0(.I({carryIn, carryIn_bar, carryIn_bar, carryIn}), .S({A[0],B[0]}), .w(sum[0]));
	Mux16to1 muxS1(.I({1'b1, A[0], 1'b0, a0_bar, 1'b0, a0_bar, 1'b1, A[0], A[0], 1'b0, a0_bar, 1'b1, a0_bar, 1'b1, A[0], 1'b0}), .S({carryIn, A[1], B}), .w(sum[1]));
	Mux16to1 muxCarryOut(.I({1'b1, 1'b1, 1'b1, A[0], 1'b1, A[0], 1'b0, 1'b0, 1'b1, 1'b1, A[0], 1'b0, A[0], 1'b0, 1'b0, 1'b0}), .S({carryIn, A[1], B}), .w(carryOut));

endmodule
