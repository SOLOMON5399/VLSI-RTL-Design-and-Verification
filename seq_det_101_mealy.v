`timescale 1ns / 1ps

module seq_101_moore(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [1:0] state, next_state;

// State encoding
parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

// State register
always @(posedge clk or posedge rst)
begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

// Next state logic
always @(*)
begin
    case(state)
        S0: next_state = (x) ? S1 : S0;

        S1: next_state = (x) ? S1 : S2;

        S2: next_state = (x) ? S3 : S0;

        S3: next_state = (x) ? S1 : S2;

        default: next_state = S0;
    endcase
end

// Output logic (Moore)
always @(*)
begin
    case(state)
        S3: y = 1;
        default: y = 0;
    endcase
end

endmodule
