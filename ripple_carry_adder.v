`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 01:10:50
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder (
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout,
    output       Overflow
);
    wire C0, C1, C2, C3;

    // Full Adder A (LSB)
    full_adder FA_A (
        .A(A[0]), .B(B[0]), .Cin(Cin),
        .Sum(Sum[0]), .Cout(C0)
    );

    // Full Adder B
    full_adder FA_B (
        .A(A[1]), .B(B[1]), .Cin(C0),
        .Sum(Sum[1]), .Cout(C1)
    );

    // Full Adder C
    full_adder FA_C (
        .A(A[2]), .B(B[2]), .Cin(C1),
        .Sum(Sum[2]), .Cout(C2)
    );

    // Full Adder D (MSB)
    full_adder FA_D (
        .A(A[3]), .B(B[3]), .Cin(C2),
        .Sum(Sum[3]), .Cout(C3)
    );

    // Final carry-out and overflow detection
    assign Cout = C3;
    assign Overflow = Cout ^ C2;

endmodule
