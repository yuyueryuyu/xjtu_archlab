`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 13:16:10
// Design Name: 
// Module Name: MainDec_Sim
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


module MainDec_Sim;
     reg [5:0] Op;
     wire MemToReg, MemWriter;
     wire Branch, ALUSrc;
     wire RegDst, RegWrite;
     wire Jump;
     wire [1:0] ALUOp;
     MainDec MainDec_1(Op, MemToReg, MemWriter, Branch, ALUSrc, RegDst, RegWrite, Jump, ALUOp);
     initial begin
        Op = 6'b000000;
        #10 Op = 6'b100011;
        #10 Op = 6'b101011;
        #10 Op = 6'b000100;
        #10 Op = 6'b001000;
        #10 Op = 6'b000010;
        #10 Op = 6'b000011;
     end
endmodule
