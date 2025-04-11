module SLT (
    F, A, B, EN
     );
     parameter N = 32;
     output reg [N-1:0] F;
     input [N-1:0] A, B;
     input EN;
     always @(A, B, EN) begin
        if (EN == 1) begin F <= A < B; end
        else begin F <= 32'bz; end
     end
endmodule