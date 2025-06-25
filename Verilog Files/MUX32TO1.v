`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:46:21
// Design Name: 
// Module Name: MUX32TO1
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


module MUX32TO1(out,in,sel);
    input [31:0] in;
    input [4:0] sel;
    output out;
    
    wire t1,t2,t3,t4;
    
    MUX8TO1         M1(t1,in[7:0],sel[2:0]);
    MUX8TO1         M2(t2,in[15:8],sel[2:0]);
    MUX8TO1         M3(t3,in[23:16],sel[2:0]);
    MUX8TO1         M4(t4,in[31:24],sel[2:0]);
    
    MUX4TO1_ONE_BIT M5(out,{t4,t3,t2,t1},sel[4:3]);
endmodule
