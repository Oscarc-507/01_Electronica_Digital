module control(
    input logic clk,
    input logic rst,
    input logic done,   
    output logic div_en,
    output logic ramp_en,
    output logic cs
);

typedef enum logic [2:0] { 
    IDLE,
    START,
    SEND,   
    WAIT
} t_state;

t_state state, next_state; 
logic cont_clk;

// main
always_ff @(posedge clk, posedge rst)begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

//wait cycles (2 clk = 74.07 ns @ 27 MHz: cumple t_CSH >= 15 ns y t_IDLE >= 40 ns)
always_ff @(posedge clk,posedge rst ) begin
    if(rst)    
        cont_clk <= 1'b0;
    else if(state == START)
        cont_clk <= 1'b0;
    else if(state == WAIT)
        cont_clk <= ~cont_clk;
end

always_comb begin
    next_state = state;
    case (state)
        IDLE : next_state = START;
        START: next_state = SEND;     
        SEND : if(done) next_state = WAIT;
        WAIT : if(cont_clk == 1'b1) next_state = START;       
        default: next_state = IDLE; 
    endcase
end

assign cs = !(state == START || state == SEND);
assign div_en = (state == SEND);
assign ramp_en = (state == WAIT && cont_clk == 1'b1);   

endmodule