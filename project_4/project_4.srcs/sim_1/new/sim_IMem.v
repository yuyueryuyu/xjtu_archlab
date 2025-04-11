`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 22:32:36
// Design Name: 
// Module Name: sim_IMem
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


module sim_IMem;
     reg [5:0] A;
     wire [31:0] RD;
     IMem IMem_1(A, RD);
     initial begin
        A = 0;
        repeat(12) #10 A = A + 1;
     end
endmodule

