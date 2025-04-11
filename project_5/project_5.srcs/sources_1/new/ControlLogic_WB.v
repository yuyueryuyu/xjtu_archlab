`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 01:18:35
// Design Name: 
// Module Name: ControlLogic_WB
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


module ControlLogic_WB(
    input [31:0] instr,
    output reg [1:0] WBSel
    );
    reg [6:0] op;
    always@(*) begin
        op = instr[6:0];
        case (op) 
            7'h13 : begin // I
                WBSel = 2'b01;
            end
            7'h33 : begin // R
                WBSel = 2'b01;
            end
            7'h63 : begin // B
                WBSel = 2'b11;
            end
            7'h03 : begin // Load Instructions
                WBSel = 2'b00;
            end
            7'h23 : begin // Store Instructions
                WBSel = 2'b11;
            end
            7'h6F : begin // jal
                WBSel = 2'b10;
            end
            7'h67 : begin // jalr
                WBSel = 2'b10;
            end
            7'h17 : begin // auipc
                WBSel = 2'b01;
            end
            7'h37 : begin // lui
                WBSel = 2'b01;
            end
            default: begin
                WBSel = 2'bXX;
            end
        endcase
    end
endmodule
