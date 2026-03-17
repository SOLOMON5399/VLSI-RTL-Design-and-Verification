
module tb_dff;

reg clk;
reg reset;
reg d;
wire q;

// Instantiate DUT
dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// TASK to apply input
task apply_input;
input data;
begin
    d = data;
    #10;
end
endtask


// Reset task
task apply_reset;
begin
    reset = 1;
    #10;
    reset = 0;
end
endtask


// Test sequence
initial
begin
    $display("Time\tclk\treset\td\tq");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, reset, d, q);

    d = 0;
    reset = 0;

    // Apply reset
    apply_reset;

    // Apply inputs
    apply_input(0);
    apply_input(1);
    apply_input(0);
    apply_input(1);
    apply_input(1);
    apply_input(0);

    #20 $finish;

end

endmodule
