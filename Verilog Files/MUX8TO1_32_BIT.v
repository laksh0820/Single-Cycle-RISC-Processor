`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:46:30
// Design Name: 
// Module Name: MUX8TO1_32_BIT
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


module MUX8TO1_32_BIT(out,in0,in1,in2,in3,in4,in5,in6,in7,sel);
    input [31:0] in0,in1,in2,in3,in4,in5,in6,in7;
    input [2:0] sel;
    output [31:0] out;
    
    wire [31:0] t1,t2;
    
    MUX4TO1 M1(t1,in0,in1,in2,in3,sel[1:0]);
    MUX4TO1 M2(t2,in4,in5,in6,in7,sel[1:0]);
    
    MUX2TO1 M3(out,t1,t2,sel[2]);
endmodule
