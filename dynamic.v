module dynamic(clk, rst, d, valid, pattern_det);

//CBCBC

parameter B=1'b0;
parameter C=1'b1;

input clk, rst, d, valid;

output reg pattern_det;

reg [4:0]  pattern_to_det;
reg [4:0]  pattern_collected;

integer bit_count;

initial begin
	pattern_to_det=5'b10101;
	bit_count=0;
end

always @(posedge clk) begin
	if(rst==1)begin
		pattern_det=0;
		
	end

	else begin
		pattern_collected={pattern_collected[3:0],d};
		bit_count=bit_count+1;
		pattern_det=0;

		if(pattern_to_det==pattern_collected && bit_count>=5) begin
			pattern_det=1;
			bit_count=0;
		end

	end
end



endmodule




