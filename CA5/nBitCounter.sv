`timescale 1ns/1ns
module nBitCounter(PI, clk, en, carryIn, rst, ld, PO, carryOut);
	parameter SIZE = 3;
	input [SIZE-1:0]PI;
	input clk, carryIn, rst, ld, en;
	output logic [SIZE-1:0]PO;
	output carryOut;

	always@(posedge clk) begin
		if(rst)
			PO <= {(SIZE){1'b0}};
		else begin
			if(ld)
				PO <= PI;
			else if(en)
				PO <= (carryIn)? PO+1: PO;
		end
	end

	assign carryOut = (en)? &{carryIn, PO}: 1'b0;
endmodule
 
																					