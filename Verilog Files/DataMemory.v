`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:28:20 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(data_out,mem_read,mem_write,data_in,address,reset,clk);
    input mem_read,mem_write,clk,reset;
    input [31:0] data_in;
    input [31:0] address;
    output [31:0] data_out;
   
     blk_mem_gen_0 DATA_MEM(
      .clka(clk),        
      .wea(mem_write),      
      .addra(address),  
      .dina(data_in),    
      .douta(data_out)  
    );
endmodule
