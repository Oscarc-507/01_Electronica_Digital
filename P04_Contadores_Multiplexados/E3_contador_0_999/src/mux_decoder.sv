module mux_decoder(
    input logic [2:0] sel, //take units from mux_diplay
    input logic [3:0] data_u,
    input logic [3:0] data_d,
    input logic [3:0] data_c,
    output logic[3:0]data
);
    always_comb begin
        unique case(sel)
            3'b001: data = data_u;
            3'b010: data = data_d;
            3'b100: data = data_c;
            default: data = '0;
        endcase
    end

endmodule 
