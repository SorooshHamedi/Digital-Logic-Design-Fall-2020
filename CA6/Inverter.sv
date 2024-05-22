module Inverter (data, out);
	parameter size = 10;
	input [size-1:0]data;
	output logic [size-1:0]out;
	
	always@(data)
		out = ~data;
endmodule
