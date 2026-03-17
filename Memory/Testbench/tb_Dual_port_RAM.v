`timescale 1ns / 1ps

module tb_dual_port_ram;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;


// DUT Instantiation
dual_port_ram dut(
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);


// Clock Generation
initial
clk = 0;

always #5 clk = ~clk;



// TASKS

// Write Task
task write_mem(input [3:0] address, input [7:0] data);
begin
    @(negedge clk);
    we = 1;
    addr = address;
    din = data;
end
endtask


// Read Task
task read_mem(input [3:0] address);
begin
    @(negedge clk);
    we = 0;
    addr = address;
end
endtask



// Stimulus
initial
begin

$monitor("time=%0t we=%b addr=%d din=%h dout=%h",
          $time,we,addr,din,dout);


// Write operations
write_mem(4'd0,8'hAA);
#10;

write_mem(4'd1,8'hBB);
#10;

write_mem(4'd2,8'hCC);
#10;


// Read operations
read_mem(4'd0);
#10;

read_mem(4'd1);
#10;

read_mem(4'd2);
#10;

$finish;

end

endmodule
