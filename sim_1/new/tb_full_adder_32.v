`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 03:18:20 PM
// Design Name: 
// Module Name: tb_full_adder_32
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


module tb_full_adder_32();

reg [31:0] a, b;
wire [31:0] out;
wire Z, N;

full_adder_32 test(a, b, out, Z, N);

initial
begin

    a = 1;
    b = 2;
    #50;
    
    a = 0;
    b = 0;
    #50;
    
    a = 1000;
    b = 1;
    #50;

end
endmodule
