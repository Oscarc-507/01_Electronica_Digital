module control(
    input logic clk,
    input logic rst,
    input logic echo,
    input logic trigger, // entra trigger para iniciar la medición
    //input logic done,  // indica que el contador ha terminado, 
    output logic clear,
    output logic en
);

typedef enum logic [1:0] {
    IDLE = 2'b00,
    WAIT = 2'b01,
    CONT = 2'b10
} state_t;

state_t state, next_state;
logic [1:0] toggle;

always_ff @(posedge clk) begin //logica para la maquina de estados
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

always_ff @(posedge clk) begin //detector de flanco para echo
    if(rst)
        toggle = '0; //2'b00 echo apagado
    else
        toggle = {toggle[0],echo}; 
        //toggle = 2'b01 cuando hay un flanco de subida
end

always_comb begin 
    en      = 1'b0;
    clear   = 1'b0; // off clear de cm   
    unique case (state)
        IDLE: begin
            if(trigger) begin 
                clear   = 1'b1;   
                // pulso de 1 ciclo de clk para eliminar calculo anterior      
                next_state = WAIT;   
            end else
                next_state = IDLE;     
        end
        WAIT: begin
            if(toggle == 2'b01) //flanco ascendente de echo
                next_state = CONT;
            else
                next_state = WAIT;
        end
        CONT: begin
            en = 1'b1; //mantener habilitada la cuenta 
            if(toggle == 2'b10) //flanco descendente
                next_state = IDLE;
            else
                next_state = CONT;
        end
        default: next_state = IDLE;
    endcase
end

endmodule