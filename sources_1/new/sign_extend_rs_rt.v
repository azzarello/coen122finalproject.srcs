`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 11:40:46 AM
// Design Name: 
// Module Name: sign_extend_rs_rt
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


module sign_extend_rs_rt(rs, rt, out);
    
input [5:0] rs, rt;
output reg [31:0] out;

reg [11:0] rs_rt;
always@(rs, rt)
    begin
        rs_rt [5:0] = rt;
        rs_rt [11:6] = rs;
        out <= $unsigned(rs_rt);
    end
endmodule
