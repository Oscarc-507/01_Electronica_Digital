module decoder(
	input logic [3:0] in,
	output logic [6:0] out
);
always_comb begin 
	case(in)
		4'h0: out = 7'b011_1111; // 0 126
        4'h1: out = 7'b000_0110; // 1 48
       	4'h2: out = 7'b101_1011; // 2 109
       	4'h3: out = 7'b100_1111; // 3 121
		4'h4: out = 7'b110_0110; // 4 51
		4'h5: out = 7'b110_1101; // 5 91
		4'h6: out = 7'b111_1101; // 6 95
		4'h7: out = 7'b000_0111; // 7 112
		4'h8: out = 7'b111_1111; // 8 127
		4'h9: out = 7'b110_1111; // 9 123
	    4'hA: out = 7'b111_0111; // 10 91
		4'hB: out = 7'b111_1100; // 11 95
		4'hC: out = 7'b011_1001; // 12 112
		4'hD: out = 7'b101_1110; // 13 127
		4'hE: out = 7'b111_1001; // 14 123
		default: out = 7'b0000000; // Apagar todo 
	endcase	
end

endmodule 
