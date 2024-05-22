`timescale 1ns/1ns
module AbsDiff(input [7:0]ref, input [7:0]data, output [7:0]absDiff);

	wire [7:0]data_bar;
	nBitInverter #8 dataInvert(.A(data), .w(data_bar));
	
	wire [8:0]sum;
	wire adderCarryOut;
	wire sumCarryOut;

	nBitAdder #8 adder(.A(data_bar), .B(ref), .sum(sum[7:0]), .carryOut(adderCarryOut));
	
	nBitIncrementor #2 lsbsInc(.A({1'b0, adderCarryOut}), .sum({sumCarryOut, sum[8]}), .carryOut(carry));
	
	wire [8:0]sumCarryHandle, sumIncremented;
	wire incrementCarry;

	nBitIncrementor #8 SIncrementor(.A(sum[7:0]), .sum(sumIncremented[7:0]), .carryOut(incrementCarry));
	assign #(8,11) sumIncremented[8] = sum[8] ^ incrementCarry;
	nBitBufIf1 #9 carryBufif1(.A(sumIncremented), .en(sumCarryOut), .w(sumCarryHandle));
	nBitBufIf0 #9 carryBufif0(.A(sum), .en(sumCarryOut), .w(sumCarryHandle));

	nBitNotIf1 #8 absDiffNotif1(.A(sumCarryHandle[7:0]), .en(sumCarryHandle[8]), .w(absDiff));
	nBitBufIf0 #8 absDiffBufIf0(.A(sumCarryHandle[7:0]), .en(sumCarryHandle[8]), .w(absDiff));
endmodule
	
	
	
	
