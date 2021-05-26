`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 03:41:40 PM
// Design Name: 
// Module Name: tb_register_file
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


module tb_register_file();

reg clock;
reg [5:0] rs_addr, rt_addr, rd_addr;
reg write;
reg [31:0] data_in;

wire [31:0] rs, rt;

register_file test(clock, rs_addr, rt_addr, rd_addr, write, data_in, rs, rt);

initial
begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial
begin
    //writing 500 to register 10
    write = 1;
    rd_addr = 5'd10;
    data_in = 32'd500;
    #47
    
    //writing 223 to register 12
    rd_addr = 5'd12;
    data_in = 32'd223;
    #47
    
    //reading 500 from rs and 223 from rt
    write = 0;
    rs_addr = 5'd10;
    rt_addr = 5'd12;
    #47;
$finish;
end
endmodule

