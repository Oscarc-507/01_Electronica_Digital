module bcd7seg(
	input logic [3:0] in,
	output logic a,b,c,d,e,f,g
);

always_comb begin 
	case(in)
		4'h0: {a, b, c, d, e, f, g} = 7'b1111110; // 0
        4'h1: {a, b, c, d, e, f, g} = 7'b0110000; // 1
        4'h2: {a, b, c, d, e, f, g} = 7'b1101101; // 2
        4'h3: {a, b, c, d, e, f, g} = 7'b1111001; // 3
        4'h4: {a, b, c, d, e, f, g} = 7'b0110011; // 4
        4'h5: {a, b, c, d, e, f, g} = 7'b1011011; // 5
        4'h6: {a, b, c, d, e, f, g} = 7'b1011111; // 6
        4'h7: {a, b, c, d, e, f, g} = 7'b1110000; // 7
        4'h8: {a, b, c, d, e, f, g} = 7'b1111111; // 8
		4'h9: {a, b, c, d, e, f, g} = 7'b1111011; // 9
		default: {a, b, c, d, e, f, g} = 7'b0000000; // Apagar todo 
	endcase	
end

endmodule