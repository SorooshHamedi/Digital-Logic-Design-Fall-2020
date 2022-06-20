`timescale 1ns/1ns
module EightBitComparatorWithBCS_TB ();
	logic [7:0]A = 8'b11111111;
	logic [7:0]B = 8'b11111111;
	wire EQ, LT;
	
	ComparatorWithBCS #(8) EightBitComp (.A(A), .B(B), .EQ(EQ), .LT(LT));

	initial begin

	for(int i=7; i>=0; i--) begin: inputChange
		repeat (2) #400 A[i] = ~A[i];
	end

	#400 A = 8'd0;
	#400 B = 8'd0;
	for(int i=7; i>=0 ; i--) begin: inputChange
		repeat (2) #400 B[i] = ~B[i];
	end
	#400;
	$stop;
	end
endmodule
