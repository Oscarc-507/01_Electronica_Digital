module div_clk(
    input logic clk,
    input logic rst,
    input logic en,
    output logic sck,
    output logic pulse  
);

logic [2:0] cont;  

always_ff @(posedge clk, posedge rst) begin
    if(rst)
        cont <= '0;
    else if(en)
        cont <= cont + 1'b1;
    else 
        cont <= '0;
end

assign sck = cont[2]; 
assign pulse = en && (cont == 3'd7);

endmodule
