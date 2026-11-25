module control(
    input logic clk,
    input logic rst,
    input logic done,
    output logic [4:0] address, // direccion (sel) hacia la ROM
    output logic baud_rate_en //habilita baud rate y shift reg
    //output logic rom_reg_en  
);

    typedef enum logic [1:0] {
        IDLE,   // Setea variables
        START,  // empieza el envio 
        SEND,   // espera a que termine el caracter
        NEXT    // avanza la direccion o termina
    } state_t;

    state_t state, next_state;

    logic [4:0] cont_char;

    // Registro de estado
    always_ff @(posedge clk or posedge rst) begin
        if (rst) state <= IDLE;
        else     state <= next_state;
    end

    // Contador de direccion de memoria
    always_ff @(posedge clk, posedge rst) begin
        if (rst)                
            address <= 4'd0;
        else if (state == IDLE) 
            address <= 4'd0;
        else if (state == NEXT) 
            address <= address + 4'd1;
    end

    // Contador de caracteres
    always_ff @(posedge clk, posedge rst) begin
        if (rst)                
            cont_char <= 5'd0;
        else if (state == IDLE) 
            cont_char <= 5'd0;
        else if (state == NEXT) 
            cont_char <= cont_char + 5'd1;
    end

    // Logica de siguiente estado
    always_comb begin
        next_state = state;
        baud_rate_en = 1'b0;
        //rom_reg_en = 1'b0;
        case (state)
            IDLE: begin
                next_state = START;
            end
            START: begin
                //rom_reg_en = 1'b1; // cargar valores de la ROM
                // si aun no han pasado los 10 caracteres
                if (cont_char < 5'd21) next_state = SEND;//LOAD; 
            
            end
            //LOAD: next_state = SEND;
            SEND: begin
                baud_rate_en = 1'b1; // habilitar baud rate y shift reg
                if (done) next_state = NEXT;
            end
            NEXT: begin
                //baud_rate_en = 1'b1; // habilitar baud rate y shift reg
                next_state = START; // termina la trama e incrementa address
            end
            default: next_state = IDLE;
        endcase
    end

endmodule
