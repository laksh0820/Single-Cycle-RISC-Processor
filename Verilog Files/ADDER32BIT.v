`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:36:16
// Design Name: 
// Module Name: ADDER32BIT
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


module ADDER32BIT(sum,in1,in2,cin);
    input [31:0] in1,in2;
    input cin;
    output [31:0] sum;
    
	wire[3:0] carry;
	
	ADDER8BIT  A0(sum[7:0],carry[0],in1[7:0],in2[7:0],cin);
	ADDER8BIT  A1(sum[15:8],carry[1],in1[15:8],in2[15:8],carry[0]);
	ADDER8BIT  A2(sum[23:16],carry[2],in1[23:16],in2[23:16],carry[1]);
	ADDER8BIT  A3(sum[31:24],carry[3],in1[31:24],in2[31:24],carry[2]);
endmodule
