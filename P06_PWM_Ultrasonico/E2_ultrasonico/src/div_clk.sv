module div_clk (
    input logic clk,
    input logic rst,
    output logic trigger,
    output logic div_clk_display
);
// 2^22 * 38e-9 = 159.38 ms 
// 316 * 383-9 = 12 us  
logic [21:0] count; //Muestro cada 159 ms

    always_ff @(posedge clk) begin
        if (rst) begin
            count   <= '0;
            trigger <= 1'b0; 
        end else begin
            count   <= count + 1'b1;
            trigger <= (count < 22'd316);
            //asignar a trigger un pulso de 12 us
        end
    end

    assign div_clk_display = count[16];

endmodule