module ramp_gen (
    input  logic        clk,
    input  logic        rst,
    input  logic        en,        // Pulso de 1 ciclo al finalizar trama SPI
    input  logic [1:0]  res_sel,   // DIP-switch: 00=8b, 01=10b, 10/11=12b
    output logic [11:0] dac_data
);
    // Sincronizador de 2 FF para el DIP-switch (evita metaestabilidad)
    logic [1:0] res_ff1, res_sync;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            res_ff1  <= 2'b10; // Por defecto 12 bits
            res_sync <= 2'b10;
        end else begin
            res_ff1  <= res_sel;
            res_sync <= res_ff1;
        end
    end

    // Selección del paso según la resolución activa
    logic [11:0] step;
    always_comb begin
        case (res_sync)
            2'b00:   step = 12'd16; // 8 bits  (2^4 = 16) -> 256 escalones
            2'b01:   step = 12'd4;  // 10 bits (2^2 = 4)  -> 1024 escalones
            default: step = 12'd1;  // 12 bits (2^0 = 1)  -> 4096 escalones
        endcase
    end

    // Contador único de 12 bits
    logic [11:0] count;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            count <= 12'd0;
        else if (en)
            count <= count + step;
    end

    // Enmascaramiento de LSBs para transición limpia al mover el DIP-switch
    always_comb begin
        case (res_sync)
            2'b00:   dac_data = {count[11:4], 4'b0000}; // 8 bits MSB-justified
            2'b01:   dac_data = {count[11:2], 2'b00};   // 10 bits MSB-justified
            default: dac_data = count;                  // 12 bits completos
        endcase
    end
endmodule
