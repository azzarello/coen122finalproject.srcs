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


module alu(opcode, A, B, Out, Z, N);
    input [2:0] opcode;
    input [31:0] A, B;
    output reg [31:0] Out;
    output reg Z, N;
    
    // selection logic
    always@(opcode, A, B)begin
    if (opcode == 3'b100)
        Out = A + B;
    else if(opcode == 3'b010)
        Out = ~B + 1;
    else if (opcode == 3'b001)
        Out = A + (~B + 1);
    else if (opcode == 3'b111)
        Out = A;

    
    if (Out == 0) begin
        Z = 1;
        N = 0;
    end
    else if (Out[31] == 1'b1) begin
        Z = 0;
        N = 1;
    end
    else begin
        Z = 0;
        N = 0;
    end
    end
endmodule
