module shift_reg(
    input logic clk,    
    input logic rst,
    input logic en,
    input logic baud_clk,
    input logic rx,
    output logic done,
    output logic [7:0] dout

);

logic [9:0] tmp;
logic [3:0] cont_bits;

always_ff @(posedge clk, posedge rst) begin
    if(rst) begin
        tmp <= '0;
        cont_bits <= '0;     
    end else if(en) begin
        if(baud_clk) begin
            tmp <= {rx, tmp[9:1]};
            cont_bits <= cont_bits + 1'b1;   
        end  
    end else begin
        cont_bits <= '0;
        tmp <= '0;     
    end
end 

assign dout = tmp[8:1];
assign done = (cont_bits == 9);

endmodule


/*
module shift_reg(
    input logic clk,    
    input logic rst,
    input logic en,
    input logic baud_clk,
    input logic rx,
    output logic done,
    output logic [7:0] dout

);

logic [9:0] tmp;
logic [3:0] cont_bits;

always_ff @(posedge clk, posedge rst) begin
    if(rst) begin
        tmp <= '0;
        cont_bits <= '0;     
    end else if(en) begin
        if(baud_clk) begin
            tmp <= {rx, tmp[9:1]};
            cont_bits <= cont_bits + 1'b1;   
        end  
    end else begin
        cont_bits <= '0;
        tmp <= '0;     
    end
end 

assign dout = tmp[8:1];
assign done = (cont_bits == 10);

endmodule
*/