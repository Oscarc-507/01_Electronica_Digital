`timescale 1ns / 1ns
module top_tb();

    logic  clk;
    logic  rst;
    logic  up_down;
    logic [1:0] disp_en;
    logic [6:0] disp;
    
    top dut(.*);
    
    initial clk=1'b0;
    always #19 clk = ~clk; 

    initial begin
        rst = 1'b0;   
        up_down = 1'b0;
        @(posedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
        repeat(101)@(posedge dut.m0.div_clk);
        @(negedge clk) up_down = 1'b1;
        repeat(103)@(posedge dut.m0.div_clk);
        
        $finish;
    end

endmodule
