`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 04:26:55 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(clock, addr, data_out);
input clock;
input [7:0] addr;

output reg [31:0] data_out;

reg [31:0] data [255:0];


always@(addr)
begin
	data_out = data[addr];
end

initial
begin
	data[0] = 0;
	data[1] = 0;
	data[2] = 32'b0111_0001_0000_0100_0001_0000_0000_0000; // sub x4, x4, x4
	data[3] = 0;
	data[4] = 0;
	data[5] = 0;
	data[6] = 0;
	data[7] = 32'b0101_0001_0000_0100_1111_1100_0000_0000; // inc x4, x4, -65536
	data[8] = 0;
	data[9] = 0;
	data[10] = 0;
	data[11] = 0;
	data[12] = 32'b0100_0001_0100_0010_0000_1100_0000_0000; // x5 = x2 + x3
	data[13] = 0;
	data[14] = 0;
	data[15] = 0;
	data[16] = 0;
	data[17] = 32'b1111_0010_0100_0000_0010_1000_0000_0000; // svpc x9, 10
	data[18] = 0;
	data[19] = 0;
	data[20] = 0;
	data[21] = 0;
	data[22] = 32'b1111_0010_1000_0000_0101_0100_0000_0000; // svpc x10, 21
	data[23] = 0;
	data[24] = 0;
	data[25] = 0;
	data[26] = 0;
	data[27] = 32'b1110_0001_1000_0010_0000_0000_0000_0000; // ld x6, x2
	data[28] = 0;
	data[29] = 0;
	data[30] = 0;
	data[31] = 0;
	data[32] = 32'b0111_0001_1100_0110_0001_0000_0000_0000; // sub x7, x6, x4
	data[33] = 32'b1011_0000_0000_1010_0000_0000_0000_0000; // brn x10
	data[34] = 0;
	data[35] = 0;
	data[36] = 0;
	data[37] = 0;
	data[38] = 32'b0101_0001_0000_0110_0000_0000_0000_0000; // inc x4, x6, 0
	data[39] = 0;
	data[40] = 0;
	data[41] = 0;
	data[42] = 0;
	data[43] = 32'b0101_0000_1000_0010_0000_0100_0000_0000; // inc x2, x2, 1
	data[44] = 0;
	data[45] = 0;
	data[46] = 0;
	data[47] = 0;
	data[48] = 32'b0111_0010_0000_0010_0001_0100_0000_0000; // sub x8, x2, x5
	data[49] = 32'b1011_0000_0000_1001_0000_0000_0000_0000; // brn x9
	data[50] = 0;
	data[51] = 0;
	data[52] = 0;
	data[53] = 0;
end
endmodule
