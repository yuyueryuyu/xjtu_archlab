`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/24 16:07:40
// Design Name: 
// Module Name: RAM_4Kx32
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


module RAM_4Kx32(
    input [31:0] Addr,
    input [31:0] Data_in,
    input [31:0] WriteBackAddr,
    input [127:0] WriteBackData,
    input WB,
    input CS,
    input WE,
    input CLK,
    output reg [31:0] Data_out,
    output reg [127:0] BlockData
    );
    
    parameter Addr_Width = 12;
    parameter Data_Width = 32;
    parameter SIZE = 2 ** Addr_Width;
    integer i; 
    reg [Data_Width-1:0] RAM [SIZE-1:0];
    initial begin
        for (i = 0; i < SIZE; i = i + 1) begin
            RAM[i] = 0;
        end
    end
    always @(*) begin
        casex({CS, WE})
            4'b10 : begin
                BlockData <= {RAM[Addr/4*4+3], RAM[Addr/4*4+2], RAM[Addr/4*4+1], RAM[Addr/4*4]};
                Data_out <= RAM[Addr];
            end
            4'b01 : begin
                RAM[Addr] <= Data_in;
                if (WB) begin
                    RAM[WriteBackAddr] <= WriteBackData[31:0];
                    RAM[WriteBackAddr+1] <= WriteBackData[63:32];
                    RAM[WriteBackAddr+2] <= WriteBackData[95:64];
                    RAM[WriteBackAddr+3] <= WriteBackData[127:96];
                end
            end
            default : Data_out <= 32'bz;
        endcase
    end
endmodule