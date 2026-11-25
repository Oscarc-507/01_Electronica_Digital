module comparator #(
    parameter int WIDTH = 19
) (
    input logic [WIDTH-1:0] data,
    input logic [4:0] duty,
    output logic pwm
);

always_comb begin
    case (duty)
        5'd0:  pwm = (data <= 16200);
        5'd1:  pwm = (data <= 17942);
        5'd2:  pwm = (data <= 19684);
        5'd3:  pwm = (data <= 21426);
        5'd4:  pwm = (data <= 23168);
        5'd5:  pwm = (data <= 24910);
        5'd6:  pwm = (data <= 26652);
        5'd7:  pwm = (data <= 28394);
        5'd8:  pwm = (data <= 30135);
        5'd9:  pwm = (data <= 31877);
        5'd10: pwm = (data <= 33619);
        5'd11: pwm = (data <= 35361);
        5'd12: pwm = (data <= 37103);
        5'd13: pwm = (data <= 38845);
        5'd14: pwm = (data <= 40587);
        5'd15: pwm = (data <= 42329);
        5'd16: pwm = (data <= 44071);
        5'd17: pwm = (data <= 45813);
        5'd18: pwm = (data <= 47555);
        5'd19: pwm = (data <= 49297);
        5'd20: pwm = (data <= 51039);
        5'd21: pwm = (data <= 52781);
        5'd22: pwm = (data <= 54523);
        5'd23: pwm = (data <= 56265);
        5'd24: pwm = (data <= 58006);
        5'd25: pwm = (data <= 59748);
        5'd26: pwm = (data <= 61490);
        5'd27: pwm = (data <= 63232);
        5'd28: pwm = (data <= 64974);
        5'd29: pwm = (data <= 66716);
        5'd30: pwm = (data <= 68458);
        5'd31: pwm = (data <= 70200);
        default: pwm = (data <= 16200);
    endcase
end

endmodule