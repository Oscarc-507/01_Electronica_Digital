module top(
    input logic clk,
    input logic rst,
    input logic [4:0] duty,
    output logic pwm
);

localparam int WIDTH = 19; 
logic [WIDTH-1:0] count_w;

counter #(.WIDTH(WIDTH)) m0(
    .clk(clk),
    .rst(rst), 
    .count(count_w)
);

comparator #(.WIDTH(WIDTH)) m1(
    .data(count_w),
    .duty(duty),
    .pwm(pwm) 
);

endmodule 