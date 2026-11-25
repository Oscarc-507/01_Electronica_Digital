module decoder(
	input logic [7:0]  in,
	output logic [6:0] out
);

always_comb begin 
	case(in)
		8'h61: out = 7'b000_0110; // 'a' -> 1
		8'h62: out = 7'b101_1011; // 'b' -> 2
		8'h63: out = 7'b100_1111; // 'c' -> 3
		8'h64: out = 7'b110_0110; // 'd' -> 4
		8'h65: out = 7'b110_1101; // 'e' -> 5
		8'h66: out = 7'b111_1101; // 'f' -> 6
		8'h67: out = 7'b000_0111; // 'g' -> 7
		8'h68: out = 7'b111_1111; // 'h' -> 8
		8'h69: out = 7'b110_1111; // 'i' -> 9
		8'h6A: out = 7'b111_0111; // 'j' -> 10 (A)
		8'h6B: out = 7'b111_1100; // 'k' -> 11 (b)
		8'h6C: out = 7'b011_1001; // 'l' -> 12 (C)
		8'h6D: out = 7'b101_1110; // 'm' -> 13 (d)
		8'h6E: out = 7'b111_1001; // 'n' -> 14 (E)
		8'h6F: out = 7'b111_0001; // 'o' -> 15 (F)
		default: out = 7'b000_0000; // Apagar todo
	endcase	
end
   
endmodule