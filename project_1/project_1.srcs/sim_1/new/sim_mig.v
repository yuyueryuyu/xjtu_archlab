`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/09 23:24:25
// Design Name: 
// Module Name: sim_mig
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


module sim_mig;
    reg a, b, c, d, e;
    wire x;
    mig mig(a, b, c, d, e, x);
    initial begin
        a = 0; b = 0; c= 0; d = 0; e = 0;

        #5 a = 1;
        #5 c = 1;
        #5 d = 1;
        #5 e = 1;
        #5 b = 1;
        #5 b = 0;
        #5 d = 0;
        #5 e = 0;
        #5 c = 0;
        #5 d = 1;
        #5 e = 1;
        #5 d = 0;
        #5 c = 1;
    end
endmodule
