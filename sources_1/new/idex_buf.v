`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 10:01:37 AM
// Design Name: 
// Module Name: idex_buf
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


module idex_buf(clk, branch_in, branch_out, mem_read_in, mem_read_out, mem_write_in, mem_write_out, alu_src, select, alu_op_in, alu_op_out);
// define the inputs and outputs
input clk, mem_read_in, mem_write_in, alu_src, branch_in;
output reg mem_read_out, mem_write_out, select, branch_out;
input [1:0] alu_op_in;
output reg [1:0] alu_op_out;

always@(posedge clk)
begin
    mem_read_out = mem_read_in;     // assign the in value to the out value
    mem_write_out = mem_write_in;   // same
    branch_out = branch_in;         // same
    select = alu_src;               // same
    alu_op_out = alu_op_in;         // same
end
endmodule
