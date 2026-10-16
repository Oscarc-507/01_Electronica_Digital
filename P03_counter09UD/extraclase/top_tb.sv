`timescale 1ns/1ns
module top_tb();
	logic clk;
	logic rst;
	logic [6:0] disp;
	
	top dut(.*);

initial clk = 1'b0;
always #19 clk = ~clk;

initial begin
	rst = 1'b1;

	#38;
	rst = 1'b0;
	#87.552us;
	
	#87.552us;
	#43.776us;
	rst = 1'b1;
	#43.776us;
	rst = 1'b0;
	
	#300us;
	$finish;
end
endmodule