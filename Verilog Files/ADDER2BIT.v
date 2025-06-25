`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:09:20 PM
// Design Name: 
// Module Name: ADDER2BIT
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


module ADDER2BIT(out,carry_out,in1,in2,cin);
    input [1:0] in1,in2;
    input cin;
    output [1:0] out;
    output carry_out;
    
    wire w0;
    
    FULL_ADDER A0(out[0],w0,in1[0],in2[0],cin);
    FULL_ADDER A1(out[1],carry_out,in1[1],in2[1],w0);
endmodule
