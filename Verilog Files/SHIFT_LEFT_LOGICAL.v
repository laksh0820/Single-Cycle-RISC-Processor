`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:43:29 PM
// Design Name: 
// Module Name: SHIFT_LEFT_LOGICAL
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

module SHIFT_LEFT_LOGICAL(out,in,shift_amt);
    input [31:0] in;
    input [4:0] shift_amt;
    output [31:0] out;
    
    wire [31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
    wire [31:0] t10,t11,t12,t13,t14,t15,t16,t17,t18,t19;
    wire [31:0] t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31;
    
    assign t0 = {31'd0, in[0]}; 
    assign t1 = {30'd0, in[0], in[1]}; 
    assign t2 = {29'd0, in[0], in[1], in[2]}; 
    assign t3 = {28'd0, in[0], in[1], in[2], in[3]}; 
    assign t4 = {27'd0, in[0], in[1], in[2], in[3], in[4]}; 
    assign t5 = {26'd0, in[0], in[1], in[2], in[3], in[4], in[5]}; 
    assign t6 = {25'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6]}; 
    assign t7 = {24'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]}; 
    assign t8 = {23'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8]}; 
    assign t9 = {22'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9]}; 
    assign t10 = {21'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10]}; 
    assign t11 = {20'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11]}; 
    assign t12 = {19'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12]}; 
    assign t13 = {18'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13]}; 
    assign t14 = {17'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14]}; 
    assign t15 = {16'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15]}; 
    assign t16 = {15'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16]}; 
    assign t17 = {14'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17]}; 
    assign t18 = {13'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18]}; 
    assign t19 = {12'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19]}; 
    assign t20 = {11'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20]}; 
    assign t21 = {10'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21]}; 
    assign t22 = {9'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22]}; 
    assign t23 = {8'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23]}; 
    assign t24 = {7'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24]}; 
    assign t25 = {6'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25]}; 
    assign t26 = {5'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26]}; 
    assign t27 = {4'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], in[27]}; 
    assign t28 = {3'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], in[27], in[28]}; 
    assign t29 = {2'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], in[27], in[28], in[29]}; 
    assign t30 = {1'd0, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], in[27], in[28], in[29], in[30]}; 
    assign t31 = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], in[27], in[28], in[29], in[30], in[31]};
    
    MUX32TO1 M0(out[0],t0,shift_amt);
    MUX32TO1 M1(out[1],t1,shift_amt);
    MUX32TO1 M2(out[2],t2,shift_amt);
    MUX32TO1 M3(out[3],t3,shift_amt);
    MUX32TO1 M4(out[4],t4,shift_amt);
    MUX32TO1 M5(out[5],t5,shift_amt);
    MUX32TO1 M6(out[6],t6,shift_amt);
    MUX32TO1 M7(out[7],t7,shift_amt);
    MUX32TO1 M8(out[8],t8,shift_amt);
    MUX32TO1 M9(out[9],t9,shift_amt);
    MUX32TO1 M10(out[10],t10,shift_amt);
    MUX32TO1 M11(out[11],t11,shift_amt);
    MUX32TO1 M12(out[12],t12,shift_amt);
    MUX32TO1 M13(out[13],t13,shift_amt);
    MUX32TO1 M14(out[14],t14,shift_amt);
    MUX32TO1 M15(out[15],t15,shift_amt);
    MUX32TO1 M16(out[16],t16,shift_amt);
    MUX32TO1 M17(out[17],t17,shift_amt);
    MUX32TO1 M18(out[18],t18,shift_amt);
    MUX32TO1 M19(out[19],t19,shift_amt);
    MUX32TO1 M20(out[20],t20,shift_amt);
    MUX32TO1 M21(out[21],t21,shift_amt);
    MUX32TO1 M22(out[22],t22,shift_amt);
    MUX32TO1 M23(out[23],t23,shift_amt);
    MUX32TO1 M24(out[24],t24,shift_amt);
    MUX32TO1 M25(out[25],t25,shift_amt);
    MUX32TO1 M26(out[26],t26,shift_amt);
    MUX32TO1 M27(out[27],t27,shift_amt);
    MUX32TO1 M28(out[28],t28,shift_amt);
    MUX32TO1 M29(out[29],t29,shift_amt);
    MUX32TO1 M30(out[30],t30,shift_amt);
    MUX32TO1 M31(out[31],t31,shift_amt);
endmodule
