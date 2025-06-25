`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 10:22:55 PM
// Design Name: 
// Module Name: TOP_LEVEL_MODULE
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


module TOP_LEVEL_MODULE(out,ALUfunc,source1,source2,destination,reset,clk);
    input clk,reset;
    input [3:0] source1,source2,destination,ALUfunc;
    output reg [15:0] out;
    
    wire [31:0] A,B,Z;
    wire [31:0] write_back;
    wire [31:0] _out;
    reg read,write;
    wire clk2;
    reg [2:0] state,nextstate;
    
    CLKDiv        CL(clk,clk2);
    REGISTER_BANK R(_out,A,B,source1,source2,destination,Z,read,write,clk2);
    ALU           K_ALU(Z,A,B,ALUfunc);
    
    initial
    begin
        state = 6;
    end
    
   always@(posedge clk2 or posedge reset)
    begin
        if(reset) state = 0;
        else 	  state = nextstate;
    end
    
    always@(state)
    begin
        case(state)
            0 : begin read = 0;write = 0;nextstate = 1; end
            1 : begin read = 1;write = 0;nextstate = 2; end
            2 : begin read = 0;write = 1;nextstate = 3; end
            3 : begin read = 0;write = 0;out = 16'b0;nextstate = 4; end
            4 : begin read = 0;write = 0;out = _out[15:0];nextstate = 5; end
            5 : begin read = 0;write = 0;out = _out[31:16];nextstate = 6; end
            6 : begin read = 0;write = 0;out = 16'b0; end            
        endcase
    end
    
endmodule
