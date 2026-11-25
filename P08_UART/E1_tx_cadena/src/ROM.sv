module ROM (
    input logic [4:0] address,
    output logic [7:0] data
);

    // Asegúrate de actualizar el ancho del puerto/señal: logic [4:0] address;
    always_comb begin
        case(address)
            5'd0:  data = 8'h4F; // O
            5'd1:  data = 8'h73; // s
            5'd2:  data = 8'h63; // c
            5'd3:  data = 8'h61; // a
            5'd4:  data = 8'h72; // r
            5'd5:  data = 8'h63; // c
            5'd6:  data = 8'h2D; // -
            5'd7:  data = 8'h35; // 5
            5'd8:  data = 8'h30; // 0
            5'd9:  data = 8'h37; // 7
            5'd10: data = 8'h2D; // -
            5'd11: data = 8'h56; // V
            5'd12: data = 8'h4C; // L
            5'd13: data = 8'h53; // S
            5'd14: data = 8'h49; // I
            5'd15: data = 8'h2D; // -
            5'd16: data = 8'h53; // S
            5'd17: data = 8'h45; // E
            5'd18: data = 8'h45; // E
            5'd19: data = 8'h53; // S
            5'd20: data = 8'h0A; // Salto de linea
            
            default: data = 8'h00;
        endcase        
    end
    

endmodule