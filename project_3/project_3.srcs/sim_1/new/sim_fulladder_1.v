`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 01:11:50
// Design Name: 
// Module Name: sim_fulladder_1
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


module sim_fulladder_1;
    reg A, B, Cin;
    wire S, Cout;
    fulladder_1 fulladder_1_1(A, B, Cin, S, Cout);
    initial begin
        A = 0; B = 0; Cin = 0;
        fork
            repeat(20) #10 A = ~A;
            repeat(10) #20 B = ~B;
            repeat(5)  #40 Cin = ~Cin;
        join
    end
endmodule
