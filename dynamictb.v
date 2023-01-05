`include "dynamic.v"

module tb;


reg clk, rst, d, valid;
wire pattern_det;
integer seed;



dynamic dut(.*);

initial begin 
	clk=0;
	forever #10 clk=~clk;
end

initial begin
	seed=12365;
	rst=1;
	repeat(2) @(posedge clk);
	rst=0;

	repeat(500)begin
		@(posedge clk);
		d=$random(seed);
	end
	#50;
	$finish;

end

endmodule

