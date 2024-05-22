`timescale 1ns/1ns
module nBitShiftRegister #(parameter SIZE = 8) (sln, en, rst, clk, q);
	input sln;
	input en;
	input rst;
	input clk;
	output logic [0:SIZE-1]q;
	
	always@(posedge clk) begin
		if(rst) 
			#30 q <= {(SIZE){1'b0}};
		else if(en)
			#30 q <= {sln, q[0:SIZE-2]};
	end
endmodule
