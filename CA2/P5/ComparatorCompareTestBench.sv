`timescale 1ns/1ns
module EightBitComparatorsCompareTB();
	logic [7:0]A = 8'b11111111;
	logic [7:0]B = 8'b11111111;
	wire EQ_bcs, LT_bcs;
	wire EQ_tbcs, LT_tbcs;

	ComparatorWithTBCS #(8) EightBitCompTBCS (.A(A), .B(B), .EQ(EQ_tbcs), .LT(LT_tbcs));
	ComparatorWithBCS #(8) EightBitCompBCS (.A(A), .B(B), .EQ(EQ_bcs), .LT(LT_bcs));

	initial begin
	
	for(int i=7; i>=0; i=i-1) begin: inputChange
		repeat (2) #400 A[i] = ~A[i];
	end
	
	#400 B = 8'd0;
	#400 A = 8'd0;
	for(int i=7; i>=0 ; i=i-1) begin: inputChange
		repeat (2) #400 B[i] = ~B[i];
	end
	$stop;
	end
endmodule
