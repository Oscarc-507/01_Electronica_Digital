module comparator(
	input logic	   up_down,
	input logic [3:0] data,
	output logic	   clear
);

	assign clear = (up_down) ? ((data == 4'd10)? 1'b1 : 1'b0) : ((data == 4'd15)? 1'b1 : 1'b0);

endmodule