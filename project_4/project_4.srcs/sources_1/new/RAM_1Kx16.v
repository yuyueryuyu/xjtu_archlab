`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 16:19:48
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
    Data_out, Addr, Rst, RE, WE, CS, CLK, Data_in
    );
    parameter Addr_Width = 10;
    parameter Data_Width = 16;
    parameter SIZE = 2 ** Addr_Width;
    output reg [Data_Width-1:0] Data_out;
    input [Addr_Width-1:0] Addr;
    input Rst, RE, WE, CS, CLK;
    input [Data_Width-1:0] Data_in;
    integer i; 
    reg [Data_Width-1:0] RAM [SIZE-1:0];
    always @(*) begin
        casex({CS, Rst, RE, WE})
            4'bx1xx : for(i = 0;i <= SIZE-1;i = i+1) RAM[i] = 0;
            4'b1010 : Data_out <= RAM[Addr];
            4'b1001 : RAM[Addr] <= Data_in;
            default : Data_out <= 16'bz;
        endcase
    end
endmodule
