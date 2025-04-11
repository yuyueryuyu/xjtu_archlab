`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:21:36
// Design Name: 
// Module Name: sim_fulladder_4
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


module sim_fulladder_4;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    fulladder_4 fulladder_4_1(A, B, Cin, S, Cout);
    initial begin
        A = 0; B = 0; Cin = 0;
        fork
            repeat(256) #1 A = A + 1;
            repeat(16) #16 B = B + 1;
            repeat(1)  #256 Cin = ~Cin;
        join
    end
endmodule
