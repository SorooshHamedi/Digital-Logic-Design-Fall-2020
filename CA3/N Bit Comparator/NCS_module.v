`timescale 1ns/1ns
module nBitComparator(A, B, EQ, LT);
	parameter SIZE = 8;
	input [SIZE-1:0]A, B;
	output reg LT, EQ;
	wire [SIZE/2:0]eq, lt;

	assign eq[SIZE/2] = 1;
	assign lt[SIZE/2] = 0;
	assign EQ = eq[0];
	assign LT = lt[0];

	genvar i;
	generate
		for(i=SIZE/2-1; i>=0; i=i-1) begin: TCS
			TwoBitCompareSlice tcs(.A({A[i*2+1],A[i*2]}), .B({B[i*2+1],B[i*2]}), .eq(eq[i+1]), .lt(lt[i+1]),
						.EQ(eq[i]), .LT(lt[i]));
		end
	endgenerate
endmodule