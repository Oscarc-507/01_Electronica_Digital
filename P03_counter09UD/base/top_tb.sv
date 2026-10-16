`timescale 1ns/1ns
module top_tb();
   logic clk;
   logic rst;
   logic up_down;
   logic [6:0] disp;

   top dut(.*);
/*
   initial begin
      $dumpfile("ondas.vcd");
      $dumpvars(0,top_tb);
   end
 */
   initial clk = 1'b0;
   always #19 clk = ~clk;

   initial begin

      rst = 1'b1;
      up_down = 1'b1;
      #38;
      rst = 1'b0;
      #120us;
      up_down = 1'b0;
      #120us;
      up_down = 1'b1;
      #43.776us;
      rst = 1'b1;
      #43.776us;
      rst = 1'b0;
       
      #300us;
      $finish;
   end

   
endmodule

/*
module top_tb();
   logic clk;
   logic rst;
   logic up_down;
   logic [6:0] disp;

   

   top dut(.*);

   initial begin
      $dumpfile("ondas.fst");
      $dumpvars(0,top_tb);
   end
   
   initial clk = 1'b0;
   always #19 clk = ~clk;

   initial begin
      
      rst = 1'b1;
      #37;
      rst = 1'b0;
      //#7s;
      #49us;
      rst = 1'b1;
      #38;
      rst = 1'b0;
      #13s;
      
      up_down = 1'b1;
      rst = 1'b1;
      #37;
      rst = 1'b0;
      //#13s;
      #200us;
      @(negedge clk);
      up_down = 1'b0;
      #200us;
      
      $finish;
   end
   initial begin
      //#25s;
      #1ms;   
      $error("[FAILED] simulation time exceeded");
   end
   
endmodule
*/
   
   
