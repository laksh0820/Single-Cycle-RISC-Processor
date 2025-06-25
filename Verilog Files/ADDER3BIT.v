`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:09:32 PM
// Design Name: 
// Module Name: ADDER3BIT
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


module ADDER3BIT(out,carry_out,in1,in2,cin);
    input [2:0] in1,in2;
    input cin;
    output [2:0] out;
    output carry_out;
    
    wire w0;
    
    ADDER2BIT  A10(out[1:0],w0,in1[1:0],in2[1:0],cin);
    FULL_ADDER A2(out[2],carry_out,in1[2],in2[2],w0);
endmodule
