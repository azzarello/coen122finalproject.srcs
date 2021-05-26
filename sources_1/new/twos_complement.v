`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 02:59:04 PM
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
input [31:0] in;
output wire [31:0] out;
wire N, Z;

reg [31:0] a_flipped;


full_adder_32 adder(a_flipped, 1, out, Z, N);

always@(in)
begin
    a_flipped = in ^ 32'hFFFFFFFF;
end
endmodule

