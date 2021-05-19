`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 02:42:54 PM
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(d1, d2, d3, d4, sel, out);
input d1, d2, d3, d4;
input [1:0] sel;
output reg out;

always@(d1, d2, d3, d4, sel)
begin
    if (sel == 2'b00)
        out = d1;
    else if (sel == 2'b01)
        out = d2;
    else if (sel == 2'b10)
        out = d3;
    else if (sel == 2'b11)
        out = d4;
end

endmodule
