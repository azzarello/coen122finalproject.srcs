`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 04:50:20 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu();
reg [31:0] a, b;
reg [3:0] select;
wire [31:0] out;
wire Z, N;

alu test(select, a, b, out, Z, N);

initial
begin
    a = 'h6;
    b = 'h5;
    
    select = 4'b0000;
    #100;
    
    select = 4'b0001;
    #100;
    
    select = 4'b0010;
    #100;
    
    select = 4'b0011;
    #100;

    select = 4'b0100;
    #100;
    
    a = 'h6;
    b = 'h6;
    select = 4'b0011;
    #100;

end
endmodule

