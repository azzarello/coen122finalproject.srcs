`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 03:26:13 PM
// Design Name: 
// Module Name: full_adder_32
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


module full_adder_32(a, b, s);
input [31:0] a;
input [31:0] b;
output [31:0] s;
wire [31:0] c;

full_adder x1(a[0], b[0], 0, s[0], c[0]);
full_adder x2(a[1], b[1], c[0], s[1], c[1]);
full_adder x3(a[2], b[2], c[1], s[2], c[2]);
full_adder x4(a[3], b[3], c[2], s[3], c[3]);
full_adder x5(a[4], b[4], c[3], s[4], c[4]);
full_adder x6(a[5], b[5], c[4], s[5], c[5]);
full_adder x7(a[6], b[6], c[5], s[6], c[6]);
full_adder x8(a[7], b[7], c[6], s[7], c[7]);
full_adder x9(a[8], b[8], c[7], s[8], c[8]);
full_adder x10(a[9], b[9], c[8], s[9], c[9]);
full_adder x11(a[10], b[10], c[9], s[10], c[10]);
full_adder x12(a[11], b[11], c[10], s[11], c[11]);
full_adder x13(a[12], b[12], c[11], s[12], c[12]);
full_adder x14(a[13], b[13], c[12], s[13], c[13]);
full_adder x15(a[14], b[14], c[13], s[14], c[14]);
full_adder x16(a[15], b[15], c[14], s[15], c[15]);
full_adder x17(a[16], b[16], c[15], s[16], c[16]);
full_adder x18(a[17], b[17], c[16], s[17], c[17]);
full_adder x19(a[18], b[18], c[17], s[18], c[18]);
full_adder x20(a[19], b[19], c[18], s[19], c[19]);
full_adder x21(a[20], b[20], c[19], s[20], c[20]);
full_adder x22(a[21], b[21], c[20], s[21], c[21]);
full_adder x23(a[22], b[22], c[21], s[22], c[22]);
full_adder x24(a[23], b[23], c[22], s[23], c[23]);
full_adder x25(a[24], b[24], c[23], s[24], c[24]);
full_adder x26(a[25], b[25], c[24], s[25], c[25]);
full_adder x27(a[26], b[26], c[25], s[26], c[26]);
full_adder x28(a[27], b[27], c[26], s[27], c[27]);
full_adder x29(a[28], b[28], c[27], s[28], c[28]);
full_adder x30(a[29], b[29], c[28], s[29], c[29]);
full_adder x31(a[30], b[30], c[29], s[30], c[30]);
full_adder x32(a[31], b[31], c[30], s[31], c[31]);


endmodule
