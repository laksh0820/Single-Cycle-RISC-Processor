`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:40:58 PM
// Design Name: 
// Module Name: Processor
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


module Processor(disp,clk,reset);
    input clk,reset;
    output [15:0] disp;
   
    wire [31:0] PC,NPC,NPC1,NPC2;
    wire WMFC,mem_read,mem_write,reg_read,reg_write,imm_sel,ALU_in2,branch_op,jump_addr_sel,PC_in,PC_sel,clk2;
    wire [1:0] write_info_sel,write_reg_sel;
    wire [31:0] instruction;
    wire zero,sign;
    wire [3:0] source1,source2,destination;
    wire [3:0] rs,rt,rd;
    wire [4:0] ALUfunc;
    wire [31:0] in1,in2;
    wire [31:0] out;
    wire [31:0] reg_destination_out;
    wire [31:0] write_data;
    wire [31:0] read_register_A,read_register_B,outZ;
    wire [31:0] ALU_operand_1,ALU_operand_2,ALUout;
    wire [14:0] imm15;
    wire [27:0] imm28;
    wire [31:0] imm,imm1,imm2;
    wire [3:0]  RETURN_REG;
    wire [31:0] offset;
    wire [31:0] mem_data_out;
    wire [31:0] PC_INC;

    assign RETURN_REG = 4'b1111;
    assign PC_INC = 1;
    
    CLKDiv SLOW_CLOCK(clk,clk2);
    
    CONTROL_UNIT      CU(WMFC,rs,rt,rd,ALUfunc,mem_read,mem_write,reg_read,reg_write,imm_sel,
                        write_info_sel,ALU_in2,write_reg_sel,branch_op,jump_addr_sel,PC_in,PC_sel,instruction,zero,sign,reset,clk);
    
    MUX2TO1           M1(offset,PC_INC,imm,branch_op);
    ADDER32BIT        PC1(NPC1,offset,PC,1'b0);
    MUX2TO1           M2(NPC2,imm,read_register_A,jump_addr_sel);
    MUX2TO1           M3(NPC,NPC1,NPC2,PC_sel);
    ProgramCounter    PC_COUNTER(PC,NPC,PC_in,clk,reset,WMFC);
    
    InstructionMemory IMEM(instruction,PC,reset,clk);

    MUX4TO1_4BIT      M4(destination,rt,rd,RETURN_REG,4'b0000,write_reg_sel);
    MUX4TO1           M5(write_data,mem_data_out,ALUout,NPC1,0,write_info_sel);
    assign            source1 = rs;
    assign            source2 = rt;
    REGISTER_BANK     RB(reg_destination_out,read_register_A,read_register_B,source1,source2,destination,write_data,reg_read,reg_write,reset,clk,WMFC);

    assign            imm15=instruction[19:5];
    assign            imm28=instruction[27:0];
    SignExtend28To32  SE1(imm1,imm28);
    SignExtend15To32  SE2(imm2,imm15);
    MUX2TO1           M6(imm,imm1,imm2,imm_sel);

    MUX2TO1           M7(ALU_operand_2,read_register_B,imm,ALU_in2);
    assign            ALU_operand_1 = read_register_A;
    ALU               K_ALU(ALUout,zero,sign,ALU_operand_1,ALU_operand_2,ALUfunc);

    DataMemory        DMEM(mem_data_out,mem_read,mem_write,read_register_B,ALUout,reset,clk);
    
     //assign disp = RB.R[5][15:0]; // For Division
     //assign disp = RB.R[5][16:1]; // For Mulitplication
     // assign disp = RB.R[][15:0]; // For Insertion sort 
      assign disp = RB.R[5][15:0]; // For HAM and CMOV check
endmodule
