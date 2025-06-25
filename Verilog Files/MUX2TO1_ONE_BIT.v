`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 07:47:25 PM
// Design Name: 
// Module Name: MUX2TO1_ONE_BIT
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


module MUX2TO1_ONE_BIT(out,in0,in1,sel);
    input in0,in1,sel;
    output out;
    
    wire t1,t2,t3;
    
    not G1(t1,sel);
    and G2(t2,t1,in0);
    and G3(t3,sel,in1);
    or  G4(out,t2,t3);
endmodule
