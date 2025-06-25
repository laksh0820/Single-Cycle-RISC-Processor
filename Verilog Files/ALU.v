`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:48:48 PM
// Design Name: 
// Module Name: ALU
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


module ALU(out,zero,sign,in1,in2,operation);
    input [31:0] in1,in2;
    input [4:0] operation;
    output [31:0] out;
    output zero,sign;
    
    wire [31:0] t0,t1,t2,t3,t20,t21,t22,t23,t30_,t30,t31_1,t31_2,t31,t32,t33;
    wire [5:0] t33_;
    
    ARITHMETIC_UNIT         A(zero,sign,t0,in1,in2,1'b0,operation[1:0]);
    LOGICAL_UNIT            L(t1,in1,in2,operation[1:0]);
    
    SHIFT_LEFT_LOGICAL      SLL1(t20,in1,5'b10000);
    SHIFT_LEFT_LOGICAL      SLL(t21,in1,in2[4:0]);
    SHIFT_RIGHT_LOGICAL     SRL(t22,in1,in2[4:0]);
    SHIFT_RIGHT_ARITHMETIC  SRA(t23,in1,in2[4:0]);
    MUX4TO1                 M1(t2,t20,t21,t22,t23,operation[1:0]);
    
    OR32BIT                 O1(t30_,in1,in2);
    COMPLEMENT32BIT         C1(t30,t30_);
    ADDER32BIT              INC(t31_,in1,32'b00000000000000000000000000000100,1'b0);
    MUX2TO1                 M2(t31_2,in2,in1,sign);
    MUX2TO1                 M3(t31,t31_1,t31_2,operation[4]);
    ADDER32BIT              DEC(t32,in1,32'b11111111111111111111111111111011,1'b1);
    HAM_32_BIT              H(t33_,in1);
    assign                  t33 = {26'b0,t33_};
    MUX4TO1                 M4(t3,t30,t31,t32,t33,operation[1:0]);
    
    MUX4TO1                 M5(out,t0,t1,t2,t3,operation[3:2]);
endmodule
