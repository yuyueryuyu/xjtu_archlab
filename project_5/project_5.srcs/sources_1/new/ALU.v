`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 14:42:36
// Design Name: 
// Module Name: ALU
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


module ALU(
    OP, A, B, F
    );
    parameter SIZE = 32;
    input [3:0] OP;
    input signed [SIZE:1] A;
    input signed [SIZE:1] B;
    output [SIZE:1] F;
    reg [SIZE:1] F;
    reg [2*SIZE-1:0] mul_result;
    reg [2*SIZE-1:0] unsigned_mul_result;
    always@(*) begin
        mul_result = A * B;
        unsigned_mul_result = $unsigned(A) * $unsigned(B);
        case(OP)
            4'b0000: begin F = A + B; end
            4'b0001: begin F = A << B; end
            4'b0010: begin F = A < B ? 1 : 0; end
            4'b0100: begin F = A ^ B; end
            4'b0101: begin F = A >> B; end
            4'b0110: begin F = A | B; end
            4'b0111: begin F = A & B; end
            4'b1000: begin F = mul_result[31:0]; end
            4'b1001: begin F = mul_result[63:32]; end
            4'b1011: begin F = unsigned_mul_result[63:32]; end
            4'b1100: begin F = A - B; end
            4'b1101: begin F = A >>> B; end
            default: begin F = B; end
         endcase
     end
endmodule
