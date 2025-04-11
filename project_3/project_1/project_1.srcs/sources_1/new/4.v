module fulladder_4(
     input[3:0] A,B,
     input Ci,
     output Co,
     output[3:0] S
     );
     wire C0,C1,C2;
     fulladder_1 FA0(
     .A (A[0]),
     .B (B[0]),
     .Ci (Ci),
     .S (S[0]),
     .Co (C0)
     );
     fulladder_1 FA1(
     .A (A[1]),
     .B (B[1]),
     .Ci (C0),
     .S (S[1]),
     .Co (C1)
     );
     fulladder_1 FA2(
     .A (A[2]),
     .B (B[2]),
     .Ci (C1),
     .S (S[2]),
     .Co (C2)
     );
     fulladder_1 FA3(
     .A (A[3]),
     .B (B[3]),
     .Ci (C2),
     .S (S[3]),
     .Co (Co)
     );
endmodule