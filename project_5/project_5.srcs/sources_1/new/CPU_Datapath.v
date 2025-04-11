`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 16:22:59
// Design Name: 
// Module Name: CPU_Datapath
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


module CPU_Datapath(
    input clk,
    input rst
    );
    
    reg [31:0] PC_in;
    wire [31:0] PC_out;
    wire [31:0] PC_ID, PC_EX, PC_M;
    
    wire [31:0] instr;
    reg [31:0] instr_ID, instr_IF;
    wire [31:0] instr_F;
    wire [31:0] instr_EX, instr_M, instr_WB;
    
    wire [31:0] RD1, RD2;
    reg [31:0] RD1_ID, RD2_ID;
    wire [31:0] RD1_F, RD2_F;
    reg [31:0] RD1_EX, RD2_EX;
    wire [31:0] RD2_M;
    
    wire [31:0] ALUResult_EX;
    wire [31:0] ALUResult_M;
    
    reg [31:0] WD3_M;
    wire [31:0] WD3_WB;
    
    wire WE3_ID;
    wire [2:0] ImmSel_ID;
    wire BrUn_ID, BrEq, BrLt, BSel_ID, ASel_ID;
    wire [3:0] ALUSel_ID;
    wire MemRW_ID, MemC_ID;
    wire [1:0] WBSel_ID;
    
    wire PCSel_EX, WE3_EX;
    wire [2:0] ImmSel_EX;
    wire BrUn_EX, BSel_EX, ASel_EX;
    wire [3:0] ALUSel_EX;
    wire MemRW_EX, MemC_EX;
    wire [1:0] WBSel_EX;
    
    wire WE3_M;
    wire MemRW_M, MemC_M;
    wire [1:0] WBSel_M;
    
    wire WE3_WB;
    wire [1:0] WBSel_WB;

    wire [31:0] Imm;
    
    reg [31:0] ALU_A, ALU_B;
    wire [31:0] ALUResult; 
    wire [31:0] MemReadData;
    reg [1:0] forward_A, forward_B;
    reg forward_A_ID, forward_B_ID;
    
    wire [31:0] X1,X2,X3,X4;
    initial begin
        PC_in = 0;
        instr_IF = 32'h0000_0013;
        instr_ID = 32'h0000_0013;
        RD1_EX = 0;
        RD2_EX = 0;
        WD3_M = 0;
        ALU_A = 0;
        ALU_B = 0;
        forward_A = 0;
        forward_B = 0;
        forward_A_ID = 0;
        forward_B_ID = 0;
    end
    
    // IF Stage
    
    IMem IMem_1(PC_out, instr);
    Register PCReg_IF(PC_out, PC_in, rst, clk);
    always @(*) begin
        case (PCSel_EX)
            1'b0: begin
                PC_in = PC_out + 4;
                instr_IF = instr;
            end
            1'b1: begin
                PC_in = ALUResult_EX;
                instr_IF = 32'h0000_0013; //nop
            end
            default: begin
                PC_in = PC_out + 4;
                instr_IF = instr;
            end
        endcase
    end
    
    // IF Stage
    // ID Stage
    ControlLogic_ID ConLogi_1(instr_ID, WE3_ID, ImmSel_ID, BrUn_ID, BSel_ID, ASel_ID, ALUSel_ID, MemRW_ID, MemC_ID, WBSel_ID);
    RegFile RegFile_1(clk, WE3_WB, instr_ID[19:15], instr_ID[24:20], instr_WB[11:7], WD3_WB, RD1, RD2, X1, X2, X3, X4);
    Register PCreg_ID(PC_ID, PC_out, rst, clk);
    Register instrReg_ID(instr_F, instr_IF, rst, clk);
    always @(*) begin
        case (PCSel_EX)
            1'b0: begin
                instr_ID = instr_F;
            end
            1'b1: begin
                instr_ID = 32'h0000_0013; //nop
            end
            default: begin
                instr_ID = instr_F;
            end
        endcase
    end
    always@(*) begin
        if (instr_WB[11:7] == instr_ID[19:15] && WE3_WB && instr_WB[11:7] != 0)
            forward_A_ID = 1'b1; 
        else
            forward_A_ID = 1'b0; 

        if (instr_WB[11:7] == instr_ID[24:20] && WE3_WB && instr_WB[11:7] != 0)
            forward_B_ID = 1'b1; 
        else 
            forward_B_ID = 1'b0;
            
        case (forward_A_ID)
            1'b0: RD1_ID = RD1;            // 从寄存器文件
            1'b1: RD1_ID = WD3_WB;            // 从 WB 阶段
            default: RD1_ID = 32'bx;
        endcase
    
        case (forward_B_ID)
            1'b0: RD2_ID = RD2;            // 从寄存器文件
            1'b1: RD2_ID = WD3_WB;            // 从 WB 阶段
            default: RD2_ID = 32'bx;
        endcase
    end
    
    // EX Stage
    ImmGen ImmGen_1(instr_EX, ImmSel_EX, Imm);
    ALU ALU_1(ALUSel_EX, ALU_A, ALU_B, ALUResult_EX);
    ControlLogic_EX ControlLogi_EX(instr_EX, BrEq, BrLt, PCSel_EX);
    BranchComp BranchComp_1(RD1_EX, RD2_EX, BrUn_EX, BrEq, BrLt);
    Register PCReg_EX(PC_EX, PC_ID, rst, clk);
    Register instrReg_EX(instr_EX, instr_ID, rst, clk);
    Register WE3Reg_EX(WE3_EX, WE3_ID, rst, clk);
    Register ImmSelReg_EX(ImmSel_EX, ImmSel_ID, rst, clk);
    Register BrUnReg_EX(BrUn_EX, BrUn_ID, rst, clk);
    Register BSelReg_EX(BSel_EX, BSel_ID, rst, clk);
    Register ASelReg_EX(ASel_EX, ASel_ID, rst, clk);
    Register ALUSelReg_EX(ALUSel_EX, ALUSel_ID, rst, clk);
    Register MemRWReg_EX(MemRW_EX, MemRW_ID, rst, clk);
    Register MemCReg_EX(MemC_EX, MemC_ID, rst, clk);
    Register WBSelReg_EX(WBSel_EX, WBSel_ID, rst, clk);
    Register RD1Reg_EX(RD1_F, RD1_ID, rst, clk);
    Register RD2Reg_EX(RD2_F, RD2_ID, rst, clk);
    
    always@(*) begin
        if (instr_M[11:7] == instr_EX[19:15] && WE3_M && instr_M[11:7] != 0)
            forward_A = 2'b10; 
        else if (instr_WB[11:7] == instr_EX[19:15] && WE3_WB && instr_WB[11:7] != 0)
            forward_A = 2'b01; 
        else
            forward_A = 2'b00; 

        if (instr_M[11:7] == instr_EX[24:20] && WE3_M && instr_M[11:7] != 0)
            forward_B = 2'b10; 
        else if (instr_WB[11:7] == instr_EX[24:20] && WE3_WB && instr_WB[11:7] != 0)
            forward_B = 2'b01; 
        else 
            forward_B = 2'b00;
            
        case (forward_A)
            2'b00: RD1_EX = RD1_F;            // 从寄存器文件
            2'b10: RD1_EX = WD3_M;            // 从 MEM 阶段
            2'b01: RD1_EX = WD3_WB;           // 从 WB 阶段
            default: RD1_EX = 32'bx;
        endcase
    
        // ALU_B 的数据来源
        case (forward_B)
            2'b00: RD2_EX = RD2_F;            // 从寄存器文件
            2'b10: RD2_EX = WD3_M;            // 从 MEM 阶段
            2'b01: RD2_EX = WD3_WB;           // 从 WB 阶段
            default: RD2_EX = 32'bx;
        endcase
    end
    always @(*) begin
        case (ASel_EX)
            1'b1: begin ALU_A = PC_EX; end
            1'b0: begin ALU_A = RD1_EX; end
        endcase
        case (BSel_EX)
            1'b0: begin ALU_B = RD2_EX; end
            1'b1: begin ALU_B = Imm; end
        endcase
    end
    
    // EX Stage
    // Mem Stage
    
    DMem DMem_1(ALUResult_M, RD2_M, MemC_M, MemRW_M, clk, MemReadData);
    
    Register PCReg_M(PC_M, PC_EX, rst, clk);
    Register instrReg_M(instr_M, instr_EX, rst, clk);
    Register WE3Reg_M(WE3_M, WE3_EX, rst, clk);
    Register MemRWReg_M(MemRW_M, MemRW_EX, rst, clk);
    Register MemCReg_M(MemC_M, MemC_EX, rst, clk);
    Register WBSelReg_M(WBSel_M, WBSel_EX, rst, clk);
    Register ALUResultReg_M(ALUResult_M, ALUResult_EX, rst, clk);
    Register RD2Reg_M(RD2_M, RD2_EX, rst, clk);

    always @(*) begin
        case (WBSel_M)
            2'b00: begin WD3_M = MemReadData; end
            2'b01: begin WD3_M = ALUResult_M; end
            2'b10: begin WD3_M = PC_M + 4; end
            default: WD3_M = 32'bx;
        endcase
    end
    
    // Mem Stage
    // WB Stage
    Register instrReg_WB(instr_WB, instr_M, rst, clk);
    Register WE3Reg_WB(WE3_WB, WE3_M, rst, clk);
    Register WBSelReg_WB(WBSel_WB, WBSel_M, rst, clk);
    Register WD3Reg_WB(WD3_WB, WD3_M, rst, clk);
    
    // WB Stage
    
    
endmodule
