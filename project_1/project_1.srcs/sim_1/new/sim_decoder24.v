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


module sim_decoder24;
    reg [1:0] A;
    wire [3:0] Y;
    decoder24 decoder24_1(A, Y);
    initial begin
        A = 2'b00;
        fork
            repeat(10) #10 A[0] = ~A[0];
            repeat(5) #20 A[1] = ~A[1];
         join
     end
endmodule
