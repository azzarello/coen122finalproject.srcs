`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2021 12:54:32 PM
// Design Name: 
// Module Name: pc_register
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


module pc_register(clock, pc_in, pc_out);
input clock;
input [31:0] pc_in;
output reg [31:0] pc_out;

initial
    pc_out = 32'd0;
    
always@(negedge clock)
begin
    if (pc_in[0] != 1'bX)
        pc_out = pc_in;
end
endmodule
