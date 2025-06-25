`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:53:11 PM
// Design Name: 
// Module Name: MUX4TO1
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


module MUX4TO1(out,in0,in1,in2,in3,sel);
    input [31:0] in0,in1,in2,in3;
    input [1:0] sel;
    output [31:0] out;
    
    wire [31:0] t1,t2;
    
    MUX2TO1 M1(t1,in0,in1,sel[0]);
    MUX2TO1 M2(t2,in2,in3,sel[0]);
    
    MUX2TO1 M3(out,t1,t2,sel[1]);
endmodule
