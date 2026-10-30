module comparator(
	input logic [3:0] cont_d,cont_u,
	output logic clear
);
logic rstup,rstdwn;

assign rstup = (cont_d == 4'd10 && cont_u == 4'd0) ? 1'b1 : 1'b0;
assign rstdwn = (cont_d == 4'd15 && cont_u == 4'd9) ? 1'b1 : 1'b0;

assign clear = rstup || rstdwn;
endmodule