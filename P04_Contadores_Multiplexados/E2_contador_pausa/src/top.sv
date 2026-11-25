module top(
    input logic  clk,
    input logic  rst,
    input logic  btn,
    output logic [1:0] disp_en,
    output logic [6:0] disp
);
   
    logic       div_clk_w;
    logic       div_clk_disp_w;
    logic       or_w;
    logic       clear_w;
    logic       div_clk_pause_w;
    logic       out_w;
    logic       clk_w;
    logic [3:0] cont_w; 
    logic [3:0] cont_d_w;
    logic [3:0] cont_u_w;


    toggle m0(
        .clk(clk),
        .rst(rst),
        .btn(btn),
        .div_clk(div_clk_pause_w),
        .out(out_w)
    );
    mux2 m1(
        .sel(out_w),
        .a(div_clk_w),
        .out(clk_w)
    );
    counter25 m2(
        .clk(clk),
        .rst(rst),
        .div_clk(div_clk_w),
        .div_clk_disp(div_clk_disp_w),
        .div_clk_bounce(div_clk_pause_w) 
    );
    counter4 m3(
        .clk(clk_w),
        .rst(clear_w),
        .cont_d(cont_d_w),
        .cont_u(cont_u_w)
    );
    or_module m4(
        .a(rst),
        .b(or_w),
        .s(clear_w)
    );
    comparator m5(
        .cont_d(cont_d_w),
        .cont_u(cont_u_w),
        .clear(or_w)
    );
    mux_decoder m6(
        .sel(disp_en[0]),
        .data_d(cont_d_w),
        .data_u(cont_u_w),
        .data(cont_w)
    );
    shift_reg_display m7(
        .clk(div_clk_disp_w),
        .rst(clear_w),
        .disp_en(disp_en)
    );
    decoder m8(
        .in(cont_w),
        .out(disp)
    );

endmodule
   
   
   
   
   
     
   
