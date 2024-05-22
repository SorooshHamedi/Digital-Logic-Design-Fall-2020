`timescale 1ns/1ns
module DFFWRwAlways(input d, rst, clk, output reg q);
	always@(negedge clk) begin
		if(rst)
			#30 q <= 1'b0;
		else
			#30 q <= d;
	end
endmodule
	
