`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 21:18:58
// Design Name: 
// Module Name: Decoder24
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


module Decoder24(
    output [3:0] out,
    input [1:0] in
    );
    assign out[0] = ~in[0] & ~in[1];
    assign out[1] = in[0] & ~in[1];
    assign out[2] = ~in[0] & in[1];
    assign out[3] = in[0] & in[1];
endmodule
