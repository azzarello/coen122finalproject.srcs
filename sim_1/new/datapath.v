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


module datapath();
reg clock;

//***IF Wires***
wire [31:0] pc_in, pc_out, pc_plus_1;
wire [31:0] instr;

//***ID Wires***
wire [3:0] opcode;
wire [5:0] rd_id, rs, rt;
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

wire [5:0] rd_ex;
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

wire [5:0] rd_wb;
wire [31:0] xrs_wb;

wire [31:0] readData_wb;

wire [31:0] aluResult_wb;
wire z_wb, n_wb;

//WB/IF Wires
wire [31:0] jumpAddress;
wire branchControl;

//WB/ID Wires
wire [31:0] writeBackData;

//IF components
pc_register pcreg(clock, pc_in, pc_out);
full_adder_32 pc_addr(pc_out, 32'd1, pc_plus_1);
mux_2_1 m4(pc_plus_1, jumpAddress, branchControl, pc_in);
instruction_memory imem(clock, pc_out[7:0], instr);

//IF/ID buffer
if_id_buf ifidbuf(clock, instr, opcode, rd_id, rs, rt, pc_out, pc_id);

//ID components
control ctrl(opcode, aluOp_id, memRead_id, memWrite_id, aluSrc_id, writeBackControl_id, regWrt_id, branchZero_id, branchNeg_id, jump_id, jumpMem_id);
sign_extend_rs_rt extend1(rs, rt, rs_rt_32);
full_adder_32 addr(rs_rt_32, pc_id, pc_plus_y_id);
register_file rfile(clock, rs, rt, rd_wb, regWrt_wb, writeBackData, xrs_id, xrt_id);
sign_extend_rt extend2(rt, y_id);

//ID/EX Buffer
id_ex_buf idexbuf(clock, aluOp_id, aluOp_ex, memRead_id, memRead_ex, memWrite_id, memWrite_ex, aluSrc_id, aluSrc_ex, writeBackControl_id, writeBackControl_ex, regWrt_id, regWrt_ex, branchZero_id, branchZero_ex, branchNeg_id, branchNeg_ex, jump_id, jump_ex, jumpMem_id,
          jumpMem_ex, pc_plus_y_ex, pc_plus_y_id, xrs_id, xrs_ex, xrt_id, xrt_ex, y_id, y_ex, rd_id, rd_ex);
          
//EX components
data_memory dmem(clock, memWrite_ex, memRead_ex, xrs_ex, xrt_ex, readData_ex);
mux_2_1 aluSrcMux(xrt_ex, y_ex, aluSrc_ex, aluSrcInput);
alu alu1(aluOp_ex, xrs_ex, aluSrcInput, aluResult_ex, z_ex, n_ex);

//EX/WB Buffer
ex_wb_buf ex_wb_buf1(clock, writeBackControl_ex, writeBackControl_wb, regWrt_ex, regWrt_wb, branchZero_ex, branchZero_wb, branchNeg_ex, branchNeg_wb, jump_ex, jump_wb, jumpMem_ex,
          jumpMem_wb, pc_plus_y_ex, pc_plus_y_wb, xrs_ex, xrs_wb, readData_ex, readData_wb, aluResult_ex, aluResult_wb, z_ex, z_wb, n_ex, n_wb, rd_ex, rd_wb);
          
//WB components
mux_2_1 m2(xrs_wb, readData_wb, jumpMem_wb, jumpAddress);
mux_3_1 m3(xrs_wb, readData_wb, aluResult_wb, writeBackControl_wb, writeBackData);
assign branchControl = (branchZero_wb && z_wb) || (branchNeg_wb && n_wb) || jump_wb;


integer i;
initial
begin
    clock = 0;
    #5
    for (i = 0; i < (2 * 63); i = i + 1) begin
        clock = ~clock;
        #5;
    end
    $finish;
end

endmodule
