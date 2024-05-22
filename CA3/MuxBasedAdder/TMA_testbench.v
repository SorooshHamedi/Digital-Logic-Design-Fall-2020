`timescale 1ns/1ns
module TMA_TB();
	reg [1:0]A = 2'b01;
	reg [1:0]B = 2'b11;
	reg carryIn = 1'b0;
	wire carryOut;
	wire [1:0]sum;

	TwoBitMuxBasedAdder tma(.A(A), .B(B), .carryIn(carryIn), .carryOut(carryOut), .sum(sum));

	initial begin
	repeat(2) #200 A[0] = ~A[0];
	#200;
	$stop;
	end
endmodule
		
	