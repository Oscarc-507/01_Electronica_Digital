module control(
    input logic clk,
    input logic rst,
    input logic rx,
    input logic done,
    output logic shift_rx_en, //tx
    output logic shift_tx_en, //tx
    output logic baud_en,  // tx y rx
    output logic delay_en,
    output logic reg_en
);

typedef enum logic [2:0] { 
    IDLE,
    START,
    DELAY,
    RECEIVE,
    WAIT,
    LOAD,
    SEND,
    NEXT
} t_state;

t_state state, next_state;

always_ff @(posedge clk, posedge rst) begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

always_comb begin 
    next_state = state;
    case (state)
        IDLE: next_state = START;
        START:      if(!rx) next_state = DELAY;
        DELAY:      if(done) next_state = RECEIVE;
        RECEIVE:    if(done) next_state = WAIT;
        WAIT:       next_state = LOAD;
        LOAD:       next_state = SEND;      
        SEND:       if(done) next_state = NEXT;     
        NEXT: next_state = START;
        default: next_state = IDLE; 
    endcase
end


assign delay_en = (state == DELAY);
assign baud_en  = (state == RECEIVE | state == SEND);
assign shift_rx_en = (state == RECEIVE);
assign shift_tx_en = (state == SEND);
assign reg_en   = (state == WAIT);
    
endmodule