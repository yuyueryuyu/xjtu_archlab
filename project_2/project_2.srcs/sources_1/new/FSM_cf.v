`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 21:18:41
// Design Name: 
// Module Name: FSM_cf
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


module FSM_cf(
    input clk,
    input reset,
    input a,
    output y
    );
    reg[1:0] state, nextstate;
    always @(posedge clk, posedge reset)
        if(reset) state = 2'b00;
        else state = nextstate;
    always@(posedge clk)
    case(state)
        'b00: if(a) nextstate = 'b00;
              else nextstate = 'b01;
        'b01: if(a) nextstate = 'b10;
              else nextstate = 'b01;
        'b10: if(a) nextstate = 'b00;
              else nextstate = 'b01;
        default: nextstate = 'b00;
    endcase
    assign y = (state == 'b10);
endmodule
