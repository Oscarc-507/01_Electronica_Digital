module mux_decoder(
    input logic [2:0] sel, 
    input logic [3:0] data_c, data_d, data_u,
    output logic[3:0] data
);
    always_comb begin
        unique case (sel) //codificacion one-hot
            3'b001 : data = data_u;
            3'b010 : data = data_d;
            3'b100 : data = data_c;
            default : data = '0;
        endcase
    end

endmodule 