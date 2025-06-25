`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:43:43 PM
// Design Name: 
// Module Name: SHIFT_RIGHT_ARITHMETIC
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


module SHIFT_RIGHT_ARITHMETIC(out,in,shift_amt);
    input [31:0] in;
    input [4:0] shift_amt;
    output [31:0] out;
    
    wire [31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
    wire [31:0] t10,t11,t12,t13,t14,t15,t16,t17,t18,t19;
    wire [31:0] t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31;
    
    assign t31 = {{31{in[31]}}, in[31]}; 
    assign t30 = {{30{in[31]}}, in[31:30]}; 
    assign t29 = {{29{in[31]}}, in[31:29]}; 
    assign t28 = {{28{in[31]}}, in[31:28]}; 
    assign t27 = {{27{in[31]}}, in[31:27]}; 
    assign t26 = {{26{in[31]}}, in[31:26]}; 
    assign t25 = {{25{in[31]}}, in[31:25]}; 
    assign t24 = {{24{in[31]}}, in[31:24]}; 
    assign t23 = {{23{in[31]}}, in[31:23]}; 
    assign t22 = {{22{in[31]}}, in[31:22]}; 
    assign t21 = {{21{in[31]}}, in[31:21]}; 
    assign t20 = {{20{in[31]}}, in[31:20]}; 
    assign t19 = {{19{in[31]}}, in[31:19]}; 
    assign t18 = {{18{in[31]}}, in[31:18]}; 
    assign t17 = {{17{in[31]}}, in[31:17]}; 
    assign t16 = {{16{in[31]}}, in[31:16]}; 
    assign t15 = {{15{in[31]}}, in[31:15]}; 
    assign t14 = {{14{in[31]}}, in[31:14]}; 
    assign t13 = {{13{in[31]}}, in[31:13]}; 
    assign t12 = {{12{in[31]}}, in[31:12]}; 
    assign t11 = {{11{in[31]}}, in[31:11]}; 
    assign t10 = {{10{in[31]}}, in[31:10]}; 
    assign t9 = {{9{in[31]}}, in[31:9]}; 
    assign t8 = {{8{in[31]}}, in[31:8]}; 
    assign t7 = {{7{in[31]}}, in[31:7]}; 
    assign t6 = {{6{in[31]}}, in[31:6]}; 
    assign t5 = {{5{in[31]}}, in[31:5]}; 
    assign t4 = {{4{in[31]}}, in[31:4]}; 
    assign t3 = {{3{in[31]}}, in[31:3]}; 
    assign t2 = {{2{in[31]}}, in[31:2]}; 
    assign t1 = {{1{in[31]}}, in[31:1]}; 
    assign t0 = in;
    
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
