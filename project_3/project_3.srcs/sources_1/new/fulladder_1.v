`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 23:05:27
// Design Name: 
// Module Name: fulladder_1
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


module fulladder_1(
    input A,B,Cin,
    output S,Cout
    );
    assign Cout=(A&B)|(A&Cin)|(B&Cin);
    assign S=(~A&~Cin&B)|(A&~Cin&~B)|(~A&Cin&~B)|(A&Cin&B);
endmodule
