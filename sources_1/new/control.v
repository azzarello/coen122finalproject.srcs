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
        4'b1111: // save pc
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
        4'b1110: // load
            begin
            aluOp = 0;
            memRead = 1;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 2'b01;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
        4'b0011: // store
            begin
            aluOp = 0;
            memRead = 0;
            memWrite = 1;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
        4'b0100: // add
            begin
            aluOp = 3'b100;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 2'b10;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
         4'b0101: // increment
            begin
            aluOp = 3'b100;
            memRead = 0;
            memWrite = 0;
            aluSrc = 1;
            writeBackControl = 2'b10;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
        4'b0110: // negate
            begin
            aluOp = 3'b010;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 2'b10;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
        4'b0111: // subtract
            begin
            aluOp = 3'b001;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 2'b10;
            regWrt = 1;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
        4'b1000: // jump
            begin
            aluOp = 0;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 0;
            branchNeg = 0;
            jump = 1;
            jumpMem = 0;
            end
        4'b1001: // branch if zero
            begin
            aluOp = 3'b001;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 1;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end
            
         4'b1011: // branch if negative
            begin
            aluOp = 3'b000;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 0;
            branchNeg = 1;
            jump = 0;
            jumpMem = 0;
            end
         4'b1010: // jump mem
            begin
            aluOp = 0;
            memRead = 1;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 0;
            branchNeg = 0;
            jump = 1;
            jumpMem = 1;
            end
         4'b0000: // noop
            begin
            aluOp = 0;
            memRead = 0;
            memWrite = 0;
            aluSrc = 0;
            writeBackControl = 0;
            regWrt = 0;
            branchZero = 0;
            branchNeg = 0;
            jump = 0;
            jumpMem = 0;
            end                                                                      
    endcase

end
endmodule
