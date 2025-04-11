`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 21:19:29
// Design Name: 
// Module Name: RAM_1Kx16
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


module RAM_1Kx16(
    Data_out, Addr, WE, CS, CLK, Data_in
    );
    parameter Addr_Width = 10;
    parameter Data_Width = 16;
    parameter SIZE = 2 ** Addr_Width;
    output reg [Data_Width-1:0] Data_out;
    input [Addr_Width-1:0] Addr;
    input WE, CS, CLK;
    input [Data_Width-1:0] Data_in;
    integer i; 
    reg [Data_Width-1:0] RAM [SIZE-1:0];
    always @(*) begin
        casex({CS, WE})
            4'b10 : Data_out <= RAM[Addr];
            4'b11 : RAM[Addr] <= Data_in;
            default : Data_out <= 16'bz;
        endcase
    end
endmodule
