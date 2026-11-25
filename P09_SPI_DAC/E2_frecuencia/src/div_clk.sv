module div_clk(
    input  logic clk,
    input  logic rst,
    input  logic en,
    output logic sck,
    output logic pulse
);

logic cont;

always_ff @(posedge clk, posedge rst) begin
    if (rst)
        cont <= 1'b0;
    else if (en)
        cont <= ~cont;
    else
        cont <= 1'b0;
end

assign sck   = cont;
assign pulse = en && cont;

endmodule
