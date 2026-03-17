
`timescale 1ns / 1ps

module async_dual_port_ram(
    input we,
    input [2:0] waddr,
    input [2:0] raddr,
    input [15:0] din,
    output [15:0] dout
);

reg [15:0] mem [7:0];   // 8 locations, 16-bit each


// Write operation (asynchronous write for lab model)
always @(we or waddr or din)
begin
    if(we)
        mem[waddr] = din;
end

// Asynchronous read
assign dout = mem[raddr];

endmodule
