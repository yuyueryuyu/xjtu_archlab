`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 13:27:45
// Design Name: 
// Module Name: sim_ALUDec
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


module sim_ALUDec;
    reg [5:0] Funct;
    reg [1:0] ALUOp;
    wire [2:0] ALUControl;
    ALUDec ALUDec_1(Funct, ALUOp, ALUControl);
    initial begin
        Funct = 6'b100000;
        ALUOp = 2'b00;
        #10 ALUOp = 2'b01;
        #10 ALUOp = 2'b10;
        #10 Funct = 6'b100010;
        #10 Funct = 6'b100100;
        #10 Funct = 6'b100101;
        #10 Funct = 6'b101010;
     end
endmodule
