`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 01:16:33
// Design Name: 
// Module Name: ControlLogic_M
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


module ControlLogic_M(
    input [31:0] instr,
    output reg MemRW
    );
    reg [6:0] op;
    always@(*) begin
        op = instr[6:0];
        case (op) 
            7'h23 : begin // Store Instructions
                MemRW = 1'b1;
            end
            default: begin
                MemRW = 1'b0;
            end
        endcase
    end
endmodule
