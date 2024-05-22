`timescale 1ns/1ns
module N8MA_TB();
	reg [7:0]A = 8'b01010101;
	reg [7:0]B = 8'b10101011;
	wire [7:0]sum;
	wire carryOut;
	
	nBitAdder #8 adder (.A(A), .B(B), .sum(sum), .carryOut(carryOut));
	
	initial begin
	repeat (2) #500 A[0] = ~A[0];
	#500;
	$stop;
	end
endmodule 
