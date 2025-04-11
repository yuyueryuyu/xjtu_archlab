`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 16:20:51
// Design Name: 
// Module Name: IMem
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

`define DATA_WIDTH 32

module IMem(
    input [31:0] A,
    output [`DATA_WIDTH-1:0] RD
    );
    parameter IMEM_SIZE = 1024;
    reg [`DATA_WIDTH-1:0] RAM[IMEM_SIZE-1:0];
    initial
        $readmemh("c:\\XJTU\\cache.dat", RAM);
    assign RD = RAM[A>>2];
endmodule
