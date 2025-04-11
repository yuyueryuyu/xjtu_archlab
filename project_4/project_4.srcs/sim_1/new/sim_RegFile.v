`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 22:45:49
// Design Name: 
// Module Name: sim_RegFile
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


module sim_RegFile;
    reg CLK, WE3;
    reg [4:0] RA1, RA2, WA3;
    reg [31:0] WD3;
    wire [31:0] RD1, RD2;
    RegFile RegFile_1(CLK, WE3, RA1, RA2, WA3, WD3, RD1, RD2);
    
    initial begin
        CLK = 0; WE3 = 1; RA1 = 0; RA2 = 3; WA3 = 1; 
        WD3 = 32'h1234_5678;
        
        fork
            repeat(210) #5 CLK = ~CLK;
            repeat(100) #10 WD3 = WD3 + 1;
            repeat(31) #14 WA3 = WA3 + 1;
            #420 WE3 = 0;
            repeat(5) #200 RA1 = RA1 + 5;
            repeat(5) #200 RA2 = RA2 + 7;
        join
        
    end
endmodule
