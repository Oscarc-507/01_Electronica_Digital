module top(
  input logic [2:0]A,B,
  output logic [6:0]SUM
);
  
  logic [3:0] res_w;
  
  adder3b m0(
    .A(A),
    .B(B),
    .SUM(res_w)
  );
  
  decoder m1(
    .in(res_w),
    .out(SUM)
  );
  
endmodule
  
