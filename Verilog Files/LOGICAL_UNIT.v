`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:52:12 PM
// Design Name: 
// Module Name: LOGICAL_UNIT
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


module LOGICAL_UNIT(out,in1,in2,operation);
     input [31:0] in1,in2;
     input [1:0] operation;
     output [31:0] out;
     
     wire [31:0] t0,t1,t2,t3;
     
     AND32BIT        A1(t0,in1,in2);
     OR32BIT         O1(t1,in1,in2);
     XOR32BIT        X1(t2,in1,in2);
     COMPLEMENT32BIT C1(t3,in1);
     
     MUX4TO1         M1(out,t0,t1,t2,t3,operation);
endmodule
