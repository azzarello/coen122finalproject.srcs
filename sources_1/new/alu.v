`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 04:04:58 PM
// Design Name: 
// Module Name: alu
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


module alu(select, A, B, Out, Z, N);
    input [3:0] select;
    input [31:0] A, B;
    output wire [31:0] Out;
    output wire Z, N;
    
    // selection logic
    wire in_2_1;
    wire [1:0] in_3_1;
    selector sel(select, in_2_1, in_3_1);
    
    // 2_1 mux
    wire [31:0] out_2_1;
    mux_2_1 m1(B, 0, in_2_1, out_2_1);
    
    
    wire [31:0] neg_A; 
    twos_complement comp(A, neg_A);
    
    // 3_1 mux
    wire [31:0] out_3_1;
    mux_3_1 m2(A, 1, neg_A, in_3_1, out_3_1);
    
    
    full_adder_32 addr(out_2_1, out_3_1, Out, Z, N);
    
endmodule
