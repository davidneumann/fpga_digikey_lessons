// Use a button as a clock signal for a 4-bit counter displayed on 4 LEDs

module button_counter (

    //Inputs
    input        [1:0]   pmod,

    //Outputs
    output  reg  [3:0]   led
);

    wire rst;

    // Reset is the inverse of the first button
    assign rst = ~pmod[0];

    // Clock is the inverse of the second button
    assign clk = ~pmod[1];

    // Count up on clock rising edge or reset on reset button push
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            led <= 4'b0;
        end else begin
            led <= led + 1'b1;
        end
    end
endmodule
