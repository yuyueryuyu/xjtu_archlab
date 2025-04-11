`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/10 21:38:52
// Design Name: 
// Module Name: encoder
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


module encoder83_assign(
    input [7:0] I,
    output [2:0] Y
    );
    assign Y = {I[4]|I[5]|I[6]|I[7], I[2]|I[3]|I[6]|I[7], I[1]|I[3]|I[5]|I[7]};
endmodule
