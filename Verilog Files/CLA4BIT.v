`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 06:38:54 PM
// Design Name: 
// Module Name: CLA4BIT
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


module CLA4BIT(sum,carry_out,in1,in2,cin);
    input [3:0] in1,in2;
    input cin;
    output carry_out;
    output [3:0] sum;
    
    wire [3:0] carry,G,P;
	
	assign G[0] = in1[0]&in2[0];
	assign G[1] = in1[1]&in2[1];
	assign G[2] = in1[2]&in2[2];
	assign G[3] = in1[3]&in2[3];
	
	assign P[0] = in1[0]^in2[0];
	assign P[1] = in1[1]^in2[1];
	assign P[2] = in1[2]^in2[2];
	assign P[3] = in1[3]^in2[3];
	
	assign carry[0] =  G[0] | (P[0]&cin);
	assign carry[1] =  G[1] | (P[1]&G[0]) | (P[1]&P[0]&cin);
	assign carry[2] =  G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&cin);
	assign carry[3] =  G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&cin);
	
	assign sum[0] = P[0] ^cin;
	assign sum[1] = P[1] ^carry[0];
	assign sum[2] = P[2] ^carry[1];
	assign sum[3] = P[3] ^carry[2];
	
	assign carry_out = carry[3];
endmodule
