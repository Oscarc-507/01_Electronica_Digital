module mux_decoder(
    input logic [3:0] sel, 
    input logic [3:0] data_m, data_c, data_d, data_u,
    output logic[3:0] data
);
    always_comb begin
        case (sel)
            4'b0001 : data = data_u;
            4'b0010 : data = data_d;
            4'b0100 : data = data_c;
            4'b1000 : data = data_m;
        endcase
    end

endmodule 