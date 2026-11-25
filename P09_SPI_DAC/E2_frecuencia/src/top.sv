module top(
    input  logic       clk,
    input  logic       rst,
    output logic       sck,
    output logic       sdi,
    output logic       cs,
    input  logic [1:0] res
);
    logic        div_en;
    logic        ramp_en;
    logic        done;
    logic        pulse;
    logic [11:0] dac_data;

    control m0_control (
        .clk     (clk),
        .rst     (rst),
        .done    (done),
        .div_en  (div_en),
        .ramp_en (ramp_en),
        .cs      (cs)
    );

    div_clk m1_div_clk (
        .clk   (clk),
        .rst   (rst),
        .en    (div_en),
        .sck   (sck),
        .pulse (pulse)
    );

    ramp_gen m2_ramp_gen (
        .clk      (clk),
        .rst      (rst),
        .en       (ramp_en),
        .res_sel  (res),
        .dac_data (dac_data)
    );

    shift_reg m3_shift_reg (
        .clk   (clk),
        .rst   (rst),
        .en    (div_en),
        .pulse (pulse),
        .data  (dac_data),
        .done  (done),
        .sdi   (sdi)
    );

endmodule
