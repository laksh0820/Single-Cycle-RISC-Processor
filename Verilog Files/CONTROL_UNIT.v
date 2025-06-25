`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 08:24:33 PM
// Design Name: 
// Module Name: CONTROL_UNIT
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

`define ADD 9'b000000000
`define SUB 9'b000000001
`define SLT 9'b000000010
`define SGT 9'b000000011
`define AND 9'b000000100
`define OR  9'b000000101
`define XOR 9'b000000110
`define NOT 9'b000000111
`define SLL 9'b000001001
`define SRL 9'b000001010
`define SRA 9'b000001011
`define NOR 9'b000001100
`define INC 9'b000001101
`define DEC 9'b000001110
`define HAM 9'b000001111
`define MOVE  9'b000011100
`define CMOV 9'b000011101

`define ADDI 9'b000010000
`define SUBI 9'b000010001
`define SLTI 9'b000010010
`define SGTI 9'b000010011
`define ANDI 9'b000010100
`define ORI 9'b000010101
`define XORI 9'b000010110
`define NOTI 9'b000010111
`define LUI 9'b000001000
`define NORI 9'b000011100
`define SLLI 9'b000011001
`define SRLI 9'b000011010
`define SRAI 9'b000011011

`define LD 9'b000100000
`define ST 9'b001000000

`define BMI 9'b001100000
`define BPL 9'b010000000
`define BZ  9'b010100000
`define BR  4'b0110

`define CALL 4'b0111
`define RET  9'b100000000
`define HALT 9'b100100000
`define NOP  9'b101000000

module CONTROL_UNIT(WMFC,source1,source2,destination,ALUfunc,mem_read,mem_write,reg_read,reg_write,imm_sel,write_info_sel,ALU_in2,write_reg_sel,branch_op,jump_addr_sel,PC_in,PC_sel,instruction,zero,sign,reset,clk);
    input [31:0] instruction;
    input zero,sign,reset,clk;
    output reg WMFC;
    output reg [3:0] source1,source2,destination;
    output reg [4:0] ALUfunc;
    output reg mem_read,mem_write,reg_read,reg_write,imm_sel,ALU_in2,branch_op,jump_addr_sel,PC_in,PC_sel;
    output reg [1:0] write_info_sel,write_reg_sel;
    
    reg [2:0] state;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset) begin state<=0; mem_write<=0; end
        else
            case(state)
            0: begin state<=1; WMFC<=0; end
            1: begin state<=2; WMFC<=0; end
            2: 
                begin
                    case({instruction[31:28],instruction[4:0]})
                    `LD:     begin state<=3; WMFC<=0; end
                    `ST:     begin state<=3; WMFC<=0; end
                    default: begin state<=3; WMFC<=1; end
                    endcase
                end
           3:  
                begin
                    case({instruction[31:28],instruction[4:0]})
                    `LD:     begin state<=4; WMFC<=0;  end
                    `ST:     begin state<=4; WMFC<=1; mem_write<=1;  end
                    default: begin state<=1; WMFC<=0;  end
                    endcase
                end
           4:
                begin
                    case({instruction[31:28],instruction[4:0]})
                    `LD:     begin state<=5; WMFC<=0;  end
                    `ST:     begin state<=1; WMFC<=0; mem_write<=0; end
                    default: begin state<=1; WMFC<=0;  end
                    endcase
                end
           5:  
                begin
                    case({instruction[31:28],instruction[4:0]})
                    `LD:     begin state<=6; WMFC<=1; end
                    `ST:     begin state<=1; WMFC<=0; end
                    default: begin state<=1; WMFC<=0; end
                    endcase
                end
           6:   begin state<=1; WMFC<=0; end
           default: begin state<=1; WMFC<=0; end
           endcase
    end
    
    
    always@(*)
    begin
        mem_read=0;
        reg_read=0;
        reg_write=0;
        imm_sel=0;
        write_info_sel=0;
        ALU_in2=0;
        write_reg_sel=0;
        branch_op=0;
        jump_addr_sel=0;
        PC_in=1;
        PC_sel=0;
        
        case({instruction[31:28],instruction[4:0]})
        `ADD:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SUB:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SLT:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SGT:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `AND:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `OR:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `XOR:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `NOT:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SLL:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SRL:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `SRA:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `NOR:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `INC:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `DEC:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `HAM:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `MOVE:
            begin
                source1=instruction[27:24];
                source2=4'b0000;
                destination=instruction[23:20];
                ALUfunc=5'b00000;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `CMOV:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[19:16];
                ALUfunc=instruction[4:0];
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=1;
            end
        `ADDI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SUBI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SLTI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SGTI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `ANDI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `ORI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `XORI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `NOTI:
            begin
                source1=instruction[27:24];
                source2=instruction[27:24];
                destination=instruction[27:24];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `LUI:
            begin
                source1=instruction[27:24];
                source2=instruction[27:24];
                destination=instruction[27:24];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `NORI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SLLI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SRLI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `SRAI:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=instruction[4:0];
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=1;
                write_reg_sel=0;
            end
        `LD:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=5'b10000;
                mem_read=1;
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=1;
                write_info_sel=0;
                write_reg_sel=0;
            end
        `ST:
            begin
                source1=instruction[27:24];
                source2=instruction[23:20];
                destination=instruction[23:20];
                ALUfunc=5'b10000;
                mem_read=0;
                imm_sel=1;
                ALU_in2=1;
                reg_read=1;
                reg_write=0;
                write_info_sel=0;
                write_reg_sel=0;
            end
        `BMI:
            begin
                source1=instruction[27:24];
                source2=4'b0000;
                destination=instruction[23:20];
                ALUfunc=5'b00000;
                reg_read=1;
                imm_sel=1;
                branch_op=sign;
            end
        `BPL:
            begin
                source1=instruction[27:24];
                source2=4'b0000;
                destination=instruction[23:20];
                ALUfunc=5'b00000;
                reg_read=1;
                imm_sel=1;
                branch_op=(sign == 0 && zero == 0);
            end
        `BZ:
            begin
                source1=instruction[27:24];
                source2=4'b0000;
                destination=instruction[23:20];
                ALUfunc=5'b00000;
                reg_read=1;
                imm_sel=1;
                branch_op=zero;
            end
        `RET:
            begin
                source1=4'b1111;
                source2=4'b0000;
                destination=4'b0000;
                ALUfunc=5'b00000;
                jump_addr_sel=1;
                PC_sel=1;
                reg_read=1;
            end
        `HALT:
            begin
                PC_in=0;
            end
        default:
            begin
                PC_in=1;
                PC_sel=0;
            end
    endcase  

    case(instruction[31:28])
        `BR:
            begin
                source1=4'b0000;
                source2=4'b0000;
                destination=4'b0000;
                ALUfunc=5'b00000;
                jump_addr_sel=0;
                PC_sel=1;
            end
        `CALL:
            begin
                source1=4'b0000;
                source2=4'b0000;
                destination=4'b1111;
                ALUfunc=5'b00000;
                jump_addr_sel=0;
                PC_sel=1;
                reg_write=1;
                write_info_sel=2;
                write_reg_sel=2;
            end
    endcase
    end
endmodule
