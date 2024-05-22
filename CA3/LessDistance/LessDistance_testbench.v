`timescale 1ns/1ns
module LessDistance_TB();
	reg [7:0]dataA = 8'd0;
	reg [7:0]dataB = 8'd255;
	reg [7:0]refI = 8'd0;
	wire [7:0]lessDistance;

	LessDistance ld(dataA, dataB, refI, lessDistance);
	
	integer i;
	initial begin
	#1000;
	for(i=0; i<=20; i=i+1) begin
		#1000 dataA = $urandom%255;
		#1000 dataB = $urandom%255;
		#1000 refI = $urandom%255;
	end
	#1000;
	end
endmodule
		
	
