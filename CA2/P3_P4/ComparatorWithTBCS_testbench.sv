`timescale 1ns/1ns
module EightBitComparatorWithTBCS_TB ();
	logic [7:0]A = 8'b11111111;
	logic [7:0]B = 8'b11111111;
	wire EQ, LT;

	ComparatorWithTBCS #(8) EightBitComp (.A(A), .B(B), .EQ(EQ), .LT(LT));

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
