//reloj de la tang nano 20k = 27 MHz = 37 ns 
module counter25(
    input logic clk,rst,
    output logic div_clk,
    output logic div_clk_disp  
);
    //38ns * 2^25   = 1.27 s per number / 20s of simulation time
    //38ns * 2^8    = 9.728 us per number / 150us of simulation time
    //38ns * 2^17   = 4.98 ms per unit/dec  
    logic [7:0] cont; 
    //logic [24:0] cont;
   
    //assign div_clk = cont[22];
    assign div_clk = cont[7];
    
    assign div_clk_disp = cont[7];
    //assign div_clk_disp = cont[17];
    
    always_ff @(posedge clk,posedge rst) begin
        if(rst)
	       cont <= '0;
        else 
	   cont <= cont + 1'b1;
    end
  
endmodule
