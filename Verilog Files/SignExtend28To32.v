`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:06:27 PM
// Design Name: 
// Module Name: SignExtend28To32
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


module SignExtend28To32(imm32,imm28);
    input [27:0] imm28;
    output [31:0] imm32;
    assign imm32 = {{4{imm28[27]}},imm28};
endmodule
