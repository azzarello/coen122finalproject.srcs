`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 03:52:59 PM
// Design Name: 
// Module Name: mux_2_1
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


module mux_2_1(d1, d2, sel, out);
input [31:0] d1;
input [31:0] d2;
input sel;
output reg [31:0] out;

always@(d1, d2, sel)
begin
    if (sel ===  1'bx)
        out = d1;
    if (sel == 0)
        out = d1;
    else if (sel == 1)
        out = d2;
end

endmodule