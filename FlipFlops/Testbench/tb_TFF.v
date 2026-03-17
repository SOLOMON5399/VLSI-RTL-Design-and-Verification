
module tb_tff;

reg clk;
reg reset;
reg t;
wire q;

// DUT Instantiation
tff_structural uut (
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end


// Task : Apply Reset
task apply_reset;
begin
    reset = 1;
    #10;
    reset = 0;
end
endtask


// Task : Apply T input
task apply_t;
input t_in;
begin
    t = t_in;
    #10;
end
endtask


// Test sequence
initial
begin

$display("Time\tclk\treset\tt\tq");
$monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, reset, t, q);

t = 0;
reset = 0;

// Apply reset
apply_reset;

// Apply stimulus
apply_t(0);   // No change
apply_t(1);   // Toggle
apply_t(1);   // Toggle again
apply_t(0);   // Hold state
apply_t(1);   // Toggle
apply_t(1);   // Toggle

#20 $finish;

end

endmodule
