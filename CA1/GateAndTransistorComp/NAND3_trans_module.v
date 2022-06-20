`timescale 1ns/1ns
module NAND_3input( input inpA, inpB, inpC, output out);
	
	supply0 Gnd;
	supply1 Vdd;

	wire y0;
	wire y1;
	
	nmos #(3,4,5) T1( y0, Gnd, inpA);
	nmos #(3,4,5) T2( y1, y0, inpB);
	nmos #(3,4,5) T3( out, y1, inpC);
	
	pmos #(5,6,7) T4( out, Vdd, inpA);
	pmos #(5,6,7) T5( out, Vdd, inpB);
	pmos #(5,6,7) T6( out, Vdd, inpC);
endmodule