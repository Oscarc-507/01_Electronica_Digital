module count #(
    parameter int CLKS_PER_CM = 1566 // 58 us @ 27 MHz (Tang Nano 20K)
)(
    input  logic       clk,
    input  logic       rst,
    input  logic       en,
    output logic [3:0] cont_u, cont_d, cont_c // cm (0 a 400) en BCD
);
    
    //Contador de pulsos de clk, tamano automatizado 
    //logic [$clog2(CLKS_PER_CM)-1:0] clk_cnt;
    //2^11 = 2048 > 1566, cubre lo necesario
    
    logic [16:0] cont_clk;
    logic [8:0]  cont_cm;

    always_ff @(posedge clk) begin
        if (rst) begin
            cont_clk <= '0;
            cont_cm  <= '0;
            cont_u   <= '0;
            cont_d   <= '0;
            cont_c   <= '0;
        end else if (en) begin
            if (cont_cm < 9'd400) begin
                if (cont_clk == CLKS_PER_CM - 1) begin
                    cont_clk <= '0;
                    cont_cm  <= cont_cm + 1'b1;
                    // conversion a BCD
                    if (cont_u == 4'd9) begin
                        cont_u <= 4'd0;
                        if (cont_d == 4'd9) begin
                            cont_d <= 4'd0;
                            cont_c <= cont_c + 1'b1;
                        end else begin
                            cont_d <= cont_d + 1'b1;
                        end
                    end else begin
                        cont_u <= cont_u + 1'b1;
                    end
                end else begin
                    cont_clk <= cont_clk + 1'b1;
                end
            end
        end
    end

endmodule
