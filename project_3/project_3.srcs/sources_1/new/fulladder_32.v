`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 23:11:44
// Design Name: 
// Module Name: fulladder_32
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


module fulladder_32(
     input[31:0] A,B,
     input Cin,
     output[31:0] S,
     output Cout
     );
     wire C0;
     
     fulladder_16 FA0(
     .A (A[15:0]),
     .B (B[15:0]),
     .Cin (Cin),
     .S (S[15:0]),
     .Cout (C0)
     );
     fulladder_16 FA1(
     .A (A[31:16]),
     .B (B[31:16]),
     .Cin (C0),
     .S (S[31:16]),
     .Cout (Cout)
     );
endmodule
