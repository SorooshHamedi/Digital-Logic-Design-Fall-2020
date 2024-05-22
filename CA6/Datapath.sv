module Datapath(input clk, rst, start, input [9:0]x, input [7:0]y, input ldx, ldy,
 ldr, ldt, ldadr, initr, initt, zadr, xmult, coeffmult, output gt, output [9:0]result);
	
	wire [9:0]xout, xsq, xinv, xsqbar;
	Register #(10) regx(.ld(ldx), .init(1'b0), .zero(1'b0), .clk(clk), .rst(rst), .pi(x), .po(xout));
	Multiplier sqmult(.dataa(xout), .datab(xout), .result(xsq));
	Inverter #(10) inv(.data(xsq), .out(xinv));
	Incrementer #(10) incx(.data(xinv), .cin(1'b1), .result(xsqbar));
	
	wire [7:0]yout;
	Register #(10) regy(.ld(ldy), .init(1'b0), .zero(1'b0), .clk(clk), .rst(rst), .pi(y), .po(yout));
	
	wire [9:0]temp_out, temp_in;
	Register #(10) rtemp(.ld(ldt), .init(initt), .zero(1'b0), .clk(clk), .rst(rst), .pi(temp_in), .po(temp_out));
	
	wire [9:0]res_out, res_in;
	Register #(10) rres(.ld(ldr), .init(initr), .zero(1'b0), .clk(clk), .rst(rst), .pi(res_in), .po(res_out));

	Comparator comp(.dataa({2'b00, yout}), .datab(temp_out), .agb(gt));
	
	Adder adder(.dataa(temp_out), .datab(res_out), .result(res_in));
		
	wire [3:0]adr, inc_out;
	Register #(4) regadr(.ld(ldadr), .init(1'b0), .zero(zadr), .clk(clk), .rst(rst), .pi(inc_out), .po(adr));
	Incrementer #(4) inc(.data(adr) , .cin(1'b1), .result(inc_out));
	
	wire [7:0] coeff;
	LUT lut(.address(adr), .clock(1'b1), .q(coeff));
	wire [9:0] multin;
	BusControl buscontrol(.dataA({2'b00, coeff}), .dataB(xsqbar), .selectA(coeffmult), .selectB(xmult), .out(multin));
	
	Multiplier mainmult(.dataa(multin), .datab(temp_out), .result(temp_in));
	
	assign result = res_out;
endmodule