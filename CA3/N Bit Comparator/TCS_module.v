`timescale 1ns/1ns
module TwoBitCompareSlice(input [1:0]A, input [1:0]B, input eq, input lt, output reg EQ, output reg LT);
	always @(A or B or eq or lt) begin
		#43 LT = (((~A[1]) & B[1]) & eq) | (((~A[0]) & B[0]) & (A[1] ~^ B[1]) & eq) | lt;
	end

	always @(A or B or eq or lt) begin
		#31 EQ = eq & (A[1] ~^ B[1]) & (A[0] ~^ B[0]);
	end
endmodule
		
		
		
		
