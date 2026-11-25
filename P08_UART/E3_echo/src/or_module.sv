module or_module(
    input logic A,
    input logic B,
    input logic C,   
    output logic S
);

assign S = C | A | B;

endmodule