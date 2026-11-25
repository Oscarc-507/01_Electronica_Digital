module top #(
    parameter int CLKS_PER_CM = 1566
)(
    input logic clk,
    input logic rst,
    input logic echo,
    output logic trigger,
    output logic [2:0]disp_en,
    output logic [6:0] disp
);

    //signal declaration
    logic div_clk_w;
    logic clear_w;
    logic en_w;
    logic [3:0] cont_u_w, cont_d_w, cont_c_w;
    logic [3:0] data_w;
    logic [2:0] disp_en_w;

    //component instantiation
    div_clk m0(
        .clk(clk),
        .rst(rst),
        .trigger(trigger),
        .div_clk_display(div_clk_w)
    );

    control m1(
        .clk(clk),
        .rst(rst),
        .echo(echo),
        .trigger(trigger),
        .clear(clear_w),
        .en(en_w)
    );
    
    count #(.CLKS_PER_CM(CLKS_PER_CM)) m2(
        .clk(clk),
        .rst(clear_w),
        .en(en_w),
        .cont_u(cont_u_w),
        .cont_d(cont_d_w),
        .cont_c(cont_c_w)
    );

    shift_register m3(
        .clk(div_clk_w),
        .rst(rst),
        .disp_en(disp_en)
    );
    mux_decoder m4(
        .sel(disp_en),
        .data_u(cont_u_w),
        .data_d(cont_d_w),
        .data_c(cont_c_w),
        .data(data_w)
    );
    decoder m5(
        .in(data_w),
        .out(disp)
    );

endmodule
