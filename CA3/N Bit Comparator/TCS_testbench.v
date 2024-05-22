`timescale 1ns/1ns
module TCS_TB();
	reg [1:0]A = 2'd3;
	reg [1:0]B = 2'd3;
	reg lt = 0, eq = 1;
	wire EQ, LT;
	
	TwoBitCompareSlice bcs(.A(A), .B(B), .lt(lt), .eq(eq), .EQ(EQ), .LT(LT));
	
	integer i; 
	initial begin
	for(i=1; i>=0; i=i-1) begin
		repeat (2) #100 A[i] = ~A[i];
	end
	#100 A = 2'd0;
	#100 B = 2'd0;
	for(i=1; i>=0; i=i-1) begin
		repeat (2) #100 B[i] = ~B[i];
	end
	#400;
	$stop;
	end
endmodule

	
