`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:50:17 PM
// Design Name: 
// Module Name: MULTIPLIER
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


module MULTIPLIER(out,in1,in2);
    input [31:0] in1,in2;
    output [31:0] out;
    
    assign out = in1 * in2;
endmodule
