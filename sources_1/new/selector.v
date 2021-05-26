`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 02:34:59 PM
// Design Name: 
// Module Name: selector
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


module selector(select, out2_1, out3_1);
input [3:0] select;
output reg out2_1;
output reg [1:0] out3_1;

always@(select)
begin
    if(select == 3'b100) begin
        // Logic for addition
        // select B from 2_1 and A from 3_1
        out2_1 = 0;
        out3_1 = 2'b00;
    end
    else if(select == 3'b010) begin
        // select 0 from 2_1 and -A from 3_1
        out2_1 = 1;
        out3_1 = 2'b10;
    end
    else if(select == 4'b0011) begin
        // select B from 2_1 and -A from 3_1
        out2_1 = 0;
        out3_1 = 2'b10;
    end
    else if(select == 4'b0100) begin
        // select 0 from 2_1 and A from 3_1
        out2_1 = 1;
        out3_1 = 2'b00;
    end
end
endmodule
