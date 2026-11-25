module shift_tx_reg(
    input logic clk,
    input logic rst,
    input logic en,
    input logic clk_baud,
    input logic [7:0] data,   
    output logic tx,
    output logic done
);
    
    logic [9:0] tmp;
    logic [3:0] cont_bits;

    always_ff @(posedge clk,posedge rst) begin
        if(rst) begin
            tmp <= '0;   
            cont_bits <= 4'b0;      
        end else if(!en) begin
            tmp <= {1'b1,data,1'b0}; //Inicializar cuando no esta habilitado    
            cont_bits <= '0;
        end else if(clk_baud) begin 
            if(cont_bits <= 4'd10) begin// se han enviado todos los datos
                cont_bits <= cont_bits + 1'b1;
                tmp <= {tmp[0],tmp[9:1]};
            end    
        end
    end 

assign tx   = (en && cont_bits < 4'd10)? tmp[0] : 1'b1; // si en=1 en t=0 se envia un 0
assign done = (cont_bits == 4'd10);

endmodule 