`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 19:56:31
// Design Name: 
// Module Name: DMem
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


module DMem(
    input [31:0] MemAddr,
    input [31:0] MemWriteData,
    input MemREn,
    input MemWEn,
    input CLK,
    output [31:0] MemReadData
    );
    
    wire [127:0] BlockData;
    wire [31:0] cache_data;
    wire [31:0] WBAddr;
    wire [31:0] mem_data;
    wire WB, miss;
    wire [127:0] WBData; 
    FourWaySACache Cache_1(CLK, MemAddr[11:0], MemWriteData, MemWEn, MemREn, BlockData, cache_data, WB, miss, WBData, WBAddr);
    RAM_4Kx32 MainMem(MemAddr, MemWriteData, WBAddr, WBData, WB, MemREn & miss, miss & MemWEn, CLK, mem_data, BlockData);
    assign MemReadData = miss ? mem_data : cache_data;
endmodule
