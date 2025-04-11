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


module ADD (
    F, A, B, CF, EN
     );
     parameter N = 32;
     output [N-1:0] F;
     output CF;
     input [N-1:0] A, B;
     input EN;
     wire [31:0] s; 
     wire cout; 

     fulladder_lookahead fulladder (
       .A(A), 
       .B(B), 
       .Cin(0), 
       .S(s), 
       .Cout(cout) 
        );
        assign F = (EN == 1)?s:32'bz;
        assign CF = (EN == 1)?cout:1'bz;
endmodule