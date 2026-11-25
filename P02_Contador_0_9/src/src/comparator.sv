module comparator(
	input logic [3:0] data,
	output logic clear
);

assign clear = (data == 4'd7)? 1'b1 : 1'b0; //'till 12

endmodule