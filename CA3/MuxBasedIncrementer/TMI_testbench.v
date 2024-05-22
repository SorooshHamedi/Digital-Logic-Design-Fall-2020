`timescale 1ns/1ns
module TMI_TB();
	reg [1:0]A = 2'b11;
	reg [1:0]B = 2'b01;
	wire [1:0]s;
	wire carryOut;

	TwoBitMuxBasedHalfAdder tmi(.A(A), .B(B), .s(s), .carryOut(carryOut));
	
	initial begin
	#400  B[1]=1'b0;
	#400 A[0] = 1'b0;
	//repeat (4) #400 A = A + 1'b1;
	#400;
	$stop;
	end
endmodule