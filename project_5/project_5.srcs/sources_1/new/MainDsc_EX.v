`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 01:02:48
// Design Name: 
// Module Name: MainDsc_EX
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


module MainDsc_EX(
    input [31:0] instr,
    output Jump,
    output [5:0] Branch
    );
    reg [6:0] op;
    reg [2:0] funct3;
    reg [6:0] Control;
    assign {Jump, Branch} = Control;
    always@(*) begin
        op = instr[6:0];
        funct3 = instr[14:12];
        case (op) 
            7'h63 : begin // B Type
                case (funct3)
                    3'h0: begin //beq
                        Control = 7'b0100000; 
                    end
                    3'h1: begin //bne
                        Control = 7'b0010000;
                    end
                    3'h4: begin //blt
                        Control = 7'b0001000;  
                    end
                    3'h5: begin //bge
                        Control = 7'b0000100;
                    end
                    3'h6: begin //bltu
                        Control = 7'b0000010;  
                    end
                    3'h7: begin //bgeu
                        Control = 7'b0000001;
                    end
                    default: begin
                        Control = 7'bz;        
                    end
                endcase    
            end
            7'h6F : begin // jal
                Control = 7'b1000000;
            end
            7'h67 : begin // jalr
                Control = 7'b1000000;
            end
            default: begin
                Control = 7'b0;                
            end
        endcase
    end
endmodule