`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:49:30
// Design Name: 
// Module Name: sim_fulladder_32
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


module sim_fulladder_32;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] S1, S2;
    wire Cout1, Cout2;
    fulladder_32 fulladder_32_1(A, B, Cin, S1, Cout1);
    fulladder_lookahead fulladder_lookahead_1(A, B, Cin, S2, Cout2);
    initial begin
        A = 0; B = 0; Cin = 0;
        fork
            repeat(64) #4 A = {$random};
            repeat(8) #32 B = {$random};
            repeat(1)  #256 Cin = ~Cin;
        join
    end
endmodule