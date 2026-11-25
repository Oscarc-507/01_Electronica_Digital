module shift_reg_display(
    input logic clk,rst,
    output logic [3:0] disp_en // disp = {dec,uni}
);
    always_ff @(posedge clk, posedge rst) begin
        if(rst)
            disp_en <= 4'b0001;
        else
            disp_en <= {disp_en[2:0],disp_en[3]};
    end

endmodule