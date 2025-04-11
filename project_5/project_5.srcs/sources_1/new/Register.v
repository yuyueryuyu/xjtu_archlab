`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 14:17:17
// Design Name: 
// Module Name: Register
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


module Register(
    Q, D, OE, CLK
    );
    parameter N = 32;
    output reg [N-1:0] Q;
    input [N:1] D;
    input OE, CLK;
    initial begin 
        Q = 32'b0;
    end
    always @(posedge CLK or posedge OE)
        if(OE) Q <= 32'b0;
        else Q <= D;
endmodule