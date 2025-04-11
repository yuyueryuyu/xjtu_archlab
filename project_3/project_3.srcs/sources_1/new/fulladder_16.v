`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 23:08:53
// Design Name: 
// Module Name: fulladder_16
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


module fulladder_16(
     input[15:0] A,B,
     input Cin,
     output[15:0] S,
     output Cout
     );
     wire C0,C1,C2;
     
     fulladder_4 FA0(
     .A (A[3:0]),
     .B (B[3:0]),
     .Cin (Cin),
     .S (S[3:0]),
     .Cout (C0)
     );
     fulladder_4 FA1(
     .A (A[7:4]),
     .B (B[7:4]),
     .Cin (C0),
     .S (S[7:4]),
     .Cout (C1)
     );
     fulladder_4 FA2(
     .A (A[11:8]),
     .B (B[11:8]),
     .Cin (C1),
     .S (S[11:8]),
     .Cout (C2)
     );
     fulladder_4 FA3(
     .A (A[15:12]),
     .B (B[15:12]),
     .Cin (C2),
     .S (S[15:12]),
     .Cout (Cout)
     );
endmodule
