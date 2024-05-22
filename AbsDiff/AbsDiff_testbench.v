`timescale 1ns/1ns
module AbsDiff_TB();
	reg [7:0]A = 8'd0;
	reg [7:0]B = 8'd0;
	wire [7:0]absDiff;

	AbsDiff instanc(A,B,absDiff);

	integer i;
	initial begin
	for(i=0; i<=10; i=i+1) begin
		#1000 A = $urandom%255;
		#1000 B = $urandom%255;
	end
	#1000;
	$stop;
	end
endmodule