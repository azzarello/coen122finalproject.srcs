`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 03:18:33 PM
// Design Name: 
// Module Name: register_file
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


module register_file(clock, rs_addr, rt_addr, rd_addr, write, data_in, rs, rt); 
    input clock;
    input [5:0] rs_addr, rt_addr, rd_addr;
    input write;
    input [31:0] data_in;
    
    output reg [31:0] rs, rt;
    
    reg [31:0] data [64:0]; //storage for module 2
    
    always@(posedge clock)
    begin
        if (write == 1)
            data[rd_addr] = data_in;
    end
    
    always@(rs_addr, rt_addr) begin
        rs = data[rs_addr];
        rt = data[rt_addr];
    end
        
    initial
    begin
	    data[0] = 0;
	    data[2] = 0;
	    data[3] = 19;
	    data[4] = 0;
    end
endmodule
