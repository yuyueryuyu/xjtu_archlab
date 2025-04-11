`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 17:14:02
// Design Name: 
// Module Name: ControlLogic
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


module ControlLogic(
    input [31:0] instr,
    input BrEq, BrLt,
    output PCSel, RegWEn, 
    output [2:0] ImmSel, 
    output BrUn, BSel, ASel, 
    output [3:0] ALUSel, 
    output MemRW, 
    output MemC,
    output [1:0] WBSel 
    );
    wire [7:0] Branch;
    MainDsc MainDsc_1(instr, RegWEn, ImmSel, BrUn, BSel, ASel, ALUSel, MemRW, MemC, WBSel, Branch);
    assign PCSel = Branch[7] | Branch[6] | (Branch[5] & BrEq) | (Branch[4] & ~BrEq) | (Branch[3] & BrLt) | (Branch[2] & ~BrLt) | (Branch[1] & BrLt) | (Branch[0] & ~BrLt);
endmodule
