module fulladder_32(
     input [31:0] A,B,
     input Ci,
     output Co,
     output [31:0] S
     );
     wire C0,C1,C2,C3,C4,C5,C6;
     fulladder_4 A0(
       .A (A[3:0]),
       .B (B[3:0]),
       .S (S[3:0]),
       .Ci (Ci),
       .Co (C0)
     );
     fulladder_4 A1(
       .A (A[7:4]),
       .B (B[7:4]),
       .S (S[7:4]),
       .Ci (C0),
       .Co (C1)
     );
     fulladder_4 A2(
       .A (A[11:8]),
       .B (B[11:8]),
       .S (S[11:8]),
       .Ci (C1),
       .Co (C2)
     );
     fulladder_4 A3(
       .A (A[15:12]),
       .B (B[15:12]),
       .S (S[15:12]),
       .Ci (C2),
       .Co (C3)
       );
     fulladder_4 A4(
       .A (A[19:16]),
       .B (B[19:16]),
       .S (S[19:16]),
       .Ci (C3),
       .Co (C4)
      );
     fulladder_4 A5(
       .A (A[23:20]),
       .B (B[23:20]),
       .S (S[23:20]),
       .Ci (C4),
       .Co (C5)
      );
     fulladder_4 A6(
       .A (A[27:24]), 
       .B (B[27:24]),
       .S (S[27:24]),
       .Ci (C5),
       .Co (C6)
     );
     fulladder_4 A7(
       .A (A[31:28]),
       .B (B[31:28]),
       .S (S[31:28]),
       .Ci (C6),
       .Co (Co)
     );
endmodule