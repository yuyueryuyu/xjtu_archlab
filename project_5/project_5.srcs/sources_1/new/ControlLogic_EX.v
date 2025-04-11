`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 00:48:16
// Design Name: 
// Module Name: ControlLogic_EX
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


module ControlLogic_EX(
    input [31:0] instr,
    input BrEq, BrLt, 
    output PCSel,
    output [2:0] ImmSel, 
    output BrUn, BSel, ASel, 
    output [3:0] ALUSel
    );
    wire Jump;
    wire [5:0] Branch;
    MainDsc_EX MainDsc_EX_1(instr, Jump, Branch);
    assign PCSel = Jump | (Branch[5] & BrEq) | (Branch[4] & ~BrEq) | (Branch[3] & BrLt) | (Branch[2] & ~BrLt) | (Branch[1] & BrLt) | (Branch[0] & ~BrLt);
endmodule
