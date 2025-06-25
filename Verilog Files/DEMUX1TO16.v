`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 15:47:15
// Design Name: 
// Module Name: DEMUX1TO16
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


module DEMUX1TO16(out,sel);
    input [3:0] sel;
    output [15:0] out; 
    
    wire [15:0] _out;
    
    DEMUX1TO8 D1(_out[0],_out[1],_out[2],_out[3],_out[4],_out[5],_out[6],_out[7],sel[2:0]);
    DEMUX1TO8 D2(_out[8],_out[9],_out[10],_out[11],_out[12],_out[13],_out[14],_out[15],sel[2:0]);
    
    wire t;
    wire [7:0] w1,w2;
    
    not N(t,sel[3]);
    assign w1 = {8{t}};
    assign w2 = {8{sel[3]}};
    
    AND A1(out[7:0],_out[7:0],w1);
    AND A2(out[15:8],_out[15:8],w2);
endmodule
