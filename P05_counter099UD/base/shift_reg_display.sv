module shift_reg_display(
    input logic clk,rst,
    output logic [1:0] disp_en // disp = {dec,uni}
);
    always_ff @(posedge clk, posedge rst) begin
        if(rst)
            disp_en <= 2'b01;
        else
            disp_en <= {disp_en[0],disp_en[1]};
    end

endmodule