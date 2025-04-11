`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 20:37:20
// Design Name: 
// Module Name: register_sim
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


module register_sim;
    parameter N = 8;
    wire [N-1:0] Q;
    reg [N-1:0] D;
    reg OE, CLK;
    register register_1(Q, D, OE, CLK);
    initial begin
        D = 8'b1010_1110;
        OE = 1; CLK = 0;
        fork
            repeat(20) #10 CLK = ~CLK;
            repeat(10) #20 OE = ~OE;
        join
    end
endmodule
