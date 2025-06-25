`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:09:03 PM
// Design Name: 
// Module Name: FULL_ADDER
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


module FULL_ADDER(s,c,a,b,cin);
    input a,b,cin;
	output s,c;
	
	wire t1,t2,t3,t4,t5;

	xor g1(t1,a,b);
	xor g2(s,t1,cin);
	
	and g3(t2,a,b);
	and g4(t3,a,cin);
	and g5(t4,b,cin);
	or  g6(t5,t2,t3);
	or  g7(c,t5,t4);
endmodule
