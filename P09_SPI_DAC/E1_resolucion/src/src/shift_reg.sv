module shift_reg (
    input  logic        clk,
    input  logic        rst,
    input  logic        en,
    input  logic        pulse,
    input  logic [11:0] data,
    output logic        done,
    output logic        sdi
);
    localparam logic [3:0] CONFIG_DATA = 4'b0011;

    logic [3:0]  cont_bits;
    logic [15:0] tmp;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            tmp       <= '0;
            cont_bits <= '0;
        end else if (!en) begin
            tmp       <= {CONFIG_DATA, data};
            cont_bits <= '0;
        end else if (pulse) begin
            tmp       <= {tmp[14:0], 1'b0};
            cont_bits <= cont_bits + 4'd1;
        end
    end

    assign sdi  = tmp[15];
    assign done = en && pulse && (cont_bits == 4'd15);

endmodule
