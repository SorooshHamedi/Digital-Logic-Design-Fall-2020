`timescale 1ns/1ns
module BCS_compTB();

	reg a0 = 1;
	reg b0 = 1;
	reg e0 = 1;
	reg g0 = 0;
	
	wire e1_t;
	wire g1_t;
	
	wire e1_g;
	wire g1_g;

	BitCompareSliceTransistor bcsTransistor( .a0(a0), .b0(b0), .e0(e0), .g0(g0), .e1(e1_t), .g1(g1_t));
	BitCompareSliceGate bcsGate( .a0(a0), .b0(b0), .e0(e0), .g0(g0), .e1(e1_g), .g1(g1_g));

	initial begin
	#100 a0=0;
	#100 a0=1;
	#100 a0=0;
	#100 b0=0;
	#100 a0=1;
	#100 e0=0;
	#100 g0=1;
	#100;
	$stop;
	end
endmodule
	
