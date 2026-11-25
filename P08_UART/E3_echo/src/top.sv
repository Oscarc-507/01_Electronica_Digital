module top(
    input logic clk,
    input logic rst,
    input logic rx,
    output logic tx
);
    logic [7:0] dout;
    logic baud_en_w;
    logic delay_en_w;
    logic reg_en_w;
    logic baud_clk_w;
    logic done_1_w;
    logic done_2_w;
    logic done_3_w;
    logic done_w;
    logic [7:0] dout_w;
    logic shift_tx_en_w;
    logic shift_rx_en_w;
    
    control m0_control (
        .clk          (clk),
        .rst          (rst),
        .rx           (rx),
        .done         (done_w),
        .shift_tx_en  (shift_tx_en_w), 
        .shift_rx_en  (shift_rx_en_w),
        .baud_en      (baud_en_w),
        .delay_en     (delay_en_w),
        .reg_en       (reg_en_w)
    );

    delay m1_delay (
        .clk     (clk),
        .rst     (rst),
        .en      (delay_en_w),
        .pulse   (done_1_w)
    );

    baud_rate m2_baud_rate (
        .clk   (clk),
        .rst   (rst),
        .en    (baud_en_w),
        .pulse (baud_clk_w)
    );

    shift_reg m3_shift_reg (
        .clk      (clk),
        .rst      (rst),
        .en       (shift_rx_en_w),
        .baud_clk (baud_clk_w),
        .rx       (rx),
        .done     (done_2_w),
        .dout     (dout_w)
    );

    out_reg m4_out_reg (
        .clk  (clk),
        .rst  (rst),
        .en   (reg_en_w),
        .din  (dout_w),
        .dout (dout)
    );

    or_module m5_or_module (
        .A    (done_1_w),
        .B    (done_2_w),
        .C    (done_3_w),
        .S    (done_w)
    );

    shift_tx_reg m6_shift_tx_reg (
        .clk       (clk),
        .rst       (rst),
        .en        (shift_tx_en_w),
        .clk_baud  (baud_clk_w),
        .data      (dout),
        .tx        (tx),
        .done      (done_3_w)
    );

endmodule
