`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2021 02:47:05 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(clock, write, read, addr, in, out);

input clock, write, read;
input [31:0] addr;
input [31:0] in;
output reg[31:0] out;

reg [31:0] data [65535:0];
always@(posedge clock)
begin
    if (write == 0)
        out = data[addr[15:0]];
    else if (write == 1)
        data[addr[15:0]] = in;
end
initial
begin
	data[0] = 20123;
	data[1] = 18833;
	data[2] = 39041;
	data[3] = -16424;
	data[4] = 36453;
	data[5] = 11705;
	data[6] = -49943;
	data[7] = 58324;
	data[8] = -35654;
	data[9] = -37822;
	data[10] = -2700;
	data[11] = 2050;
	data[12] = 46716;
	data[13] = -40214;
	data[14] = -19144;
	data[15] = -26370;
	data[16] = -17979;
	data[17] = -26735;
	data[18] = -29557;
	data[19] = 14800;
end
endmodule
