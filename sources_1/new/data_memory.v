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
endmodule
