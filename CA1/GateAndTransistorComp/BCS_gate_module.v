`timescale 1ns/1ns
module BitCompareSliceGate( input a0, b0, e0, g0, output e1, g1);
	
	wire j1;
	
	//j1 
	XNOR xnor_gate( .inpA(a0), .inpB(b0), .out(j1) );
	
	//e1
	wire e1_bar;
	NAND2 nand2_e1( .inpA(j1), .inpB(e0), .out(e1_bar) );

	Inverter inv_e1( .inp(e1_bar), .out(e1) );

	//k1
	wire k1_bar;
	
	wire a0_bar;
	Inverter inv_a0( .inp(a0), .out(a0_bar) );

	NAND3 nand3_k1( .inpA(a0_bar), .inpB(b0), .inpC(e0), .out(k1_bar) );
	
	//g1
	wire g0_bar;
	Inverter inv_g0( .inp(g0), .out(g0_bar) );

	NAND2 nand2_g1( .inpA(k1_bar), .inpB(g0_bar), .out(g1) );
endmodule