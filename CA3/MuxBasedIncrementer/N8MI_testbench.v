`timescale 1ns/1ns
module N8MI_TB();
	reg [7:0]A = 8'b10101010;
	wire [7:0]sum;
	wire carryOut;
	
	nBitIncrementor #8 t8ma(.A(A), .sum(sum), .carryOut(carryOut));

	initial begin
	repeat (2) #400 A[0] = ~A[0];
	#400;
	$stop;
	end
endmodule