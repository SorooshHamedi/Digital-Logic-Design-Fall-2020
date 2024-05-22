`timescale 1ns/1ns
module Cos_TB();
	logic clk, rst, start;
	logic [9:0]x;
	logic [7:0]y;
	wire ready;
	wire [1:0]intpart;
	wire [7:0]fractpart;

	Cosine UUT(.clk(clk), .rst(rst), .start(start), .x(x), .y(y), .ready(ready), .intpart(intpart),
		.fractpart(fractpart));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		start = 1'b0;
	end

	initial #30 rst = 1'b0;
	always #1000 clk = ~clk;

	initial begin
	#9000 x = 10'b0011000000;
	y = 8'b00001010;
	#2 start = 1'b1;
	#50000 start = 1'b0;
	#100000 x = 10'b0001000001;
	y = 8'b00010000;
	#5 start = 1'b1;
	#5000 start = 1'b0;
	#200000 x = 10'b0001011001;
	y = 8'b00101001;
	#40 start = 1'b1;
	#30000 start = 1'b0;
	#200000;
	$stop;
	end
endmodule