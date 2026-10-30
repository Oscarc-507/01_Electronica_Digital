module top(
    input logic  clk,
    input logic  rst,
    input logic  up_down,
    output logic [1:0] disp_en,
    output logic [6:0] disp
);
   
    logic      div_clk_w;
    logic      div_clk_disp_w;
    logic      or_w;
    logic      clear_w;
    logic [3:0] cont_w; 
    logic [3:0] cont_d_w;
    logic [3:0] cont_u_w;

    counter25 m0(
        .clk(clk),
        .rst(rst),
        .div_clk(div_clk_w),
        .div_clk_disp(div_clk_disp_w) 
    );
    counter4 m1(
        .clk(div_clk_w),
        .rst(clear_w),
        .up_down(up_down),
        .cont_d(cont_d_w),
        .cont_u(cont_u_w)
    );
    or_module m2(
        .a(rst),
        .b(or_w),
        .s(clear_w)
    );
    comparator m3(
        .cont_d(cont_d_w),
        .cont_u(cont_u_w),
        .clear(or_w)
    );
    mux_decoder m4(
        .sel(disp_en[0]),
        .data_d(cont_d_w),
        .data_u(cont_u_w),
        .data(cont_w)
    );
    shift_reg_display m5(
        .clk(div_clk_disp_w),
        .rst(clear_w),
        .disp_en(disp_en)
    );
    decoder m6(
        .in(cont_w),
        .out(disp)
    );

endmodule