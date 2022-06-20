`timescale 1ns/1ns
module XNOR( input inpA, inpB, output out);
	
	//a bar
	wire a_bar;
	
	Inverter inv_a( .inp( inpA ), .out(a_bar) );

	/*nmos #(3,4,5) T1( a_bar, Gnd, a);
	pmos #(5,6,7) T2( a_bar, Vdd, a);*/
	

	//b bar
	wire b_bar;
	
	Inverter inv_b( .inp( inpB ), .out(b_bar) );
	/*nmos #(3,4,5) T3( b_bar, Gnd, b);
	pmos #(5,6,7) T4( b_bar, Vdd, b);*/


	//pass transistor xnor
	nmos #(3,4,5) T5( out, b_bar, a_bar);
	nmos #(3,4,5) T6( out, inpB, inpA);
endmodule
