// Use a button as a clock signal for a 4-bit counter displayed on 4 LEDs

module button_counter (

    //Inputs
    input                pmod,
    input                clk,

    //Outputs
    output  reg  [3:0]   led
);

    wire rst;
    reg [31:0] divider;
    reg div_clk;

    // Reset is the inverse of the first button
    assign rst = ~pmod;

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            divider <= 32'b0;
        end else if (divider == 600000) begin
            div_clk <= ~div_clk;
        end else begin
            divider <= divider + 1;
        end
    end
    // Count up on clock rising edge or reset on reset button push
    always @ (posedge div_clk or posedge rst) begin
        if (rst == 1'b1) begin
            led <= 4'b0;
        end else begin
            led <= led + 1'b1;
        end
    end

endmodule