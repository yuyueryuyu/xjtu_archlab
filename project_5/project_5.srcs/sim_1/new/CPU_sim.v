`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 22:05:22
// Design Name: 
// Module Name: CPU_sim
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


module CPU_sim;
    reg clk;
    reg rst;
    CPU_Datapath CPU_1(clk, rst);
    initial begin
        clk = 1;
        rst = 1;
        fork
            #30 rst = 0;
            repeat(200) #10 clk = ~clk;
        join
    end
endmodule
