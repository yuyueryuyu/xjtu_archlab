`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 00:23:20
// Design Name: 
// Module Name: SLL
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


module SUB (
    F, A, B, CF, EN
     );
     parameter N = 32;
     output reg [N-1:0] F;
     output reg CF;
     input [N-1:0] A, B;
     input EN;
     always @(A, B, EN) begin
        if (EN == 1) begin F <= A + ~B + 1; CF <= A < B;end
        else begin F <= 32'bz; CF <= 1'bz; end
     end
endmodule