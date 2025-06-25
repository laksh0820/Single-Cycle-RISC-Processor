`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:48:13 PM
// Design Name: 
// Module Name: MUX4TO1_ONE_BIT
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


module MUX4TO1_ONE_BIT(out,in,sel);
    input [3:0] in;
    input [1:0] sel;
    output out;
    
    wire t1,t2;
    
    MUX2TO1_ONE_BIT M1(t1,in[0],in[1],sel[0]);
    MUX2TO1_ONE_BIT M2(t2,in[2],in[3],sel[0]);
    
    MUX2TO1_ONE_BIT M3(out,t1,t2,sel[1]);
endmodule
