module sim_ALU;
     reg [31:0] A, B;
     reg [3:0] OP;
     wire [31:0] F;
     wire CF;
     initial begin
       A = 0 ;
       B = 0;
       OP = 0;
     end
     always begin
       repeat(8) #20 OP = OP + 1;
       OP=4'b0000;
     end
     ALU8 ALU(F, CF, A, B, OP);
endmodule