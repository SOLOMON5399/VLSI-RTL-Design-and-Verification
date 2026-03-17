`timescale 1ns / 1ps

module dual_port_ram(
    input clk,
    input we,
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

reg [7:0] mem [15:0];   // 16 locations, 8-bit each

integer i;

initial
begin
    for(i=0;i<16;i=i+1)
        mem[i] = 0;
end

always @(posedge clk)
begin
    if(we)
        mem[addr] <= din;   // Write operation
    else
        dout <= mem[addr];  // Read operation
end

endmodule
