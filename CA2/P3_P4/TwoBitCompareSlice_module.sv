`timescale 1ns/1ns
module TwoBitCompareSlice(input [1:0]A, input [1:0]B, input eq, input lt, output EQ, output LT);
	
	wire msbEq;
	assign msbEq = A[1] ~^ B[1];
	wire lsbEq;
	assign lsbEq = A[0] ~^ B[0];
	assign #(29,32) EQ = eq & msbEq & lsbEq;

	wire msbLt;
	assign msbLt = (~A[1]) & B[1] & eq;
	wire lsbLt;
	assign lsbLt = (~A[0]) & B[0] & msbEq & eq;
	assign #(42,44) LT = lsbLt | msbLt | lt;
endmodule 
