`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 03:57:18 PM
// Design Name: 
// Module Name: mux_3_1
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


module mux_3_1(d1, d2, d3, sel, out);
input [31:0] d1, d2, d3;
input [1:0] sel;
output reg [31:0] out;

always@(d1, d2, d3, sel)
begin
    if (sel == 2'b00)
        out = d1;
    else if (sel == 2'b01)
        out = d2;
    else if (sel == 2'b10 || sel == 2'b11)
        out = d3;
end

endmodule
