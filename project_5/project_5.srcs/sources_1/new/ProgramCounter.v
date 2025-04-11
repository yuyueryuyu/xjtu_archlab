`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 22:38:41
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk, rst,
    input [31:0] PC_in,
    output reg [31:0] PC_out
    );
    always@(posedge clk or negedge rst) begin
        if (rst) begin
            PC_out = 32'b0;
        end
        else begin
            PC_out = PC_in;
        end
    end
endmodule
