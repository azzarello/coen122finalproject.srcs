`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 04:50:20 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu();
reg [31:0] a, b;
reg [2:0] opcode;
wire [31:0] out;
wire Z, N;

alu test(opcode, a, b, out, Z, N);

initial
begin
    a = 'd6;
    b = 'd5;
    
    opcode = 3'b100; // add
    #5;
    
    opcode = 3'b010; // negate
    #5;
    
    opcode = 3'b001; // subtract
    #5;
    
    opcode = 3'b000; // nothing
    #5;
    
    opcode = 3'b111; // pass A
    #5;
    
    a = 'd6;
    b = 'd6;
    opcode = 3'b001;;
    #5;
    $finish;
end
endmodule

