`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 22:04:58
// Design Name: 
// Module Name: sim_RAM_4Kx32
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


module sim_RAM_4Kx32;
    wire [31:0] Data_out;
    reg [11:0] Addr;
    reg Rst, RE, WE, CLK, CS;
    reg [31:0] Data_in;
    wire [31:0] Data;
    reg R_W;
    RAM_4Kx32 RAM_4Kx32_1(Data_out, Addr, Rst, RE, WE, CS, CLK, Data_in);
    RAM_4Kx32_inout RAM_4Kx32_inout_1(Data, Addr, Rst, R_W, CS, CLK);
    assign Data = R_W ? 32'bz : 32'h1234_5678;
    initial begin
        Addr = 0; 
        Rst = 0; 
        WE = 1; 
        RE = 0; 
        CLK = 0;
        CS = 0;
        R_W = 0; 
        Data_in = 32'h1234_5678;
        fork
            repeat(200) #5 CLK = ~CLK;
            #10 Rst = 1;
            #20 Rst = 0;
            #25 CS = 1;
            repeat(100) #10 WE = ~WE;
            repeat(100) #10 RE = ~RE;    
            repeat(100) #10 R_W = ~R_W;
            repeat(40) #25 Addr = Addr + 4;
        join
    end
endmodule
