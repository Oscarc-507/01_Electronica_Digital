module counter4(
  input logic clk,rst,
  output logic [3:0] cont  
);

  always_ff @(posedge clk or posedge rst)
    if(rst)
      cont <= '0;
    else 
      cont <= cont + 1'b1;
  
  
  
endmodule
