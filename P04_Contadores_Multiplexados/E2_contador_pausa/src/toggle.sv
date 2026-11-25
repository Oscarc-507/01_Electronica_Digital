module toggle(
    input logic clk,
    input logic rst,
    input logic btn,
    input logic div_clk,
    output logic out
);

typedef enum logic [1:0]{
    IDLE    = 2'b00,
    PAUSE   = 2'b01,
    FWRD    = 2'b10,
    STOP    = 2'b11
} state_t;

    state_t current_state, next_state;

    logic [1:0] reg_div;

    always_ff @(posedge clk, posedge rst) begin 
        if(rst)	
            current_state <= IDLE;
        else
            current_state <= next_state;	
    end
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst)
            reg_div <= 2'b00;
        else
            reg_div <= {reg_div[0],div_clk};  //detector de flancos
        
    end
    
    always_comb begin
        out = 1'b0; // mandar a 0 clk en contadores
        unique case(current_state)
            IDLE: begin
                out = 1'b1; // out =1 pasa clk, out = 0 no cuenta counter25
                if(btn) // Pausar conteo
                    next_state = PAUSE;
                else
                    next_state = IDLE;
            end
            PAUSE: begin
                if(reg_div == 2'b01 && !btn) //flanco ascendente del divisor para antirrebotes
                    next_state = FWRD;
                else
                    next_state = PAUSE;
            end
            FWRD: begin
                if(btn) // Pausar conteo
                    next_state = STOP;
                else
                    next_state = FWRD;
            end
            STOP: begin
                if(reg_div == 2'b01 && !btn) //flanco ascendente del divisor para antirrebotes
                    next_state = IDLE;
                else
                    next_state = STOP;
            end
                    
        endcase
    end

endmodule

