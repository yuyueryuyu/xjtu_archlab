`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 21:06:37
// Design Name: 
// Module Name: counter74x161_sim
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


module counter74x161_sim;
    parameter N = 8;
    parameter M = 48;
    reg CEP, CET, PE, CLK, CR;
    reg [N-1:0] D;
    wire TC;
    wire [N-1:0] Q;
    counter74x161 counter74x161_1(CEP, CET, PE, CLK, CR, D, TC, Q);
    initial begin
        D = 8'b0000_0110; CLK = 0; CEP = 0; CET = 0; PE = 1; CR = 1;
        fork
            repeat(200) #10 CLK = ~CLK;
            #30 CEP = ~CEP;
            #30 CET = ~CET;
            #25 PE = ~PE;
            #35 PE = ~PE;
            #15 CR = ~CR;
            #25 CR = ~CR; 
        join
    end
endmodule
