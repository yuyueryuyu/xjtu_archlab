`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 16:26:40
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
    Data_out, Addr, Rst, RE, WE, CS, CLK, Data_in
    );
    parameter Addr_Width = 12;
    parameter Data_Width = 32;
    output [Data_Width-1:0] Data_out;
    input [Addr_Width-1:0] Addr;
    input Rst, RE, WE, CS, CLK;
    input [Data_Width-1:0] Data_in;
    
    wire [3:0] CS_i;
    Decoder24 Decoder24_1(CS_i, Addr[Addr_Width-1:Addr_Width-2]);
    RAM_1Kx16 CS0_H_16bit(Data_out[Data_Width-1:Data_Width/2], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[0] & CS, CLK, Data_in[Data_Width-1:Data_Width/2]),
              CS0_L_16bit(Data_out[Data_Width/2-1:0], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[0] & CS, CLK, Data_in[Data_Width/2-1:0]);
    RAM_1Kx16 CS1_H_16bit(Data_out[Data_Width-1:Data_Width/2], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[1] & CS, CLK, Data_in[Data_Width-1:Data_Width/2]),
              CS1_L_16bit(Data_out[Data_Width/2-1:0], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[1] & CS, CLK, Data_in[Data_Width/2-1:0]);
    RAM_1Kx16 CS2_H_16bit(Data_out[Data_Width-1:Data_Width/2], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[2] & CS, CLK, Data_in[Data_Width-1:Data_Width/2]),
              CS2_L_16bit(Data_out[Data_Width/2-1:0], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[2] & CS, CLK, Data_in[Data_Width/2-1:0]);
    RAM_1Kx16 CS3_H_16bit(Data_out[Data_Width-1:Data_Width/2], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[3] & CS, CLK, Data_in[Data_Width-1:Data_Width/2]),
              CS3_L_16bit(Data_out[Data_Width/2-1:0], Addr[Addr_Width-3:0], Rst, RE, WE, CS_i[3] & CS, CLK, Data_in[Data_Width/2-1:0]);          
endmodule
