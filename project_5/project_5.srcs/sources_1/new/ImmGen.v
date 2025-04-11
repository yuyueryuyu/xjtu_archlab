`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 15:38:40
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [31:0] instruction,
    input [2:0] ImmSel,
    output reg [31:0] Immediate
    );
    reg instr8;
    reg [3:0] instr12;
    reg [7:0] instr20;
    reg instr21;
    reg [3:0] instr25;
    reg [5:0] instr31;
    reg instr32;
    
    always@(*) begin
        instr8 = instruction[7];
        instr12 = instruction[11:8];
        instr20 = instruction[19:12];
        instr21 = instruction[20];
        instr25 = instruction[24:21];
        instr31 = instruction[30:25];
        instr32 = instruction[31];
        case(ImmSel)
            3'b000: begin Immediate = {{21{instr32}}, instr31, instr25, instr21}; end
            3'b001: begin Immediate = {{21{instr32}}, instr31, instr12, instr8}; end
            3'b010: begin Immediate = {{20{instr32}}, instr8, instr31, instr12, 1'b0}; end
            3'b011: begin Immediate = {instr32, instr31, instr25, instr21, instr20, 12'b0}; end
            3'b100: begin Immediate = {{12{instr32}}, instr20, instr21, instr31, instr25, 1'b0}; end
            default:begin Immediate = 32'bx; end
        endcase
    end
    
endmodule
