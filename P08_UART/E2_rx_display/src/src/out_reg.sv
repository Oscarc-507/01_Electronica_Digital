module out_reg(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0] din,
    output logic [7:0] dout
);

always_ff @(posedge clk, posedge rst) begin
    if(rst)
        dout <= '0;
    else if(en)
        dout <= din;
end 

endmodule