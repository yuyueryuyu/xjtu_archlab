`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 16:58:43
// Design Name: 
// Module Name: RAM_1Kx16_inout
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


module RAM_1Kx16_inout(
    Data, Addr, Rst, R_W, CS, CLK
    );
    parameter Addr_Width = 10;
    parameter Data_Width = 16;
    parameter SIZE = 2 ** Addr_Width;
    inout [Data_Width-1:0] Data;
    input [Addr_Width-1:0] Addr;
    input Rst, R_W, CS, CLK;
    
    integer i;
    reg [Data_Width-1:0] RAM [SIZE-1:0];
    reg [Data_Width-1:0] Data_i;
    assign  Data = (R_W) ? Data_i:16'bz;
    always @(*) begin
        casex ({CS, Rst, R_W})
            4'bx1x : for (i = 0;i <= SIZE-1;i = i+1) RAM[i] = 0;
            4'b101 : Data_i <= RAM[Addr];
            4'b100 : RAM[Addr] <= Data;
            default : Data_i = 16'bz;
        endcase
    end
endmodule
