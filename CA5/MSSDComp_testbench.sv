`timescale 1ns/1ns
module MSSDComp_TB();
	logic serIn = 1'b1;
	logic rst = 1'b0;
	logic clk = 1'b0;
	wire error_pre, validOut_pre;
	wire [1:0]activePort_pre;
	wire [3:0]out_pre;
	wire error_post, validOut_post;
	wire [1:0]activePort_post;
	wire [3:0]out_post;

	MSSD_PreSyn presyn(serIn, rst, clk, error_pre, validOut_pre, activePort_pre, out_pre);
	MSSD postsyn(serIn, rst, clk, error_post, validOut_post, activePort_post, out_post);

	always #5000 clk = ~clk;

	initial begin
	#15000 serIn = 1'b0;
	repeat (2) #10000 serIn = 1'b1;
	repeat (2) #10000 serIn = 1'b1;
	repeat (4) #10000 serIn = 1'b0;
	repeat (24) #10000 serIn = $urandom%2;
	#10000 serIn = 1'b1;
	#20000;
	$stop;
	end
endmodule

	
	