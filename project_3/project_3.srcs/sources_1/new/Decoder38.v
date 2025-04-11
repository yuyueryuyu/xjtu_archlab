`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 00:23:20
// Design Name: 
// Module Name: SLL
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


module Decoder38 (
     input [2:0] A,
     output wire [7:0] Y 
     );
    assign Y[7] = A[2] & A[1] & A[0];
    assign Y[6] = A[2] & A[1] & ~A[0];
    assign Y[5] = A[2] & ~A[1] & A[0];
    assign Y[4] = A[2] & ~A[1] & ~A[0];
    assign Y[3] = ~A[2] & A[1] & A[0];
    assign Y[2] = ~A[2] & A[1] & ~A[0];
    assign Y[1] = ~A[2] & ~A[1] & A[0];
    assign Y[0] = ~A[2] & ~A[1] & ~A[0];
endmodule
