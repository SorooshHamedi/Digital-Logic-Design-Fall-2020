`timescale 1ns/1ns
module g1_TB();
	
	reg a0=1;
	reg b0=1;
	reg e0=1;
	reg g0=0;

	wire g1;

	wire a0_bar;
	wire g0_bar;
	wire k1_bar;

	Inverter a0_inv( .inp(a0), .out(a0_bar) );

	NAND_3input nand3( .inpA(a0_bar), .inpB(b0), .inpC(e0), .out(k1_bar));

	Inverter g0_inv( .inp(g0), .out(g0_bar) );

	NAND_2input nand2( .inpA(k1_bar), .inpB(g0_bar), .out(g1) );
	
	initial begin
	#100 a0 = 0;
	#100 a0 = 1;
	#100;
	$stop;
	end
	

endmodule

	
