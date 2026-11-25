module comparator(
	input logic [3:0] cont_u,
	input logic [3:0] cont_d,
	input logic [3:0] cont_c,
	output logic clear
);

assign clear = ((cont_c == 4'd10) && (cont_d == 4'd0) && (cont_u == 4'd0))? 1'b1 : 1'b0;

endmodule
