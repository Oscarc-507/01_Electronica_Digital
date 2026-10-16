module counter4(
	input logic clk,rst,
	input logic up_down,
	output logic [3:0] cont  
);
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst)
            cont <= (up_down)? '0 : 4'd9;
        else  if(up_down) 
            cont <= (cont==4'd10)? (cont <= '0) : (cont + 1'b1);
        else
            cont <= (cont == 4'd15)? (cont <= 4'd9) : (cont - 1'b1);        
    end
    
endmodule