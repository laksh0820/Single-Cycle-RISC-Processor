`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:51:27 PM
// Design Name: 
// Module Name: OR
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


module OR(out,in1,in2);
    input [7:0] in1,in2;
    output [7:0] out;
    
    or O0(out[0],in1[0],in2[0]);
    or O1(out[1],in1[1],in2[1]);
    or O2(out[2],in1[2],in2[2]);
    or O3(out[3],in1[3],in2[3]);
    or O4(out[4],in1[4],in2[4]);
    or O5(out[5],in1[5],in2[5]);
    or O6(out[6],in1[6],in2[6]);
    or O7(out[7],in1[7],in2[7]);
    
endmodule
