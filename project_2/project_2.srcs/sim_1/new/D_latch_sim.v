`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 16:47:33
// Design Name: 
// Module Name: D_latch_sim
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


module D_latch_sim;
    reg D, EN, RST;
    wire Q, QN;
    D_latch D_latch_1(Q, QN, D, EN, RST);
    initial begin
        D = 1; EN = 0; RST = 0;
        
        fork
            #10 RST = ~RST;
            #50 RST = ~RST;
            repeat(20) #20 D = ~D;
            repeat(7) #55 EN = ~EN;
        join
    end
endmodule
