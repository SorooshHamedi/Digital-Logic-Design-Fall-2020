`timescale 1ns/1ns
module Controller_TB();
	logic clk, rst, gt, start;
	wire ldx, ldy, ldr, ldt, ldadr, initr, initt, zadr, xmult, coeffmult, ready;

	Controller controller(.clk(clk), .rst(rst), .gt(gt), .start(start), .ldx(ldx), .ldy(ldy), .ldr(ldr),
		.ldt(ldt), .ldadr(ldadr), .initr(initr), .initt(initt), .zadr(zadr), .xmult(xmult), .coeffmult(coeffmult), .ready(ready));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		gt = 1'b0;
		start = 1'b0;
	end

	initial #23 rst = 1'b0;

	always #10 clk = ~clk;
	
	initial begin
	#20 start = 1'b1;
	#38 start = 1'b0;
	#500 gt = 1'b1;
	#400 start = 1'b1; gt = 1'b0;
	#12 start = 1'b0;
	#180 gt = 1'b1;
	#200 start = 1'b1; gt = 1'b0;
	#5 start = 1'b0;
	#190 gt = 1'b1;
	#500;
	$stop;
	end
endmodule
	

