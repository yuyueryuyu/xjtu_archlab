`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 00:42:34
// Design Name: 
// Module Name: ControlLogic_ID
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


module ControlLogic_ID(
    input [31:0] instr,
    output RegWEn, 
    output [2:0] ImmSel, 
    output BrUn, BSel, ASel, 
    output [3:0] ALUSel, 
    output MemRW, MemC,
    output [1:0] WBSel 
    );
    MainDsc MainDsc_1(instr, RegWEn, ImmSel, BrUn, BSel, ASel, ALUSel, MemRW, MemC, WBSel);
endmodule