module Incrementer (data, cin, result, co);
	parameter size = 10;
	input [size-1:0]data;
	input cin;
	output logic [size-1:0]result;
	output logic co;
	
	always@(data, cin) begin
		if(cin)
			{co, result} = data + 1'b1;
		else
			{co, result} = data;
	end
endmodule
