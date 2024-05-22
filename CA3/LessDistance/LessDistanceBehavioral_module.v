`timescale 1ns/1ns
module LessDistanceBehavioral(input [8:0]dataA, input [8:0]dataB, input [8:0]refI, output reg[7:0]lessDistance);
	
	reg [8:0]diffA, diffB;
	
	always @(dataA or refI or dataB) begin
		#583 diffA = ((dataA - refI) >= 8'd0) ? dataA - refI : refI - dataA;
	end

	always @(dataB or refI or dataA) begin
		#583 diffB = ((dataB - refI) >= 8'd0) ? dataB - refI : refI - dataB;
	end

	always @(diffA or diffB) begin
		if(diffA < diffB)
			#191 lessDistance = dataA[7:0];
		else
			#191 lessDistance = dataB[7:0];	
	end
endmodule