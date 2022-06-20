`timescale 1ns/1ns
module j1_TB();
	
	reg a0 = 0, b0 = 0;
	wire j1;

	XNOR xnor_gate( .inpA(a0), .inpB(b0), .out(j1) );
	
	initial begin
	#100;
	#100 a0 = 1;
	#100 a0 = 0;
	#100 b0 = 1;
	#100 a0 = 1;
	#100;
	$stop;
	end
endmodule