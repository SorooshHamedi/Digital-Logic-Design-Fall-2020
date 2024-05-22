module Register(ld, init, zero, clk, rst, pi, po);
	parameter size = 10;
	input ld, clk, rst, init, zero;
	input [size-1:0]pi;
	output logic [size-1:0]po;
	
	always@(posedge clk, posedge rst) begin
		if(rst)
			po <= {(size) {1'b0}};
		else begin
			if(init)
				po <= {2'b01, {(size) {1'b0}}};
			else if(zero)
				po <= {(size) {1'b0}};
			else if(ld)
				po <= pi;
		end
	end
endmodule 