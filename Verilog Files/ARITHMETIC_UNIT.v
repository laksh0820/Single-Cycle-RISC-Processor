`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:52:01 PM
// Design Name: 
// Module Name: ARITHMETIC_UNIT
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


module ARITHMETIC_UNIT(zero,sign,out,in1,in2,cin,operation);
    input [31:0] in1,in2;
    input cin;
    input [1:0] operation;
    output [31:0] out;
    output zero,sign;
    
    wire [31:0] t1,t2,t3,w1,w2;
    wire w0,t30_,t31_;
    
    or              G0(w0,operation[0],operation[1]);
    COMPLEMENT32BIT C1(w1,in2);
    MUX2TO1         M1(w2,in2,w1,w0);
    
    ADDER32BIT      A(t1,in1,w2,w0);
    assign          t2 = {30'b0,t1[31]};
    or              O(t30_,t1[0],t1[1],t1[2],t1[3],t1[4],t1[5],t1[6],t1[7],
                         t1[8],t1[9],t1[10],t1[11],t1[12],t1[13],t1[14],t1[15],
                         t1[16],t1[17],t1[18],t1[19],t1[20],t1[21],t1[22],t1[23],
                         t1[24],t1[25],t1[26],t1[27],t1[28],t1[29],t1[30],t1[31]);
    xor              X(t31_,t30_,t1[31]);
    assign           t3 = {30'b0,t31_};
    
    MUX4TO1         M2(out,t1,t1,t2,t3,operation);

    nor             N1(zero,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],
                            out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],
                            out[16],out[17],out[18],out[19],out[20],out[21],out[22],out[23],
                            out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31]); 

    assign          sign = out[31];  
endmodule
