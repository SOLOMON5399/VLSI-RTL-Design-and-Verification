module alu_tb;

    reg [7:0] A, B;
    reg [2:0] Sel;
    wire [7:0] Result;
    wire Carry;

    alu uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .Carry(Carry)
    );

    initial begin

        $display("Sel A  B  | Result Carry");
        $monitor("%b  %d %d |  %d    %b", Sel, A, B, Result, Carry);

        A = 8'd10; 
        B = 8'd5;

        Sel = 3'b000; #10;   // Add
        Sel = 3'b001; #10;   // Sub
        Sel = 3'b010; #10;   // AND
        Sel = 3'b011; #10;   // OR
        Sel = 3'b100; #10;   // XOR
        Sel = 3'b101; #10;   // NOT
        Sel = 3'b110; #10;   // Left Shift
        Sel = 3'b111; #10;   // Right Shift

        $finish;

    end

endmodule
