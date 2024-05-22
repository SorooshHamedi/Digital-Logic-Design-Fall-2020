`timescale 1ns/1ns
module Mux8to1(input [7:0]I, input [2:0]S, output w);
	assign #(51,59) w = I[S];
endmodule 