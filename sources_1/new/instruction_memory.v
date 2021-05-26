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
input [255:0] addr;

output reg [31:0] data_out;

reg [31:0] data [255:0];

integer i;

initial
begin
    for(i= 0; i < 256; i = i + 1)
    begin
        data[i] = i;
    end
end

always@(posedge clock)
begin
    data_out = data[addr];
end
endmodule
