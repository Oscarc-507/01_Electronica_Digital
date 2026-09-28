//reloj de la tang nano 20k = 27 MHz = 37 ns 
module counter25(
  input logic clk,rst,
  output logic div_clk  
);
   //38ns * 2^25 = 1.27s per number / 20s of simulation time
   //logic [24:0] cont;
   
   //38ns * 2^8 = 9.728us per number / 150us of simulation time
   logic [7:0] cont; 
   
   //assign div_clk = cont[24]; 
   
   assign div_clk = cont[7];
   
   always_ff @(posedge clk or posedge rst) begin
      if(rst)
	cont <= '0;
      else 
	cont <= cont + 1'b1;
   end
  
endmodule
