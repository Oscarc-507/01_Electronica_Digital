module toggle(
    input logic [3:0] data,
    output logic        up_down
);
   
always_comb begin
    if (data == 4'd0)
        up_down = 1'b1;
    else if (data == 4'd5)
        up_down = 1'b0;
end

endmodule
