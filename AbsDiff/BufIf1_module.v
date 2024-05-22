`timescale 1ns/1ns
module BufIf1(input A, input en, output w);
	bufif1 #(17,19,19) buff(w,A,en);
endmodule
