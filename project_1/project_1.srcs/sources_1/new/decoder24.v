`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/10 22:42:45
// Design Name: 
// Module Name: decoder24
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


module decoder24(
    input [1:0] A,
    output [3:0] Y
    );
    assign Y[3] = A[1] & A[0];
    assign Y[2] = A[1] & ~A[0];
    assign Y[1] = ~A[1] & A[0];
    assign Y[0] = ~A[1] & ~A[0];
endmodule
