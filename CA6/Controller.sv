module Controller(input clk, rst, gt, start, output logic ldx, ldy,
 ldr, ldt, ldadr, initr, initt, zadr, xmult, coeffmult, ready);
	logic [2:0]ps, ns;
	parameter [2:0]
	Idle = 0, Initial = 1, Begin = 2, Mult1 = 3, Mult2 = 4, Add = 5;
	
	always@(start, gt, ps) begin
		ns = Idle;
		case(ps)
			Idle:
				ns = start? Initial: Idle;
			Initial:
				ns = start? Initial: Begin;
			Begin:
				ns = Mult1;
			Mult1:
				ns = Mult2;
			Mult2:
				ns = Add;
			Add:
				ns = gt? Idle: Mult1;
		endcase
	end

	always@(start, gt, ps) begin
		{ldx, ldy, ldr, ldt, ldadr, initr, initt, zadr, xmult, coeffmult, ready} = 11'b0;
		
		case(ps)
			Idle: begin
				zadr = 1'b1;
				ready = 1'b1;
			end
			Initial: begin
				ldx = 1'b1;
				ldy = 1'b1;
			end
			Begin: begin
				initr = 1'b1;
				initt = 1'b1;
			end
			Mult1: begin
				xmult = 1'b1;
				ldt = 1'b1;
			end
			Mult2: begin
				coeffmult = 1'b1;
				ldt = 1'b1;
			end
			Add: begin
				ldr = 1'b1;
				ldadr = 1'b1;
			end
		endcase
	end

	always@(posedge clk, posedge rst) begin
		if(rst)
			ps <= Idle;
		else
			ps <= ns;
	end
endmodule 