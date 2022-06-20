`timescale 1ns/1ns
module e1TB();
	
	reg a0 = 0, b0 = 1, e0 = 1;
	wire j1 , e1;
	wire e1_bar;

	XNOR xnor_gate( .inpA(a0), .inpB(b0), .out(j1) );
	
	NAND_2input nand2_gate( .inpA(j1), .inpB(e0), .out(e1_bar) );
	
	Inverter inv_e1( .inp(e1_bar), .out(e1) );

	initial begin
	#100;
	#100 a0 = 1;
	#100 b0 = 0;
	#100 a0 = 0;
	#100 a0 = 1;
	#100;
	$stop;
	end
endmodule

	
