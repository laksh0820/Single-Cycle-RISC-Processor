`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:06:56 PM
// Design Name: 
// Module Name: SignExtend15To32
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


module SignExtend15To32(imm32,imm15);
    input [14:0] imm15;
    output [31:0] imm32;
    assign imm32 = {{17{imm15[14]}},imm15};
endmodule
