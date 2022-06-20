`timescale 1ns/1ns
module BCS_transistorTB();
	
	reg a0=1;
	reg b0=1;
	reg e0=1;
	reg g0=0;

	wire e1, g1;

	BitCompareSliceTransistor bcsTransistor( .a0(a0), .b0(b0), .e0(e0), .g0(g0), .e1(e1), .g1(g1) );

	initial begin
	#100;
	#100 a0=0;
	#100 a0=1;
	#100 a0=0;
	#100 b0=0;
	#100 a0=1;
	#100;
	$stop;
	end
endmodule
