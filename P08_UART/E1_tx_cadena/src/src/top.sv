module top(
	input clk,
	input rst,
	output tx
);

    logic done_w;
    logic baud_rate_en_w;    
    //logic rom_reg_en_w;
    logic pulse_w;
    
    logic [4:0] address_w;
    logic [7:0] data_w;
    //logic [7:0] out_reg_w;


    control m0_fsm(
        .clk(clk),
        .rst(rst),
        .done(done_w),
        .address(address_w),
        .baud_rate_en(baud_rate_en_w)
        //.rom_reg_en(rom_reg_en_w)         
    );

    ROM m1_rom(
        .address(address_w),
        .data(data_w)
    );
    /*
    param_reg #(.WIDTH(8)) m2_rom_reg(
        .clk(clk),
        .rst(rst),
        .en(rom_reg_en_w),
        .data_in(data_w),
        .data_out(out_reg_w)     
    );
    */
    baud_rate  m3_baud_rate(
        .clk(clk),
        .rst(rst),
        .en(baud_rate_en_w),
        .pulse(pulse_w)
    );
    
    shift_reg m4_shift_reg(
        .clk(clk),
        .rst(rst),
        .en(baud_rate_en_w),
        .clk_baud(pulse_w),    
        .data(data_w),
        .tx(tx),
        .done(done_w)               
    );



endmodule