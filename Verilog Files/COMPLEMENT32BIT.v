`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:20:45
// Design Name: 
// Module Name: COMPLEMENT32BIT
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


module COMPLEMENT32BIT(out,in);
    input [31:0] in;
    output [31:0] out;
    
    COMPLEMENT C0(out[7:0],in[7:0]);
    COMPLEMENT C1(out[15:8],in[15:8]);
    COMPLEMENT C2(out[23:16],in[23:16]);
    COMPLEMENT C3(out[31:24],in[31:24]);
endmodule
