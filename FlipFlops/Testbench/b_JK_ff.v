

module tb_jk_ff;

reg clk;
reg j;
reg k;
wire q;

// Instantiate DUT
jk_ff uut (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end


// Task to apply inputs
task apply_input;
input j_in;
input k_in;
begin
    j = j_in;
    k = k_in;
    #10;
end
endtask


// Test sequence
initial
begin

$display("Time\tclk\tj\tk\tq");
$monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, j, k, q);

j = 0;
k = 0;

// HOLD
apply_input(0,0);

// RESET
apply_input(0,1);

// SET
apply_input(1,0);

// TOGGLE
apply_input(1,1);

// Repeat cases
apply_input(0,0);
apply_input(1,1);

#20 $finish;

end

endmodule
