`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 11:20:48 AM
// Design Name: 
// Module Name: tb_sign_extend_rt
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


module tb_sign_extend_rt();

reg [5:0] rt;
wire [31:0] out;

sign_extend_rt test(rt, out);

initial
begin
    rt = 6'd0;
    #50;
    rt = 6'd63;
    #50;
    rt = 6'd32;
    #50;
    $finish;
end
endmodule
