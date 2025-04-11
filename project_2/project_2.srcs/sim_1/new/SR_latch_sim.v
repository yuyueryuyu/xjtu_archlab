`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 15:50:42
// Design Name: 
// Module Name: SR_latch_sim
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


module SR_latch_sim;
    reg S, R;
    wire Q, QN;
    SR_latch SR_latch_1(S, R, Q, QN);
    initial begin
        S = 0; R = 0;
        repeat(5) begin
            #10 S = 1; 
            #10 S = 0;
            #10 R = 1;
            #10 R = 0;
        end
    end
endmodule
