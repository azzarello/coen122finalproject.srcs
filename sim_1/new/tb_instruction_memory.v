`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 04:35:25 PM
// Design Name: 
// Module Name: tb_instruction_memory
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


module tb_instruction_memory();
reg clock;
reg [255:0] addr;

wire [31:0] data_out;

instruction_memory test(clock, addr, data_out);

initial
begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial
begin
//    reading 255
    addr = 32'd255;
    #47;
    
//    reading 0
    addr = 32'd0;
    #47;
    
//    reading 100
    addr = 32'd100;
    #47;
        
end


endmodule
