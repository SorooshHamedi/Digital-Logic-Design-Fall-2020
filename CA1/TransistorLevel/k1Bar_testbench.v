`timescale 1ns/1ns
module k1barTB();
	
	wire k1_bar;
	reg a0=1, b0=1, e0=1;

	wire a0_bar;
	
	Inverter inv_a0( .inp(a0), .out(a0_bar) );

	NAND_3input nand3( .inpA(a0_bar), .inpB(b0), .inpC(e0), .out(k1_bar) );

	initial begin
	#100;
	#100 a0 = 0;
	#100 a0 = 1;
	#100;
	$stop;
	end
endmodule