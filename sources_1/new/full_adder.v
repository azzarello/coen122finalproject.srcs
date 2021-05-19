`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 03:46:26 PM
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
output s, cout;
wire s1, c1, c2;

half_adder gate1(a, b, s1, c1);
half_adder gate2(s1, cin, s, c2);
or gate3(cout, c1, c2);
endmodule
