`timescale 1ns/1ns
module MSSD_PreSyn(input serIn, rst, clk, output logic error, validOut, output logic [1:0]activePort, output logic[0:3]out);
	logic [2:0]ps, ns;
	parameter [2:0]IDLE = 3'b000, INFO = 3'b001, XMIT = 3'b010, STOP = 3'b011, ERROR = 3'b100;
	logic en3bCnt, enSr, en9bCnt, rst3bCnt, ld9bCnt;
	wire co3bCnt, co9bCnt;
	wire [5:0]nb;
	wire [6:0]subtractOut;
	wire [1:0]portSelect;
	wire [0:7]srOut;

	always@(ps, serIn, co3bCnt, co9bCnt) begin
		ns = IDLE;
		case(ps)
			IDLE: ns = serIn? IDLE: INFO;
			INFO: ns = co3bCnt? XMIT: INFO;
			XMIT: ns = co9bCnt? STOP: XMIT;
			STOP: ns = serIn? IDLE: ERROR;
			ERROR: ns = serIn? IDLE: ERROR;
			default: ns = IDLE;
		endcase
	end

	//INFO
	always@(ps) begin
	 	if(ps == INFO) 
			begin				
				en3bCnt <= 1'b1;
				enSr <= 1'b1;
				rst3bCnt <= 1'b0;
				ld9bCnt <= 1'b1;
			end
		else
			begin
				en3bCnt <= 1'b0;
				enSr <= 1'b0;
				rst3bCnt <= 1'b1;
				ld9bCnt <= 1'b0;
			end
	end

	always@(ps) begin
		if(ps == XMIT)
			begin
				en9bCnt <= 1'b1;
				validOut <= 1'b1;
			end
		else
			begin
				validOut <= 1'b0;
				en9bCnt <= 1'b0;
			end
	end

	//ERROR
	assign error = (ps == ERROR)? 1'b1: 1'b0;

	assign portSelect = srOut[6:7];
	assign activePort = portSelect;
	assign nb = srOut[0:5];

	always@(posedge clk, posedge rst) begin
		if(rst)
			ps <= IDLE;
		else
			ps <= ns;
	end	
	
	nBitCounter #3 cnt3b(.clk(clk), .en(en3bCnt), .rst(rst3bCnt), .ld(1'b0), .carryIn(1'b1), .carryOut(co3bCnt));
	nBitShiftRegister #8 sr(.clk(clk), .en(enSr), .rst(1'b0), .sln(serIn), .q(srOut));
	Demux4Bit demux(.s(portSelect), .in(serIn), .out(out));
	nBitSubtractor #8  sub(.a({1'b0,7'd64}), .b({2'b0,nb}), .out(subtractOut)); //fix this
	nBitCounter #9 cnt9b(.clk(clk), .en(en9bCnt), .rst(1'b0), .ld(ld9bCnt), .PI({subtractOut[5:0], 3'b000}), .carryIn(1'b1),  .carryOut(co9bCnt));

endmodule