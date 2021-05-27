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
reg [255:0] pc = 0;

wire[255:0] pc_plus_1;
full_adder_32(pc, 32'd1, pc_plus_1);

wire [31:0] jumpAddress = 0;
wire branchControl = 0;
mux_2_1 m4(pc_plus_1, jumpAddress, branchControl, pc);

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
wire [31:0] writeBackData;
register_file rfile(clock, rs, rt, rd, RegWrt, writeBackData, xrs_id, xrt_id);

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


id_ex_buf idexbuf(aluOp_id, aluOp_ex, memRead_id, memRead_ex, memWrite_id, memWrite_ex, aluSrc_id, aluSrc_ex, writeBackControl_id, writeBackControl_ex, regWrt_id, regWrt_ex, branchZero_id, branchZero_ex, branchNeg_id, branchNeg_ex, jump_id, jump_ex, jumpMem_id,
          jumpMem_ex, pc_plus_y_ex, pc_plus_y_id, xrs_id, xrs_ex, xrt_id, xrt_ex, y_id, y_ex);
          
//EX data memory
wire [31:0] readData_ex, readData_wb;
data_memory dmem(clock, memWrite_ex, memRead_ex, xrs, xrt, readData_ex);


//EX aluSrc mux
wire [31:0] aluSrcInput;
mux_2_1 m1(xrt_ex, y_ex, aluSrc_ex, aluSrcInput);

//EX aluResult
wire[31:0] aluResult_ex, aluResult_wb;
wire z_ex, n_ex, z_wb, n_wb;
alu alu1(aluOp_ex, xrs_ex, aluSrc, aluResult_ex, z_ex, n_ex);

// EX controls to be forwarded to WB
wire [1:0] writeBackControl_wb;
wire regWrt_wb, branchZero_wb, branchNeg_wb, jump_wb, jumpMem_wb;

//PC + y to be forwarded to WB
wire [31:0] pc_plus_y_wb;

//xrt to be forwarded to WB
wire [5:0] xrt_wb;

ex_wb_buf ex_wb_buf1(writeBackControl_ex, writeBackControl_wb, regWrt_ex, regWrt_wb, branchZero_ex, branchZero_wb, branchNeg_ex, branchNeg_wb, jump_ex, jump_wb, jumpMem_ex,
          jumpMem_wb, pc_plus_y_ex, pc_plus_y_wb, xrt_ex, xrt_wb, readData_ex, readData_wb, aluResult_ex, aluResult_wb, z_ex, z_wb, n_ex, n_wb);
          
//Jump Mem mux
wire [31:0] jumpAddress;
mux_2_1 m2(xrt_wb, readData_wb, jumpMem_wb, jumpAddress);


//Write back control
mux_3_1 m3(xrt_wb, readData_wb, aluResult_wb, writeBackControl_wb, writeBackData);

//branching
//TODO add z memory to remember z value of last instruction
wire branchControl = (branchZero_wb && z_wb) || (branchNeg_wb && n_wb) || jump_wb;


endmodule
