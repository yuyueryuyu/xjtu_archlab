`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 10:33:54
// Design Name: 
// Module Name: sim_RAM_1Kx16
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


module sim_RAM_1Kx16;
    wire [15:0] Data_out;
    reg [9:0] Addr;
    reg Rst, RE, WE, CS, CLK;
    reg [15:0] Data_in;
    wire [15:0] Data;
    reg R_W;
    RAM_1Kx16 RAM_1Kx16_1(Data_out, Addr, Rst, RE, WE, CS, CLK, Data_in);
    RAM_1Kx16_inout RAM_1Kx16_inout_1(Data, Addr, Rst, R_W, CS, CLK);
    assign Data = R_W ? 16'bz : 16'h5678;
    initial begin
        Addr = 0; 
        Rst = 0; 
        WE = 1; 
        RE = 0; 
        CS = 0; 
        CLK = 0;
        R_W = 0; 
        Data_in = 16'h5678;
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
