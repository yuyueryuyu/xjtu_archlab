`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 23:07:12
// Design Name: 
// Module Name: fulladder_4
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


module fulladder_4(
     input[3:0] A,B,
     input Cin,
     output[3:0] S,
     output Cout
     );
     wire C0,C1,C2;
     
     fulladder_1 FA0(
     .A (A[0]),
     .B (B[0]),
     .Cin (Cin),
     .S (S[0]),
     .Cout (C0)
     );
     fulladder_1 FA1(
     .A (A[1]),
     .B (B[1]),
     .Cin (C0),
     .S (S[1]),
     .Cout (C1)
     );
     fulladder_1 FA2(
     .A (A[2]),
     .B (B[2]),
     .Cin (C1),
     .S (S[2]),
     .Cout (C2)
     );
     fulladder_1 FA3(
     .A (A[3]),
     .B (B[3]),
     .Cin (C2),
     .S (S[3]),
     .Cout (Cout)
     );
endmodule
