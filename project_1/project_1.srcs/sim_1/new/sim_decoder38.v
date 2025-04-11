`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/11 14:10:00
// Design Name: 
// Module Name: sim_decoder24
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


module sim_decoder38;
    reg [2:0] A;
    wire [7:0] Y;
    decoder38 decoder38_1(A, Y);
    initial begin
        A = 2'b000;
        fork
            repeat(20) #10 A[0] = ~A[0];
            repeat(10) #20 A[1] = ~A[1];
            repeat(5) #40 A[2] = ~A[2];
         join
     end
endmodule