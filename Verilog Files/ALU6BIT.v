`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:34:57
// Design Name: 
// Module Name: ALU6BIT
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


module ALU6BIT(out_,in1_,in2_,operation);
    input [5:0] in1_,in2_;
    input [3:0] operation;
    output [5:0] out_;
    
    wire [7:0] in1,in2,out;
    assign in1[7:6] = 2'b00;
    assign in2[7:6] = 2'b00;
    assign in1[5:0] = in1_;
    assign in2[5:0] = in2_;
    assign out_ = out[5:0];
    
    wire [7:0] t0,t1,t2,t3,t20,t21,t22,t23,t30,t31,t32,t33;
    wire [3:0] t33_;
    assign t33[3:0] = t33_;
    assign t33[7:4] = 4'b0000;
    
    ARITHMETIC_UNIT        A(t0,in1,in2,1'b0,operation[1:0]);
    LOGICAL_UNIT           L(t1,in1,in2,operation[1:0]);
    
    assign t20 = in1;
    assign t21 = in2;
    SHIFT_LEFT_LOGICAL     SLL(t22,in1,in2[2:0]);
    SHIFT_RIGHT_LOGICAL    SRL(t23,in1,in2[2:0]);
    MUX4TO1                M1(t2,t20,t21,t22,t23,operation[1:0]);
    
    SHIFT_RIGHT_ARITHMETIC SRA(t30,in1,in2[2:0]);
    ADDER8BIT              INC(t31,in1,8'b00000100,1'b0);
    ADDER8BIT              DEC(t32,in1,8'b11111011,1'b1);
    HAM                    H(t33_,in1);
    MUX4TO1                M2(t3,t30,t31,t32,t33,operation[1:0]);
    
    MUX4TO1                M3(out,t0,t1,t2,t3,operation[3:2]);
endmodule
