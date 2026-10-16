module counter4(
    input logic clk,rst,
    input logic up_down,
    output logic [3:0] cont  
);
    
    
   
    //EXTRACLASE
    always_ff @(posedge clk,posedge rst) begin
        if(rst)
            cont <= '0;
        else if(up_down)
            cont <= cont + 1'b1;
        else
            cont <= cont - 1'b1;
    end
    

endmodule
