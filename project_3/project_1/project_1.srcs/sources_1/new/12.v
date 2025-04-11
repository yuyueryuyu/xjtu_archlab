module ADD (
     output [31:0] Fw, 
     output CF, 
     input [31:0] A, 
     input [31:0] B, 
     input EN 
     );
     wire [31:0] sum; 
     wire carry_out; 

     fulladder_32 fulladder (
       .A(A), 
       .B(B), 
       .Ci(0), 
       .Co(carry_out), 
       .S(sum) 
        );

assign Fw = (EN == 1'b1) ? sum : 32'bz;
assign CF = (EN == 1'b1) ? carry_out : 1'bz;
endmodule