module BusControl(dataA, dataB, selectA, selectB, out);
	parameter size = 10;
	input [size-1:0]dataA, dataB;
	input selectA, selectB;
	output logic [size-1:0]out;
	
	always@(dataA, dataB, selectA, selectB) begin
		out = {(size) {1'bz}};
		if(selectA)
			out = dataA;
		else
			out = dataB;
	end
endmodule 