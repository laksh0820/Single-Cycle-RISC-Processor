`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 07:44:55 PM
// Design Name: 
// Module Name: MUX8TO1_32BIT
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


module MUX8TO1_32BIT(out,in0,in1,in2,in3,in4,in5,in6,in7,sel);
    input [31:0] in0,in1,in2,in3,in4,in5,in6,in7;
    input [2:0] sel;
    output [31:0] out;
    
    wire [31:0] t0,t1;
    
    MUX4TO1 M0(t0,in0,in1,in2,in3,sel[1:0]);
    MUX4TO1 M1(t1,in4,in5,in6,in7,sel[1:0]);
    
    MUX2TO1 M2(out,t0,t1,sel[2]);
endmodule
