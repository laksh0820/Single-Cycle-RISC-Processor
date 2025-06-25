`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:13:40 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(PC,NPC,PCin,clk,reset,WMFC);
    input PCin,clk,reset,WMFC;
    input [31:0] NPC;
    output reg [31:0] PC;
    
    reg [31:0] PC_prev;
   
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            PC <= 32'b0;
        else
        begin
            if(WMFC)
            begin
                if(PCin)
                begin
                    PC_prev <= NPC;
                    PC <= NPC;
                end
                else
                    PC <= PC_prev;
            end
        end
    end
endmodule
