`timescale 1ns/1ns
module Mux16to1(input [15:0]I, input [3:0]S, output w);
	assign #(65,96) w = I[S];
endmodule

