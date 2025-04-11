module SUB (
      output [31:0] Fw, 
      output CF, 
      input [31:0] A, 
      input [31:0] B, 
      input EN 
      );
      wire [31:0] NotB; 
      wire [31:0] AddB; 
      wire [31:0] TempSum;
assign NotB = ~B;
assign AddB = NotB + 1'b1;
assign Fw = (EN == 1'b1) ? (A + AddB) : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;assign CF = (EN == 1'b1) ? (A < B) : 1'bz;
endmodule
