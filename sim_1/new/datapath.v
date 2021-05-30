`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 03:04:58 PM
// Design Name: 
// Module Name: datapath
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


module datapath(clock);
input clock;

//***IF Wires***
wire [31:0] pc_cur, pc_next, pc_plus_1;
wire [31:0] instr;

//***ID Wires***
wire [3:0] opcode;
wire [5:0] rd, rs, rt;
wire [31:0] pc_id;

wire [1:0] writeBackControl_id;
wire regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id;

wire [2:0] aluOp_id;
wire memRead_id, memWrite_id, aluSrc_id;

wire [31:0] rs_rt_32;
wire [31:0] pc_plus_y_id;

wire [31:0] xrs_id;
wire [31:0] xrt_id;

wire [31:0] y_id;

//***EX Wires***
wire [1:0] writeBackControl_ex;
wire regWrt_ex, branchZero_ex, branchNeg_ex, jump_ex, jumpMem_ex;

wire [2:0] aluOp_ex;
wire memRead_ex, memWrite_ex, aluSrc_ex;

wire [31:0] pc_plus_y_ex;

wire [31:0] xrs_ex;
wire [31:0] xrt_ex;

wire [31:0] y_ex;

wire [31:0] readData_ex;

wire [31:0] aluSrcInput, aluResult_ex;
wire z_ex, n_ex;

//WB Wires
wire [1:0] writeBackControl_wb;
wire regWrt_wb, branchZero_wb, branchNeg_wb, jump_wb, jumpMem_wb;

wire [31:0] pc_plus_y_wb;

wire [5:0] xrt_wb;

wire [31:0] readData_wb;

wire [31:0] aluResult_wb;
wire z_wb, n_wb;

//WB/IF Wires
wire [31:0] jumpAddress;
wire branchControl;

//WB/ID Wires
wire [31:0] writeBackData;

//IF components
pc_register pcreg(clock, pc_cur, pc_next);
full_adder_32 pc_addr(pc_cur, 32'd1, pc_plus_1);
mux_2_1 m4(pc_plus_1, jumpAddress, branchControl, pc_next);
instruction_memory imem(clock, pc_next, instr);

//IF/ID buffer
if_id_buf(instr, opcode, rd, rs, rt, pc_id);

//ID components
control ctrl(opcode, aluOp_id, memRead_id, memWrite_id, aluSrc_id, writeBackControl_id, regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id);
sign_extend_rs_rt extend1(rs, rt, rs_rt_32);
full_adder_32 addr(rs_rt_32, pc_id, pc_plus_y_id);
register_file rfile(clock, rs, rt, rd, RegWrt, writeBackData, xrs_id, xrt_id);
sign_extend_rt(rt, y_id);

//ID/EX Buffer
id_ex_buf idexbuf(aluOp_id, aluOp_ex, memRead_id, memRead_ex, memWrite_id, memWrite_ex, aluSrc_id, aluSrc_ex, writeBackControl_id, writeBackControl_ex, regWrt_id, regWrt_ex, branchZero_id, branchZero_ex, branchNeg_id, branchNeg_ex, jump_id, jump_ex, jumpMem_id,
          jumpMem_ex, pc_plus_y_ex, pc_plus_y_id, xrs_id, xrs_ex, xrt_id, xrt_ex, y_id, y_ex);
          
//EX components
data_memory dmem(clock, memWrite_ex, memRead_ex, xrs, xrt, readData_ex);
mux_2_1 aluSrcMux(xrt_ex, y_ex, aluSrc_ex, aluSrcInput);
alu alu1(aluOp_ex, xrs_ex, aluSrc, aluResult_ex, z_ex, n_ex);

//EX/WB Buffer
ex_wb_buf ex_wb_buf1(writeBackControl_ex, writeBackControl_wb, regWrt_ex, regWrt_wb, branchZero_ex, branchZero_wb, branchNeg_ex, branchNeg_wb, jump_ex, jump_wb, jumpMem_ex,
          jumpMem_wb, pc_plus_y_ex, pc_plus_y_wb, xrt_ex, xrt_wb, readData_ex, readData_wb, aluResult_ex, aluResult_wb, z_ex, z_wb, n_ex, n_wb);
          
//WB components
mux_2_1 m2(xrt_wb, readData_wb, jumpMem_wb, jumpAddress);
mux_3_1 m3(xrt_wb, readData_wb, aluResult_wb, writeBackControl_wb, writeBackData);
assign branchControl = (branchZero_wb && z_wb) || (branchNeg_wb && n_wb) || jump_wb;

endmodule
