//// Code yourtestbench here
// or browse Examples
`timescale 1ns/1ps

module top_tb();
  
  logic [2:0] A,B;
  logic [6:0] SUM;
  int fail,pass;
  
  typedef enum logic [6:0] {
    cero 	= 7'b011_1111, // 0 126
    uno	 	= 7'b000_0110, //
    dos 	= 7'b101_1011, // 2 109
    tres 	= 7'b100_1111,// 3 121
    cuatro 	= 7'b110_0110, // 4 51
    cinco 	= 7'b110_1101, // 5 91
    seis 	= 7'b111_1101, // 6 95
    siete	= 7'b000_0111, // 7 112
    ocho 	= 7'b111_1111, // 8 127
	nueve 	= 7'b110_1111, // 9 123
    diez 	= 7'b111_0111, // 10 91
    once 	= 7'b111_1100, // 11 95
    doce 	= 7'b011_1001, // 12 112
    trece 	= 7'b101_1110, // 13 127
	catorce = 7'b111_1001, // 14 123
	referencia = 7'b000_0000 // 14 123    
 } disp_num; //variable tipo "display"
  
  top dut(.*);
  
  
  task automatic capture();
    $display("A: %d | B: %d | dec: %d | seg: %b |t: %0t |",A,B,dut.m0.SUM,SUM,$time);
  endtask
  
  task automatic self_check(input logic [2:0] a,input logic [2:0] b,input logic [6:0] sim);
    disp_num out;
//	    logic [3:0]suma;
    
//    suma = a+b; 
    case((a+b))
		4'h0: out = cero; 
        4'h1: out = uno; 
        4'h2: out = dos; 
        4'h3: out = tres;
        4'h4: out = cuatro; 
        4'h5: out = cinco; 
        4'h6: out = seis; 
        4'h7: out = siete; 
        4'h8: out = ocho; 
		4'h9: out = nueve;
      	4'hA: out = diez;
        4'hB: out = once; 
        4'hC: out = doce; 
        4'hD: out = trece; 
		4'hE: out = catorce; 
		default: out = referencia;
	endcase	   
    
    if(sim != out) begin
      $display("[FAILED] %b no es %s/n",sim,out);
      fail++;
    end
    else begin
    	pass++;
    end
    
  endtask

  initial begin
    $dumpfile("ondas.vcd");
    $dumpvars(0,top_tb);
  end
  
  initial begin
	pass=0;
	fail=0; 
    for(int i=0;i<1000;i++) begin
      A = $urandom_range(0,7);
      B = $urandom_range(0,7);
      #10;
      //capture();
      self_check(A,B,SUM);
    end
    
    A = '0;
    B = '0;
    #50;
    $display("# de errores: %d | Pruebas aprobadas: %d",fail,pass);
    $finish;
  end		
  
endmodule
