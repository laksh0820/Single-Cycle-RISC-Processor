`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 16:11:56
// Design Name: 
// Module Name: HAM_32_BIT
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


module HAM_32_BIT(out,in);
    input [31:0] in;
    output [5:0] out;
    
    wire [1:0] w1,w2;
    wire [2:0] w3; 
    
    wire [3:0] t1,t2,t3,t4;
    wire [3:0] s1,s2,s3;
    wire c1,c2,c3;
    
    HAM         H1(t1,in[7:0]);
    HAM         H2(t2,in[15:8]);
    HAM         H3(t3,in[23:16]);
    HAM         H4(t4,in[31:24]);
    
    CLA4BIT     A1(s1,c1,t1,t2,1'b0);
    CLA4BIT     A2(s2,c2,t3,t4,1'b0);
    CLA4BIT     A3(out[3:0],c3,s1,s2,1'b0);
   
    FULL_ADDER F1(out[4],out[5],c1,c2,c3);
endmodule
