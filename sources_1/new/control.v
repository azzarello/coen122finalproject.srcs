`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2021 03:21:47 PM
// Design Name: 
// Module Name: control
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


module control(opcode, aluOp, memRead, memWrite, aluSrc, writeBackControl, regWrt, branchZero, branchNeg, jump, jumpMem);
input [3:0] opcode;
output reg [2:0] aluOp;
output reg [1:0] writeBackControl;
output reg memRead, memWrite, aluSrc, regWrt, branchZero, branchNeg, jump, jumpMem;

always@(opcode)
begin
    case(opcode)
        4'b1111:
            begin
            aluOp = 0;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end            
    endcase

end
endmodule
