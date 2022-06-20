`timescale 1ns/1ns
module BitCompareSlice(input a, input b, input eq, input lt, output EQ, output LT);
	assign #(25,29) EQ = eq & (a ~^ b);
	assign #(27,30) LT = ((~a) & b & eq) | lt;
endmodule
