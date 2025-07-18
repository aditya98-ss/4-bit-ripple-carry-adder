`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 01:11:53
// Design Name: 
// Module Name: tb_ripple_carry_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ripple_carry_adder;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout, Overflow;

    integer i, j, k;

    ripple_carry_adder uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout), .Overflow(Overflow)
    );

    initial begin
        $display(" A     B     Cin | Sum   Cout Overflow");
        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                for (k = 0; k < 2; k = k + 1) begin
                    A = i;
                    B = j;
                    Cin = k;
                    #5;
                    $display("%b  %b   %b   | %b   %b     %b", A, B, Cin, Sum, Cout, Overflow);
                end
        $display("Test Completed");
        $stop;
    end
endmodule

