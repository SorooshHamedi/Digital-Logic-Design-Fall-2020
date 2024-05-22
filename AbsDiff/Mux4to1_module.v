`timescale 1ns/1ns
module Mux4to1(input [3:0]I, input [1:0]S, output w);
	assign #(23,25) w = I[S];
endmodule