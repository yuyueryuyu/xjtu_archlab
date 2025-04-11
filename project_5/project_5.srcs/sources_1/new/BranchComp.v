`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 19:40:19
// Design Name: 
// Module Name: BranchComp
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


module BranchComp(
    input signed [31:0] RD1,
    input signed [31:0] RD2,
    input BrUn,
    output reg BrEq,
    output reg BrLt
    );
    always@(*) begin
        case (BrUn)
            1'b0: begin
                BrEq = RD1 == RD2;
                BrLt = RD1 < RD2;
            end
            1'b1: begin
                BrEq = $unsigned(RD1) == $unsigned(RD2);
                BrLt = $unsigned(RD1) < $unsigned(RD2);
            end
        endcase
    end
endmodule
