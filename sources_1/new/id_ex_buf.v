`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2021 04:54:12 PM
// Design Name: 
// Module Name: id_ex_buf
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


module id_ex_buf(clock,aluOp_id, aluOp_ex, memRead_id, memRead_ex, memWrite_id, memWrite_ex, aluSrc_id, aluSrc_ex, writeBackControl_id, writeBackControl_ex, regWrt_id, regWrt_ex, branchZero_id, branchZero_ex, branchNeg_id, branchNeg_ex, jump_id, jump_ex, jumpMem_id,
          jumpMem_ex, pc_plus_y_ex, pc_plus_y_id, xrs_id, xrs_ex, xrt_id, xrt_ex, y_id, y_ex);

input clock;
          
input [1:0] writeBackControl_id;
input regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id;
input [2:0] aluOp_id;
input memRead_id, memWrite_id, aluSrc_id;

input [31:0] pc_plus_y_id;
input [31:0] xrs_id;
input [31:0] xrt_id;
input [31:0] y_id;

output reg [1:0] writeBackControl_ex;
output reg regWrt_ex, branchZero_ex, branchNeg_ex, jump_ex, jumpMem_ex;
output reg [2:0] aluOp_ex;
output reg memRead_ex, memWrite_ex, aluSrc_ex;
output reg [31:0] pc_plus_y_ex;
output reg [31:0] xrs_ex;
output reg [31:0] xrt_ex;
output reg [31:0] y_ex;

always@(posedge clock)
begin
end
endmodule
