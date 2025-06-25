`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:29:19
// Design Name: 
// Module Name: MUX16TO1_32_BIT
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


module MUX16TO1_32BIT(out,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,sel);
    input [31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
    input [3:0] sel;
    output [31:0] out;
    
    wire [31:0] out1,out2;
    MUX8TO1_32BIT M1(out1,in0,in1,in2,in3,in4,in5,in6,in7,sel[2:0]);
    MUX8TO1_32BIT M2(out2,in8,in9,in10,in11,in12,in13,in14,in15,sel[2:0]);
    
    MUX2TO1       M3(out,out1,out2,sel[3]);
endmodule
