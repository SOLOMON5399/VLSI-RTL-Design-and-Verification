module jk_ff (
    input clk,
    input j,
    input k,
    output reg q
);

// Parameter declaration for operations
parameter HOLD   = 2'b00;
parameter RESET  = 2'b01;
parameter SET    = 2'b10;
parameter TOGGLE = 2'b11;

always @(posedge clk)
begin
    case ({j,k})

        HOLD   : q <= q;      // No change
        RESET  : q <= 0;      // Reset
        SET    : q <= 1;      // Set
        TOGGLE : q <= ~q;     // Toggle

        default: q <= q;

    endcase
end

endmodule
