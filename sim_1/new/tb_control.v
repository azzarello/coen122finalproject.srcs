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
    opcode = 4'b1111; // save pc
    #50;
    opcode = 4'b1110; // load
    #50;
    opcode = 4'b0011; // store
    #50;
    opcode = 4'b0100; // add
    #50;
    opcode = 4'b0101; // increment
    #50;
    opcode = 4'b0110; // negate
    #50;
    opcode = 4'b0111; // subtract
    #50;
    opcode = 4'b1000; // jump
    #50;
    opcode = 4'b1001; // branch zero
    #50;
    opcode = 4'b1010; // jump mem
    #50;
    opcode = 4'b1011; // branch neg
    #50;
    opcode = 4'b0000; // noop
    #50;
    $finish;
end
endmodule
