`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 16:03:07
// Design Name: 
// Module Name: ImmGen_sim
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


module ImmGen_sim;
    reg [31:0] instruction;
    reg [2:0] ImmSel;
    wire [31:0] Immediate;
    ImmGen ImmGen_1(instruction, ImmSel, Immediate);
    initial begin
        instruction = 32'h018000ef;
        ImmSel = 3'b100;
    end
endmodule
