`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 07:59:47 PM
// Design Name: 
// Module Name: DEMUX1TO8
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


module DEMUX1TO8(out0,out1,out2,out3,out4,out5,out6,out7,sel);
    input [2:0] sel;
    output out0,out1,out2,out3,out4,out5,out6,out7; 
    
    wire t0,t1,t2;
    
    not N0(t0,sel[0]);
    not N1(t1,sel[1]);
    not N2(t2,sel[2]);
    
    and O0(out0,t2,t1,t0);
    and O1(out1,t2,t1,sel[0]);
    and O2(out2,t2,sel[1],t0);
    and O3(out3,t2,sel[1],sel[0]);
    and O4(out4,sel[2],t1,t0);
    and O5(out5,sel[2],t1,sel[0]);
    and O6(out6,sel[2],sel[1],t0);
    and O7(out7,sel[2],sel[1],sel[0]);
    
endmodule
