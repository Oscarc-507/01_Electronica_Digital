/*
module top(
    input logic clk,
    input logic rst,
    output logic [6:0] disp
);


    logic div_clk_w;
    logic switch_w;
    logic [3:0] cont_w;
    
    counter25 m0(
        .clk(clk),
        .rst(rst),
        .div_clk(div_clk_w)
    );
    counter4 m1(
        .clk(div_clk_w),
        .rst(rst),
        .up_down(switch_w),
        .cont(cont_w)
    );
    toggle m2(
        .clk(clk),
        .rst(rst),
        .data(cont_w),
        .switch(switch_w)    
    );
    decoder m3(
        .in(cont_w),
        .out(disp)
    );
  
endmodule
*/
module top(
 input logic  clk,
 input logic  rst,
 input logic  up_down,
 output [6:0] disp
);
   
   logic      div_clk_w;
   logic      or_w;
   logic      clear_w;
   logic [3:0] cont_w;
   
   counter25 m0(
      .clk(clk),
      .rst(rst),
      .div_clk(div_clk_w) 
   );
   counter4 m1(
      .clk(div_clk_w),
      .rst(clear_w),
      .up_down(up_down),
      .cont(cont_w)
   );
   or_module m2(
      .a(rst),
      .b(or_w),
      .s(clear_w)
   );
   comparator m3(
      .data(cont_w),
      .up_down(up_down),
      .clear(or_w)
   );
   decoder m4(
      .in(cont_w),
      .out(disp)
   );
   
endmodule

   
   
   
   
     
   
