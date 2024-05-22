`timescale 1ns/1ns
module Mux2to1(input [1:0]I, input S, output w);
	assign #(23,25) w = I[S];

endmodule
		   

