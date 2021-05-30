`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2021 04:55:01 PM
// Design Name: 
// Module Name: if_id_buf
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


module if_id_buf(clock, instr, opcode, rd, rs, rt, pc_id);
input clock;
input [31:0] instr;

output reg [3:0] opcode;
output reg [5:0] rd, rs, rt;
output reg [31:0] pc_id;

always@(posedge clock)
begin
    opcode = instr[31:28];
    rd = instr[27:22];
    rs = instr[21:16];
    rt = instr[15:10];
end
endmodule
