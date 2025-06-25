`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:49:58 PM
// Design Name: 
// Module Name: ADDER8BIT
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


module ADDER8BIT(sum,carry_out,in1,in2,cin);
    input [7:0] in1,in2;
    input cin;
    output [7:0] sum;
    output carry_out;
    
	wire[1:0] carry;
	
	CLA4BIT CL0(sum[3:0],carry[0],in1[3:0],in2[3:0],cin);
	CLA4BIT CL1(sum[7:4],carry[1],in1[7:4],in2[7:4],carry[0]);
	
	assign carry_out = carry[1];
endmodule
