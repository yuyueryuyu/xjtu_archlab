`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 21:22:19
// Design Name: 
// Module Name: FSM_sim
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


module FSM_sim;
    reg clk, reset, a;
    wire y1;
    wire y2;
    FSM_case FSM_case_1(clk, reset, y1);
    FSM_cf FSM_cf_1(clk, reset, a, y2);
    initial begin
        clk = 0; reset = 0; a = 0;
        fork
            repeat(100) #10 clk = ~clk;
            #15 reset = ~reset;
            #50 reset =  ~reset;
            repeat(10) #100 a =  ~a;
        join
    end
endmodule
