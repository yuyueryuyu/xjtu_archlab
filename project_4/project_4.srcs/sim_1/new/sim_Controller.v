`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 13:36:20
// Design Name: 
// Module Name: sim_Controller
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


module sim_Controller;
    reg [5:0] Op, Funct;
    reg Zero;
    wire MemToReg, MemWriter;
    wire PCSrc, ALUSrc;
    wire RegDst, RegWrite;
    wire Jump;
    wire [2:0] ALUControl;
    Controller Controller_1(Op, Funct, Zero, MemToReg, MemWriter, PCSrc, ALUSrc, RegDst, RegWrite, Jump, ALUControl);
    initial begin
        Op = 6'b001101;
        Funct = 6'b000001;
        Zero = 0;
        #10 begin
            Op = 6'b000000;
            Funct = 6'b100001;
        end
        #10 begin
            Op = 6'b000000;
            Funct = 6'b100011;
        end
        #10 begin
            Op = 6'b101011;
            Funct = 6'b000000;
        end
        #10 begin
            Op = 6'b100011;
            Funct = 6'b000000;
        end
        #10 begin
            Op = 6'b000100;
            Funct = 6'b001000;
            Zero = 1;
        end
        #10 begin
            Op = 6'b000100;
            Funct = 6'b100100;
        end
        #10 begin
            Op = 6'b001111;
            Funct = 6'b001010;
        end
        #10 begin
            Op = 6'b000100;
            Funct = 6'b001000;
            Zero = 0;
        end
        #10 begin
            Op = 6'b000000;
            Funct = 6'b000000;
        end
    end
endmodule
