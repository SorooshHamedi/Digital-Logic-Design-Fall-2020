`timescale 1ns/1ns
module MSSD_TB();
	logic serIn = 1'b1;
	logic rst = 1'b0;
	logic clk = 1'b0;
	wire error, validOut;
	wire [1:0]activePort;
	wire [3:0]out;

	MSSD_PreSyn presyn(serIn, rst, clk, error, validOut, activePort, out);


	always #50 clk = ~clk;

	initial begin
	#150 serIn = 1'b0;
	repeat (2) #100 serIn = 1'b1;
	repeat (2) #100 serIn = 1'b1;
	repeat (4) #100 serIn = 1'b0;
	repeat (24) #100 serIn = $urandom%2;
	#100 serIn = 1'b1;
	#200;
	$stop;
	end
endmodule

	
	
