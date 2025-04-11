`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:02:42
// Design Name: 
// Module Name: fulladder_lookahead
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


module fulladder_lookahead (
    input [31:0] A, B,
    input Cin,      
    output [31:0] S,  
    output Cout      
);
    wire [31:0] G;  
    wire [31:0] P; 
    wire [32:0] C;  

    assign G = A & B;        
    assign P = A | B;        

    assign C[0] = Cin;
    genvar i;
    generate
        for (i = 1;i <= 32;i = i+1) begin
            assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
        end
    endgenerate  

    assign S = A ^ B ^ C[31:0]; 

    assign Cout = C[32];

endmodule