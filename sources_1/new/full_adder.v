`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 02:54:23 PM
// Design Name: 
// Module Name: full_adder
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

module full_adder(a, b, cin, s, cout);
input a, b, cin;
output reg s, cout;

always@(a, b, cin)
begin
s = a ^ b ^ cin;
cout = (a & b) | (a & cin) | (b & cin);
end
endmodule
