module up_counter_4bit (
    input clk,
    input reset,
    input load,
    input [3:0] data,
    output reg [3:0] count
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 4'b0000;     // Reset counter
    else if (load)
        count <= data;        // Load external value
    else
        count <= count + 1;   // Increment
end

endmodule
