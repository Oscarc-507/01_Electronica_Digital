module counter4(
    input logic clk,
    input logic rst,
    input logic up_down,
    output logic [3:0] cont_u,cont_d,cont_c,cont_m 
);
    
    always_ff @(posedge rst,posedge clk) begin
        if(rst) begin
	        if(up_down) begin
				cont_u <= '0; 
				cont_d <= '0;
				cont_c <= '0; 
				cont_m <= '0;
			end else begin
				cont_u <= 4'd9; 
				cont_d <= 4'd9;
				cont_c <= 4'd9; 
				cont_m <= 4'd9;
			end
        end else if (up_down) begin //si es conteo ascendente
            if(cont_u == 4'd9) begin
	            cont_u <= '0; 
                if(cont_d == 4'd9) begin
                    cont_d <= '0;
                    if(cont_c == 4'd9) begin
                        cont_c <= '0; 
                        if(cont_m == 4'd9) begin
                            cont_m <= '0; 
                        end else begin
                            cont_m <= cont_m + 1'b1;
                        end 
                    end
                    else begin
                        cont_c <= cont_c + 1'b1;
                    end 
                end 
                else begin
                    cont_d <= cont_d + 1'b1;
                end
            end 
            else begin
                cont_u <= cont_u + 1'b1;
            end 
        end else begin
            if(cont_u == 4'd0) begin
	            cont_u <= 4'd9; 
                if(cont_d == 4'd0) begin
                    cont_d <= 4'd9;
                    if(cont_c == 4'd0) begin
                        cont_c <= 4'd9; 
                        if(cont_m == 4'd0) begin
                            cont_m <= 4'd9; 
                        end else begin  
                            cont_m <= cont_m - 1'b1;
                        end
                    end
                    else begin
                        cont_c <= cont_c - 1'b1;
                    end 
                end 
                else begin
                    cont_d <= cont_d - 1'b1;
                end
            end 
            else begin
                cont_u <= cont_u - 1'b1;
            end 
        end
    end
    
endmodule