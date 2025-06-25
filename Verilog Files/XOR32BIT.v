`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:27:43
// Design Name: 
// Module Name: XOR32BIT
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


module XOR32BIT(out,in1,in2);
    input [31:0] in1,in2;
    output [31:0] out;
    
    XOR X0(out[7:0],in1[7:0],in2[7:0]);
    XOR X1(out[15:8],in1[15:8],in2[15:8]);
    XOR X2(out[23:16],in1[23:16],in2[23:16]);
    XOR X3(out[31:24],in1[31:24],in2[31:24]);
endmodule
