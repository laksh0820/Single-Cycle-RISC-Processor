`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 05:52:56 PM
// Design Name: 
// Module Name: MUX2TO1
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


module MUX2TO1(out,in0,in1,sel);
    input [31:0] in0,in1;
    input sel;
    output [31:0] out;
    
    wire w1;
    wire [31:0] t1,t2,t3,t4;
    
    assign t1 = {32{sel}};
    assign t2 = {32{w1}};
    
    not      g1(w1,sel);
    AND32BIT G2(t3,t2,in0);
    AND32BIT G3(t4,t1,in1);
    OR32BIT  G4(out,t3,t4);
    
endmodule
