`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2021 04:03:02 PM
// Design Name: 
// Module Name: tb_control
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


module tb_control();

reg [3:0] opcode;

wire [2:0] aluOp;
wire [1:0] writeBackControl;
wire memRead, memWrite, aluSrc, regWrt, branchZero, branchNeg, jump, jumpMem;

control test(opcode, aluOp, memRead, memWrite, aluSrc, writeBackControl, regWrt, branchZero, branchNeg, jump, jumpMem);

    
initial
begin
    opcode = 4'b1111;
    #50;
    $finish;
end
endmodule
