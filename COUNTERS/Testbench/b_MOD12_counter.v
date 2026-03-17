module tb_mod12;

reg clk;
reg reset;
reg load;
reg [3:0] data;
wire [3:0] count;

// DUT instantiation
mod12_counter uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .data(data),
    .count(count)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end


// Task : Reset counter
task apply_reset;
begin
    reset = 1;
    #10;
    reset = 0;
end
endtask


// Task : Load value
task load_value;
input [3:0] value;
begin
    load = 1;
    data = value;
    #10;
    load = 0;
end
endtask


// Task : Run counter
task run_counter;
input integer cycles;
integer i;
begin
    for(i=0;i<cycles;i=i+1)
        #10;
end
endtask


// Test sequence
initial
begin

$display("Time\tclk\treset\tload\tdata\tcount");
$monitor("%0t\t%b\t%b\t%b\t%b\t%b",
          $time,clk,reset,load,data,count);

reset = 0;
load = 0;
data = 4'b0000;

// Reset
apply_reset;

// Run counter
run_counter(8);

// Load value
load_value(4'b1001);

// Run again
run_counter(10);

#20 $finish;

end

endmodule
