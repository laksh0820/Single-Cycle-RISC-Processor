`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:51:16 PM
// Design Name: 
// Module Name: AND
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


module AND(out,in1,in2);
    input [7:0] in1,in2;
    output [7:0] out;
        
    and A0(out[0],in1[0],in2[0]);
    and A1(out[1],in1[1],in2[1]);
    and A2(out[2],in1[2],in2[2]);
    and A3(out[3],in1[3],in2[3]);
    and A4(out[4],in1[4],in2[4]);
    and A5(out[5],in1[5],in2[5]);
    and A6(out[6],in1[6],in2[6]);
    and A7(out[7],in1[7],in2[7]);
    
endmodule
