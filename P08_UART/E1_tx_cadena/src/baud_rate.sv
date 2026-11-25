module baud_rate(
    input logic clk,
    input logic rst,
    input logic en,
    output logic pulse
);
//1. numero de pulsos para un bit a 9600 baudios con clk de 27Mhz
// $clog2(N) es el numero de bits necesarios para representar (contar) N
// 27_000_000/9_600 = 2812.5
localparam int NUM_CLKS = 2812; 
localparam int WIDTH = $clog2(NUM_CLKS);
logic [WIDTH-1:0] count;

always_ff @(posedge clk,posedge rst) begin
    if (rst)
        count <= '0;
    else if(en)
        count <= (count == NUM_CLKS-1)? '0 : count + 1'b1;
end 
//pulso de un solo ciclo
assign pulse = (count == NUM_CLKS-1);

endmodule
