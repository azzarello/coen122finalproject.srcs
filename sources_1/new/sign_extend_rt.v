`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 10:52:50 AM
// Design Name: 
// Module Name: sign_extend_rt
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


module sign_extend_rt(rt, out);
input [5:0] rt;
output reg [31:0] out;

always@(rt)
    begin
        out <= $unsigned(rt);
    end
endmodule
