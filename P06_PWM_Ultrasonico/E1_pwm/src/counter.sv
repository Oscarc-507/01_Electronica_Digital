module counter #(
    parameter int WIDTH = 19
)(
    input logic clk,
    input logic rst,
    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk or posedge rst) begin
    if(rst)
        count <= '0;
    else
        count <= count + 1'b1;
end

endmodule 