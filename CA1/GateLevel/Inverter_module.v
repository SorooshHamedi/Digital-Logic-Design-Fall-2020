`timescale 1ns/1ns
module Inverter( input inp, output out);

	not #(5,7) (out,inp);
endmodule
