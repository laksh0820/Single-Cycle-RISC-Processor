`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:50:52 PM
// Design Name: 
// Module Name: COMPLEMENT
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


module COMPLEMENT(out,in);
    input [7:0] in;
    output [7:0] out;
    
    not N0(out[0],in[0]);
    not N1(out[1],in[1]);
    not N2(out[2],in[2]);
    not N3(out[3],in[3]);
    not N4(out[4],in[4]);
    not N5(out[5],in[5]);
    not N6(out[6],in[6]);
    not N7(out[7],in[7]);
    
endmodule
