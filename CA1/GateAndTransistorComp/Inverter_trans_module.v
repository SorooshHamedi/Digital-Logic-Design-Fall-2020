`timescale 1ns/1ns
module Inverter( input inp, output out);
	
	supply1 Vdd;
	supply0 Gnd;

	nmos #(3,4,5) T1(out, Gnd, inp);
	pmos #(5,6,7) T2(out, Vdd, inp);
endmodule
