`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:41:06
// Design Name: 
// Module Name: sim_fulladder_16
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


module sim_fulladder_16;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S;
    wire Cout;
    fulladder_16 fulladder_16_1(A, B, Cin, S, Cout);
    initial begin
        A = 0; B = 0; Cin = 0;
        fork
            repeat(64) #4 A = {$random};
            repeat(8) #32 B = {$random};
            repeat(1)  #256 Cin = ~Cin;
        join
    end
endmodule
