module delay (
    input logic clk,
    input logic rst,
    input logic en,
    output logic pulse
);
//1. numero de pulsos para un bit a 9600 baudios con clk de 27Mhz
// $clog2(N) es el numero de bits necesarios para representar (contar) N
// 27_000_000/(2*9_600) = 1406

localparam int NUM_CLKS = 1406; //agarrar el bit a la mitad del periodo
localparam int WIDTH = $clog2(NUM_CLKS);
logic [WIDTH-1:0] count;

always_ff @(posedge clk,posedge rst) begin
    if (rst)
        count <= '0;
    else if(en)
        count <= count + 1'b1;
    else 
        count <= '0;
end 
//pulso de un solo ciclo
assign pulse = (count == NUM_CLKS-1);

endmodule