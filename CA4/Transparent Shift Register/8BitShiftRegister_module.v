`timescale 1ns/1ns
module ShiftRegister8Bit #(parameter SIZE = 8) (sln, clk, q);
	input sln;
	input clk;
	output [0:SIZE-1]q;
	
	wire [0:SIZE-1]q_bar;
	
	
	genvar k;
	generate
		for(k=0; k<SIZE; k=k+1) begin
			if(!k)  
				DLatch latch(sln, clk, q[k], q_bar[k]);
			else
				DLatch latch(q[k-1], clk, q[k], q_bar[k]);
		end
	endgenerate
endmodule
