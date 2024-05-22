`timescale 1ns/1ns
module TwoBitMuxBasedHalfAdder(input [1:0]A, input [1:0]B, output [1:0]s, output carryOut);
	wire a0_bar, b0_bar;
	assign #(5,7) a0_bar = ~A[0];
	assign #(5,7) b0_bar = ~B[0];

	Mux2to1 muxS0(.I({b0_bar, B[0]}), .S(A[0]), .w(s[0]));
	Mux8to1 muxS1(.I({1'b0, A[0], a0_bar, 1'b1, a0_bar, 1'b1, A[0], 1'b0}), .S({A[1],B}), .w(s[1]));
	Mux8to1 muxCarryOut(.I({1'b1, 1'b1, A[0], 1'b0, A[0], 1'b0, 1'b0, 1'b0}), .S({A[1], B}), .w(carryOut));
endmodule
