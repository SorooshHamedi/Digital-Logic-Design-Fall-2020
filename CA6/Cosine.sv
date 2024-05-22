module Cosine(input clk, rst, start, input [9:0]x, input [7:0]y, output ready, output [1:0]intpart, output [7:0]fractpart);

	wire ldx, ldy, ldr, ldt, ldadr, initr, initt, zadr, xmult, coeffmult, gt;
	
	Controller controller(.clk(clk), .rst(rst), .gt(gt), .start(start), .ldx(ldx), .ldy(ldy), .ldr(ldr),
		.ldt(ldt), .ldadr(ldadr), .initr(initr), .initt(initt), .zadr(zadr), .xmult(xmult),
			.coeffmult(coeffmult), .ready(ready));
			
	Datapath datapath(.clk(clk), .rst(rst), .start(start), .x(x), .y(y), .ldx(ldx), .ldy(ldy),
		.ldr(ldr), .ldt(ldt), .ldadr(ldadr), .initr(initr), .initt(initt), .zadr(zadr), 
		.xmult(xmult), .coeffmult(coeffmult), .gt(gt), .result({intpart, fractpart}));
endmodule