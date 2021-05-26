`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2021 03:00:59 PM
// Design Name: 
// Module Name: tb_data_memory
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


module tb_data_memory();
reg clock, write, read;
reg [31:0] addr;
reg [31:0] in;

wire [31:0] out;

data_memory test(clock, write, read, addr, in, out);

initial
begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial
begin
    //writing 500 to address 10
    write = 1;
    addr = 5'd10;
    in = 32'd500;
    #47;
    
    // reading 500 from address 10
    write = 0;
    #47;
end
endmodule
