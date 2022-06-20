`timescale 1ns/1ns
module NAND_2input( input inpA, inpB, output out);
	
	wire y;
	supply1 Vdd;
	supply0 Gnd;

	nmos #(3,4,5) T1( y, Gnd, inpA);
	nmos #(3,4,5) T2( out, y, inpB);
	
	pmos #(5,6,7) T3( out, Vdd, inpA);
	pmos #(5,6,7) T4( out, Vdd, inpB);
endmodule
