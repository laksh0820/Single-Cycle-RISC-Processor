`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:49:30 PM
// Design Name: 
// Module Name: HAM
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


module HAM(out,in);
    input [7:0] in;
    output [3:0] out;
    
    wire [1:0] w1,w2;
    wire [2:0] w3; 
    
    FULL_ADDER F1(w1[0],w1[1],in[7],in[6],in[5]);
    FULL_ADDER F2(w2[0],w2[1],in[4],in[3],in[2]);
   
    ADDER2BIT  A3(w3[1:0],w3[2],w1,w2,in[1]);
    
    ADDER3BIT  A4(out[2:0],out[3],w3,3'b000,in[0]);
    
endmodule
