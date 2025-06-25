`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:54 08/21/2024 
// Design Name: 
// Module Name:    CLKDiv 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLKDiv(clk,clk2);
	input clk;
	reg[23:0] cnt;
	output reg clk2;
	
	always @ (posedge clk)
    begin
        cnt=cnt+1;
        clk2=cnt[23];
    end
endmodule
