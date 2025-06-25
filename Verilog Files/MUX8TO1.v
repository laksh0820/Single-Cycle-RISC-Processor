`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:45:10 PM
// Design Name: 
// Module Name: MUX8TO1
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


module MUX8TO1(out,in,sel);
    input [7:0] in;
    input [2:0] sel;
    output out;
    
    wire t1,t2;
    
    MUX4TO1_ONE_BIT M1(t1,in[3:0],sel[1:0]);
    MUX4TO1_ONE_BIT M2(t2,in[7:4],sel[1:0]);
    
    MUX2TO1_ONE_BIT M3(out,t1,t2,sel[2]);
endmodule
