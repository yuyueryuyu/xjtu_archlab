`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 20:27:54
// Design Name: 
// Module Name: D_ff_sim
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


module D_ff_sim;
    reg D, CLK, EN, RST;
    wire Q, QN;
    D_ff D_ff_1(Q, QN, D, EN, RST, CLK);
    initial begin
        D = 1; CLK = 0; EN = 0; RST = 0;
        fork
            repeat(25) #20 D = ~D;
            repeat(20) #25 CLK = ~CLK;
            repeat(10) #55 EN = ~EN;
            #10 RST = ~RST;
            #50 RST = ~RST;
        join
    end
endmodule
