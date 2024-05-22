`timescale 1ns/1ns
module Demux4Bit(input [1:0]s, input in, output logic [0:3]out);
	
	always@(s, in) begin
		out = {1'bz};
		case(s)
			2'b00: out[s] = in;
			2'b01: out[s] = in;
			2'b10: out[s] = in;
			2'b11: out[s] = in;
			default: out = 4'bz;
		endcase
	end
endmodule 
