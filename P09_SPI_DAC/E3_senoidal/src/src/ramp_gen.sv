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

    // Contador de dirección módulo 40 para la ROM senoidal (40 muestras * 5 us = 200 us -> 5 kHz)
    localparam logic [5:0] ROM_LAST = 6'd39;
    logic [5:0] addr;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            addr <= 6'd0;
        else if (en) begin
            if (addr == ROM_LAST)
                addr <= 6'd0;
            else
                addr <= addr + 6'd1;
        end
    end

    // Memoria ROM de 40 muestras de 12 bits (senoidal 0..4095)
    logic [11:0] rom_data;
    always_comb begin
        case (addr)
            6'd0 : rom_data = 12'd2048;
            6'd1 : rom_data = 12'd2368;
            6'd2 : rom_data = 12'd2680;
            6'd3 : rom_data = 12'd2977;
            6'd4 : rom_data = 12'd3251;
            6'd5 : rom_data = 12'd3495;
            6'd6 : rom_data = 12'd3704;
            6'd7 : rom_data = 12'd3872;
            6'd8 : rom_data = 12'd3995;
            6'd9 : rom_data = 12'd4070;
            6'd10: rom_data = 12'd4095;
            6'd11: rom_data = 12'd4070;
            6'd12: rom_data = 12'd3995;
            6'd13: rom_data = 12'd3872;
            6'd14: rom_data = 12'd3704;
            6'd15: rom_data = 12'd3495;
            6'd16: rom_data = 12'd3251;
            6'd17: rom_data = 12'd2977;
            6'd18: rom_data = 12'd2680;
            6'd19: rom_data = 12'd2368;
            6'd20: rom_data = 12'd2048;
            6'd21: rom_data = 12'd1727;
            6'd22: rom_data = 12'd1415;
            6'd23: rom_data = 12'd1118;
            6'd24: rom_data = 12'd844;
            6'd25: rom_data = 12'd600;
            6'd26: rom_data = 12'd391;
            6'd27: rom_data = 12'd223;
            6'd28: rom_data = 12'd100;
            6'd29: rom_data = 12'd25;
            6'd30: rom_data = 12'd0;
            6'd31: rom_data = 12'd25;
            6'd32: rom_data = 12'd100;
            6'd33: rom_data = 12'd223;
            6'd34: rom_data = 12'd391;
            6'd35: rom_data = 12'd600;
            6'd36: rom_data = 12'd844;
            6'd37: rom_data = 12'd1118;
            6'd38: rom_data = 12'd1415;
            6'd39: rom_data = 12'd1727;
            default: rom_data = 12'd2048;
        endcase
    end

    // Enmascaramiento de LSBs para transición limpia al mover el DIP-switch
    always_comb begin
        case (res_sync)
            2'b00:   dac_data = {rom_data[11:4], 4'b0000}; // 8 bits MSB-justified
            2'b01:   dac_data = {rom_data[11:2], 2'b00};   // 10 bits MSB-justified
            default: dac_data = rom_data;                  // 12 bits completos
        endcase
    end
endmodule
