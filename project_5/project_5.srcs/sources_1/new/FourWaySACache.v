`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/24 10:47:29
// Design Name: 
// Module Name: FourWaySACache
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

// 1KiB Cache Size
// 16B Block Size
// 12 bit Address
// Offset bit = log(16) = 4
// Sets Num = 1024/16/4 = 16
// Index bit = log(16) = 4
// Tag bit = 12 - 4 - 4 = 4
module FourWaySACache (
    input clk,
    input [11:0] address,
    input [31:0] write_data,
    input write_enable,
    input read_enable,
    input [127:0] block_data,
    output reg [31:0] read_data,
    output reg writeback,
    output reg miss,
    output reg [127:0] write_back_data,
    output reg [31:0] write_back_addr
);

    parameter NUM_SETS = 16;
    parameter NUM_WAYS = 4;

    reg [3:0] tags [NUM_SETS-1:0][NUM_WAYS-1:0];
    reg [127:0] data [NUM_SETS-1:0][NUM_WAYS-1:0]; // Data storage
    reg valid [NUM_SETS-1:0][NUM_WAYS-1:0];
    reg dirty [NUM_SETS-1:0][NUM_WAYS-1:0];
    reg [1:0] lru [NUM_SETS-1:0][NUM_WAYS-1:0];    

    integer i;
    integer j;
    integer way_hit = -1;
    integer replace_way = -1;
    integer ost;
    wire [3:0] tag = address[11:8];
    wire [3:0] index = address[7:4];
    wire [3:0] offset = address[3:0];

    initial begin
        miss <= 0;
        writeback <= 0;
        for (i = 0; i < NUM_SETS; i = i + 1) begin
            for (j = 0; j < NUM_WAYS; j = j + 1) begin
                lru[i][j] = j;
                valid[i][j] = 0;
                tags[i][j] = 0;
                data[i][j] = 0;
                dirty[i][j] = 0;
            end
        end
    end
   always @(*) begin
        if (read_enable | write_enable) begin
            way_hit = -1;
            for (i = 0; i < NUM_WAYS; i = i + 1) begin
                if (valid[index][i] && tags[index][i] == tag) begin
                    way_hit = i;
                end
            end
            
            if (way_hit == -1) begin
                miss <= 1;
            end 
            else begin
                case ({read_enable, write_enable}) 
                    2'b10: begin
                        read_data <= data[index][way_hit][offset * 8 +: 32];
                        miss <= 0;
                    end
                    2'b01: begin
                        data[index][way_hit][offset * 8 +: 32] <= write_data;
                        dirty[index][way_hit] <= 1;
                        miss <= 0;
                    end
                    default: begin
                        read_data <= 32'bz;
                    end
                endcase
            end
        end
        else begin
            read_data <= 32'bz;
        end
    end
    
    always @(posedge clk) begin
        if (read_enable | write_enable) begin
            way_hit = -1;
            for (i = 0; i < NUM_WAYS; i = i + 1) begin
                if (valid[index][i] && tags[index][i] == tag) begin
                    way_hit = i;
                end
            end
            
            if (way_hit == -1) begin
                replace_way = lru[index][0];
                for (i = 1; i < NUM_WAYS; i = i + 1) begin
                    lru[index][i-1] <= lru[index][i];
                end
                lru[index][3] <= replace_way;
                if (dirty[index][replace_way]) begin
                   write_back_data <= data[index][replace_way];
                   write_back_addr <= {tags[index][replace_way], index, 4'b0000};
                   writeback <= 1;
                end
                else begin
                    writeback <= 0;
                end
                data[index][replace_way] <= block_data;
                valid[index][replace_way] <= 1;
                dirty[index][replace_way] <= 0;
                tags[index][replace_way] <= tag;
            end 
            else begin
                writeback <= 0;
                if (lru[index][0] == way_hit) begin
                    lru[index][0] <= lru[index][1];
                    lru[index][1] <= lru[index][2];
                    lru[index][2] <= lru[index][3];
                end
                if (lru[index][1] == way_hit) begin
                    lru[index][1] <= lru[index][2];
                    lru[index][2] <= lru[index][3];
                end
                if (lru[index][2] == way_hit) begin
                    lru[index][2] <= lru[index][3];
                end
                lru[index][3] <= way_hit; 
            end
        end
        else begin
            read_data <= 32'bz;
            writeback <= 0;
        end
    end
endmodule

