module comparator(
	input logic [3:0] cont_d,cont_u,
	output logic clear
);

assign clear = ((cont_d == 4'd5) && (cont_u == 4'd1))? 1'b1 : 1'b0;

endmodule
