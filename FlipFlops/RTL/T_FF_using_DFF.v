module dff (
    input clk,
    input reset,
    input d,
    output reg q
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        q <= 0;
    else
        q <= d;
end

endmodule

module tff_structural (
    input clk,
    input reset,
    input t,
    output q
);

wire d;
wire q_int;

xor (d, t, q_int);

dff d1 (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q_int)
);

assign q = q_int;

endmodule
