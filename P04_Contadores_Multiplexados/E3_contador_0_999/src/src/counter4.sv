module counter4(
    input logic clk,rst,
    output logic [3:0] cont_u,cont_d,cont_c  
);
    
    always_ff @(posedge rst,posedge clk) begin
        if(rst) begin
            cont_c <= '0; 
            cont_d <= '0; 
            cont_u <= '0; 
        end else if (cont_d == 4'd9 && cont_u == 4'd9) begin
            cont_c <= cont_c + 1'b1;
            cont_d <= '0; 
            cont_u <= '0; 
        end else if (cont_u == 4'd9) begin
            cont_d <= cont_d + 1'b1;
            cont_u <= '0; 
        end else
            cont_u <= cont_u + 1'b1;
    end
    
endmodule
