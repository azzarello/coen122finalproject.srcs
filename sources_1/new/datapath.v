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

// IF phase

// pc logic
reg [255:0] pc;
addr adder();

wire [31:0] instr;
instruction_memory imem(clock, pc, instr);

// if/id buffer
wire [3:0] opcode;
wire [5:0] rd;
wire [5:0] rs;
wire [5:0] rt;
wire [255:0] pc_id;
if_id_buf(instr, opcode, rd, rs, rt, pc_id);

//ID-EX controls
wire [2:0] aluOp_id;
wire memRead_id, memWrite_id, aluSrc_id;

//ID-WB controls
wire [1:0] writeBackControl_id;
wire regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id;

control ctrl(opcode, aluOp_id, memRead_id, memWrite_id, aluSrc_id, writeBackControl_id, regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id);

//ID - PC + Y
wire [31:0] rs_rt_32;
sign_extend_rs_rt extend1(rs, rt, rs_rt_32);
wire [31:0] pc_plus_y_id;
full_adder_32 addr(rs_rt_32, pc_id, pc_plus_y_id);

//ID - register file
wire [31:0] xrs_id;
wire [31:0] xrt_id; 
register_file rfile(clock, rs, rt, rd, RegWrt, writeData, xrs_id, xrt_id);

//ID - Y
wire [31:0] y_id;
sign_extend_rs(rs, y_id);


// ID/EX - EX control outputs
wire [2:0] aluOp_ex;
wire memRead_ex, memWrite_ex, aluSrc_ex;


//ID/EX - WB control outputs
wire [1:0] writeBackControl_ex;
wire regWrt_ex, branchZero_ex, branchNeg_ex, jump_ex, jumpMem_ex;

// ID/EX - PC + Y output
wire [31:0] pc_plus_y_ex;

// ID/EX - reg file output
wire [31:0] xrs_ex;
wire [31:0] xrt_ex;

// ID/EX - Y output
wire [31:0] y_ex;


id_ex_buf(aluOp_id, aluOp_ex, memRead_id, memRead_ex, memWrite_id, memWrite_ex, aluSrc_id, aluSrc_ex, writeBackControl_id, writeBackControl_ex, regWrt_id, regWrt_ex, branchZero_id, branchZero_ex, branchNeg_id, branchNeg_ex, jump_id, jump_ex, jumpMem_id,
          jumpMem_ex, pc_plus_y_ex, pc_plus_y_id, xrs_id, xrs_ex, xrt_id, xrt_ex, y_id, y_ex);
          
//EX data memory

//EX aluSrc mux

//EX aluResult




endmodule
