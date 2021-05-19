`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 02:43:25 PM
// Design Name: 
// Module Name: twos_complement
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


module twos_complement(in, out);
input [7:0] in;
output reg [7:0] out;
always@(in)
begin
    
end
endmodule


input d1, d2, d3;
input [1:0] sel;
output reg out;

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