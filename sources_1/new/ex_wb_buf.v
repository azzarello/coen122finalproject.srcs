`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2021 05:33:09 PM
// Design Name: 
// Module Name: ex_wb_buf
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


module ex_wb_buf(clock, writeBackControl_ex, writeBackControl_wb, regWrt_ex, regWrt_wb, branchZero_ex, branchZero_wb, branchNeg_ex, branchNeg_wb, jump_ex, jump_wb, jumpMem_ex,
          jumpMem_wb, pc_plus_y_ex, pc_plus_y_wb, xrs_ex, xrs_wb, readData_ex, readData_wb, aluResult_ex, aluResult_wb, z_ex, z_wb, n_ex, n_wb, rd_ex, rd_wb);

input clock;  

input [1:0] writeBackControl_ex;
input regWrt_ex, branchZero_ex, branchNeg_ex, jump_ex, jumpMem_ex;
input [31:0] pc_plus_y_ex;
input [31:0] xrs_ex;
input [31:0] readData_ex;
input [31:0] aluResult_ex;
input z_ex, n_ex;

input [5:0] rd_ex;

output reg [1:0] writeBackControl_wb;
output reg regWrt_wb, branchZero_wb, branchNeg_wb, jump_wb, jumpMem_wb;
output reg [31:0] pc_plus_y_wb;
output reg [31:0] xrs_wb;
output reg [31:0] readData_wb;
output reg [31:0] aluResult_wb;
output reg z_wb, n_wb;
output reg [5:0] rd_wb;

always@(posedge clock)
begin
	writeBackControl_wb = writeBackControl_ex;
	regWrt_wb = regWrt_ex;
	branchZero_wb = branchZero_ex;
	branchNeg_wb = branchNeg_ex;
	jump_wb = jump_ex;
	jumpMem_wb = jumpMem_ex;
	pc_plus_y_wb = pc_plus_y_ex;
	xrs_wb = xrs_ex;
	readData_wb = readData_ex;
	aluResult_wb = aluResult_ex;
	z_wb = z_ex;
	n_wb = n_ex;
	rd_wb = rd_ex;
end
endmodule
