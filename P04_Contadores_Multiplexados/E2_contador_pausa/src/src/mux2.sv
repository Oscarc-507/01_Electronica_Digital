module mux2(
    input logic sel,
    input logic a,
    output logic out
);

assign out = (sel)? a : 1'b0;

endmodule
