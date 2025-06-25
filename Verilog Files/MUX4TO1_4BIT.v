`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 10:29:23 PM
// Design Name: 
// Module Name: MUX4TO1_4BIT
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


module MUX4TO1_4BIT(out,in0,in1,in2,in3,sel);
    input [3:0] in0,in1,in2,in3;
    input [1:0] sel;
    output [3:0] out;
    
    wire [3:0] t1,t2;
    
    MUX2TO1 M1(t1,in0,in1,sel[0]);
    MUX2TO1 M2(t2,in2,in3,sel[0]);
    
    MUX2TO1 M3(out,t1,t2,sel[1]);
endmodule
