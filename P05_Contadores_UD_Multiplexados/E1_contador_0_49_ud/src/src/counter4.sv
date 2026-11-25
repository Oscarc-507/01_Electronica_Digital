module counter4(
    input logic clk,
    input logic rst,
    input logic up_down,
    output logic [3:0] cont_u,cont_d  
);
    
    always_ff @(posedge rst,posedge clk) begin
        if(rst) begin
	        if(up_down) begin
				cont_d <= '0; 
				cont_u <= '0;
			end else begin
				cont_d <= 4'd4; 
				cont_u <= 4'd9;
			end
        end else if (up_down) begin //si es conteo ascendente
            if(cont_u == 4'd9) begin
	            cont_u <= '0; 
                if(cont_d == 4'd9) begin
                    cont_d <= '0;
                end else begin
                    cont_d <= cont_d + 1'b1;
                end
			end else begin
				cont_u <= cont_u + 1'b1;
            end 
		end else begin
            if(cont_u == 4'd0) begin
	            cont_u <= 4'd9; 
                if(cont_d == 4'd0) begin
                    cont_d <= 4'd4;
                end else begin
                    cont_d <= cont_d - 1'b1;
                end
			end else begin
				cont_u <= cont_u - 1'b1;
            end  
        end
    end
    
endmodule