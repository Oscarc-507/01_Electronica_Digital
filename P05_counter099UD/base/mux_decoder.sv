module mux_decoder(
    input logic sel, //take units from mux_diplay
    input logic [3:0] data_d, data_u,
    output logic[3:0]data
);
    assign data = (sel)? data_u : data_d; // sel = 1 = units
   
endmodule 