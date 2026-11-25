module shift_reg_display(
    input logic clk,rst,
    output logic [2:0] disp_en // disp = {dec,uni}
);
    always_ff @(posedge clk, posedge rst) begin
        if(rst)
            disp_en <= 3'b001;
        else
            disp_en <= {disp_en[1:0],disp_en[2]};
    end

endmodule
