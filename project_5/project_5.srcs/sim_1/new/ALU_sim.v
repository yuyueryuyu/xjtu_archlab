`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 15:01:09
// Design Name: 
// Module Name: ALU_sim
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


module ALU_si;
    reg [3:0] OP;
    reg [31:0] A ,B;
    wire [31:0] F;
    ALU ALU_1(OP,A,B,F);
    initial begin
        OP = 0;
        A = -1;
        B = 2;
        repeat(15) #10 OP = OP + 1;
    end
endmodule
