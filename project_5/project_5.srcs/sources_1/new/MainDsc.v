`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 17:27:10
// Design Name: 
// Module Name: MainDsc
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


module MainDsc(
    input [31:0] instr,
    output RegWEn, 
    output [2:0] ImmSel, 
    output BrUn, BSel, ASel, 
    output [3:0] ALUSel, 
    output MemRW, MemC,
    output [1:0] WBSel
    );
    reg [6:0] op;
    reg [2:0] funct3;
    reg [6:0] funct7;
    reg [14:0] Control;
    assign {RegWEn, ImmSel, BrUn, ASel, BSel, ALUSel, MemRW,WBSel, MemC} = Control;
    always@(*) begin
        op = instr[6:0];
        funct3 = instr[14:12];
        funct7 = instr[31:25];
        case (op) 
            7'h13 : begin // I Type
                case (funct3)
                    3'h0: begin //addi
                        Control = 15'b100000100000010;    
                    end
                    3'h1: begin //slli
                        Control = 15'b100000100010010;
                    end
                    3'h2: begin //slti
                        Control = 15'b100000100100010;   
                    end
                    3'h4: begin //xori
                        Control = 15'b100000101000010;    
                    end
                    3'h5: begin 
                        case (funct7)
                            7'h00: begin //srli
                                Control = 15'b100000101010010;
                            end
                            7'h20: begin //srai
                                Control = 15'b100000111010010;
                            end
                            default: begin
                                Control = 15'bz;
                            end
                        endcase
                    end
                    3'h6: begin //ori
                        Control = 15'b100000101100010;    
                    end
                    3'h7: begin //andi
                        Control = 15'b100000101110010;
                    end
                    default: begin
                        Control = 15'bz;        
                    end
                endcase     
            end
            7'h33 : begin // R Type
                case (funct3)
                    3'h0: begin
                        case (funct7)
                            7'h00: begin //add
                                Control = 15'b100000000000010;
                            end
                            7'h01: begin //mul
                                Control = 15'b100000010000010;
                            end
                            7'h20: begin //sub
                                Control = 15'b100000011000010;
                            end
                            default: begin
                                Control = 15'bz;
                            end
                        endcase
                    end
                    3'h1: begin 
                        case (funct7)
                            7'h00: begin //sll
                                Control = 15'b100000000010010;
                            end
                            7'h01: begin //mulh
                                Control = 15'b100000010010010;
                            end
                            default: begin
                                Control = 14'bz;
                            end
                        endcase
                    end
                    3'h2: begin //slt
                        Control = 15'b100000000100010;    
                    end
                    3'h3: begin //mulhu
                        Control = 15'b100000010110010;
                    end
                    3'h4: begin //xor
                        Control = 15'b100000001000010;    
                    end
                    3'h5: begin 
                        case (funct7)
                            7'h00: begin //srl
                                Control = 15'b100000001010010;
                            end
                            7'h20: begin //sra
                                Control = 15'b100000011010010;
                            end
                            default: begin
                                Control = 15'bz;
                            end
                        endcase
                    end
                    3'h6: begin //or
                        Control = 15'b100000001100010;     
                    end
                    3'h7: begin //and
                        Control = 15'b100000001110010;       
                    end
                    default: begin
                        Control = 15'bz;        
                    end
                endcase    
            end
            7'h63 : begin // B Type
                case (funct3)
                    3'h0: begin //beq
                        Control = 15'b001001100000110; 
                    end
                    3'h1: begin //bne
                        Control = 15'b001001100000110;
                    end
                    3'h4: begin //blt
                        Control = 15'b001001100000110;  
                    end
                    3'h5: begin //bge
                        Control = 15'b001001100000110;
                    end
                    3'h6: begin //bltu
                        Control = 15'b001011100000110;  
                    end
                    3'h7: begin //bgeu
                        Control = 15'b001011100000110;
                    end
                    default: begin
                        Control = 15'bz;        
                    end
                endcase    
            end
            7'h03 : begin // Load Instructions
                case (funct3)
                    3'h0: begin //lb
                        Control = 15'b100000100000001;  
                    end
                    3'h1: begin //lh
                        Control = 15'b100000100000001;
                    end
                    3'h2: begin //lw
                        Control = 15'b100000100000001; 
                    end
                    default: begin
                        Control = 15'bz;        
                    end
                endcase    
            end
            7'h23 : begin // Store Instructions
                case (funct3)
                    3'h0: begin //sb
                        Control = 15'b000100100001110; 
                    end
                    3'h1: begin //sh
                        Control = 15'b000100100001110;
                    end
                    3'h2: begin //sw
                        Control = 15'b000100100001110;
                    end
                    default: begin
                        Control = 15'bz;        
                    end
                endcase  
            end
            7'h6F : begin // jal
                Control = 15'b110001100000100;
            end
            7'h67 : begin // jalr
                Control = 15'b100000100000100;
            end
            7'h17 : begin // auipc
                Control = 15'b101101100000010;
            end
            7'h37 : begin // lui
                Control = 15'b101101111110010;
            end
            default: begin
                Control = 14'bz;                
            end
        endcase
    end
endmodule
