`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:54:53
// Design Name: 
// Module Name: sim_ALU
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


module sim_ALU;
     reg [31:0] A, B;
     reg [3:0] OP;
     wire [31:0] F1, F2;
     wire ZF, CF1, CF2, OF, SF, PF;
     ALU_8 ALU_1(F1, CF1, A, B, OP);
     ALU ALU_2(OP, A, B, F2, ZF, CF2, OF, SF, PF);
     initial begin
        A = 0;
        B = 0;
        OP = 0;
        fork
            repeat(160) #5 A = {$random};
            repeat(40) #20 B = {$random};
            repeat(10) #80 OP = OP < 8 ? OP + 1 : 0;
        join
     end
endmodule
