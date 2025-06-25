`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 07:39:36 PM
// Design Name: 
// Module Name: REGISTER_BANK
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


module REGISTER_BANK(outZ,outA,outB,source1,source2,destination,write_data,read,write,reset,clk,WMFC);
    input [3:0] source1,source2,destination;
    input clk,read,reset,write,WMFC;
    input [31:0] write_data;
    output reg [31:0] outA,outB,outZ;
    
    reg [31:0] R[0:15];
    
    always@(negedge clk)
    begin     
        if(read)
        begin
            outA <= R[source1];
            outB <= R[source2];
        end
    end
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            R[0]<=0;
            R[1]<=0;
            R[2]<=0;
            R[3]<=0;
            R[4]<=0;
            R[5]<=0;
            R[6]<=0;
            R[7]<=0;
            R[8]<=0;
            R[9]<=0;
            R[10]<=0;
            R[11]<=0;
            R[12]<=0;
            R[13]<=0;
            R[14]<=0;
            R[15]<=0;
        end
        else
            if(WMFC)
            begin
                if(write)
                begin
                    if(destination)
                        R[destination] = write_data;
                    outZ = R[destination];
                end
            end
    end
    
endmodule
