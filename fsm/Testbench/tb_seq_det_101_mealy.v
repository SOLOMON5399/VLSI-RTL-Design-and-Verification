
module tb_seq_101_moore;

reg clk;
reg rst;
reg x;
wire y;

// Instantiate DUT
seq_101_moore uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

// Clock generation
always #5 clk = ~clk;

// Task to apply input
task apply_input;
input in;
begin
    x = in;
    #10;
end
endtask

initial
begin
    clk = 0;
    rst = 1;
    x = 0;

    $monitor("Time=%0t x=%b y=%b", $time, x, y);

    // Reset
    #10 rst = 0;

    // Apply sequence: 1 0 1 (Detect after 1 cycle delay)
    apply_input(1);
    apply_input(0);
    apply_input(1);

    // Overlapping sequence
    apply_input(0);
    apply_input(1);
    apply_input(0);
    apply_input(1);

    #20 $finish;
end

endmodule
