`timescale 1ns/1ns

module top_tb();
   logic clk;
   logic rst;
   logic [6:0] disp;

   top dut(.*);

   initial begin
      $dumpfile("ondas.vcd");
      $dumpvars(0,top_tb);
   end
   
   initial clk = 1'b0;
   always #19 clk = ~clk;

   initial begin
     /* 
      rst = 1'b1;
      #38;
      rst = 1'b0;
      //#7s;
      #49us;
      rst = 1'b1;
      #38;
      rst = 1'b0;
      #13s;
      */

      rst = 1'b1;
      #38;
      rst = 1'b0;
      //#13s;
      #49us;
      rst = 1'b1;
      #38;
      rst = 1'b0;
      #150us;
   
      $finish;
   end
   /*
   initial begin
      //#25s;
      #10ms;   
      $error("[FAILED] simulation time exceeded");
   end
   */
endmodule
   
   
