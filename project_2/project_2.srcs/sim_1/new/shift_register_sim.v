`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 20:47:13
// Design Name: 
// Module Name: shift_register_sim
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


module shift_register_sim;
    parameter N = 4;
    reg S1, S0;
    reg Dsl, Dsr;
    reg CLK, CR;
    reg [N-1:0] D;
    wire [N-1:0] Q;
    shift_register shift_register_1(S1, S0, D, Dsl, Dsr, Q, CLK, CR);
    initial begin
        D = 4'b0101; Dsl = 0; Dsr = 1; CLK = 0; CR = 0; S1 = 1; S0 = 1;
        fork
            repeat(50) #7 CLK = ~CLK;
            #10 CR = ~CR;
            #30 CR = ~CR;
            repeat(3) #120 S1 = ~S1;
            repeat(6) #60 S0 = ~S0;
        join
    end 
endmodule
