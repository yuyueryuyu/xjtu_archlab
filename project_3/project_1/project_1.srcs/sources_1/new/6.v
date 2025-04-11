module fulladder_16(
     input [15:0] A,B,
     input Ci,
     output Co,
     output [15:0] S
     );
     wire C0,C1,C2;
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
          .Co (Co)
          );
endmodule
