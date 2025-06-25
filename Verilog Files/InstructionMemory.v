`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 04:28:36 PM
// Design Name: 
// Module Name: InstructionMemory
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
 
module InstructionMemory(instruction,PC,reset,clk);
    inout clk,reset;
    input [31:0] PC;
    output [31:0] instruction;
    
     blk_mem INSTR_MEM(
      .clka(clk),         
      .wea(1'b0),      
      .addra(PC[6:0]),  
      .dina(0),    
      .douta(instruction)  
    );

//     Instruction encoding for summation of first 10 natural numbers
//     IMEM[0] = 32'b00010000000100000000000000000000; // LD R[1],0(R[0])
//     IMEM[1] = 32'b00000011000000000000000000011100; // R[3] = 0
//     IMEM[2] = 32'b00000011000100110000000000000000; // R[3] = R[3] + R[1]
//     IMEM[3] = 32'b00000001000100000000000000110000; // R[1] = R[1] + 1
//     IMEM[4] = 32'b00000001001000000000000101110001; // R[2] = R[1] - 11
//     IMEM[5] = 32'b01010010000000000000000001000000; // if(R[2] == 0) branch to 7
//     IMEM[6] = 32'b01100000000000000000000000000010; // branch to 2
//     IMEM[7] = 32'b10010000000000000000000000000000; // Halt

//      Instruction to divide two N-bit integers using non-restoring divison algorithm
//     0 :   LD R[1],0(R[0])              // contains the number of bits in two integers(N)
//     1 :   LD R[2],1(R[0])              // contains Dividend(Q)
//     2 :   LD R[3],2(R[0])              // contains Divisor(M)
//     3 :   MOVE R[4],R[1]               // used as a counter
//     4 :   MOVE R[5],R[2]               // used for computation of quotients and remainders in R[5]
//     5 :   BZ R[4],18                   // PC <= PC+18 if (R[4] = 0)
//     6 :   SUBI R[4],R[4],1             // Decrease the counter
//     7 :   SLT R[6],R[5],R[0]           // R[6] = (R[5] < R[0])? 1 : 0
//     8 :   BZ  R[6],7                   // PC <= PC+7 if (R[6] = 0)
//     9 :   SLLI R[5],R[5],1             // if the number is negative, assign R[5] = 2*R[5] + (M << N)
//    10 :   SLL  R[7],R[3],R[1]          // R[7] = (M << N)  
//    11 :   ADD  R[5],R[5],R[7]          // R[5] = R[5] + (M << N)
//    12 :   SLT R[6],R[5],R[0]           // R[6] = (R[5] < R[0])? 1 : 0
//    13 :   BZ  R[6],8                   // if the number is positive, R[5][0:0] = 1
//    14 :   BR   5                       // jump to 5
//    15 :   SLLI R[5],R[5],1             // if the number is positive, assign R[5] = 2*R[5] - (M << N)
//    16 :   SLL  R[7],R[3],R[1]          // R[7] = (M << N)  
//    17 :   SUB  R[5],R[5],R[7]          // R[5] = R[5] + (M << N)
//    18 :   SLT R[6],R[5],R[0]           // R[6] = (R[5] < R[0])? 1 : 0
//    19 :   BZ  R[6],2                   // if the number is positive, R[5][0:0] = 1
//    20 :   BR   5                       // jump to 5
//    21 :   ADDI R[5],R[5],1             // Making R[5][0:0] = 1
//    22 :   BR 5                         // jump to 5
//    23 :   SLT R[6],R[5],R[0]           // Correction step if (R[5] < 0)
//    24 :   BZ R[6],3                    // if(R[5] >= 0) jump to HALT
//    25 :   SLL  R[7],R[3],R[1]          // R[7] = (M << N)  
//    26 :   ADD R[5],R[5],R[7]           // R[5] = R[5] + (M << N)
//    27 :   HALT                         // Halt the program

//        Instruction to multiply two N-bit numbers using BOOTH's Mulitplication
//    0 :    LD R[1],0(R[0])                // contains N
//    1 :    LD R[2],1(R[0])                // contains the Mulitplier(Q)
//    2 :    LD R[3],2(R[0])                // contains the Multiplicant(M)
//    3 :    MOVE R[4],R[1]                 // used as a counter
//    4 :    MOVE R[5],R[2]                 // For performing calucations of the partial_pdt
//    5 :    SLLI R[5],R[5],1               // R[5][0:0] is used as Q(-1)
//    6 :    BZ R[4],21                     // if (R[4] = 0) jump to HALT
//    7 :    SUBI R[4],R[4],1               // Decrement the counter
//    8 :    ANDI R[6],R[5],1               // To get R[5][0:0]
//    9 :    ANDI R[7],R[5],2               // To get R[5][1:1]
//   10 :    SRLI R[7],R[7],1               // R[7] = R[7] >> 1
//   11 :    XOR R[8],R[6],R[7]             // partial_pdt[1] ^ partial_pdt[0]
//   12 :    BZ R[8],13                     // PC <= PC + 13 if(R[8] = 0) 
//   13 :    SUBI R[7],R[7],1               // R[7] = R[7] - 1
//   14 :    BZ R[7],6                      // PC <= PC + 6 if(R[7] = 0)
//   15 :    ADDI R[6],R[1],1               // R[6] = R[1] + 1
//   16 :    SLL  R[7],R[3],R[6]            // R[7] = (M << (N+1))
//   17 :    ADD  R[5],R[5],R[7]            // R[5] = R[5] + R[7]
//   18 :    SRAI R[5],R[5],1               // SHIFT_RIGHT_ARITH(R[5],1)
//   19 :    BR   6                         // jump to 6
//   20 :    ADDI R[6],R[1],1               // R[6] = R[1] + 1
//   21 :    SLL  R[7],R[3],R[6]            // R[7] = (M << (N+1))
//   22 :    SUB  R[5],R[5],R[7]            // R[5] = R[5] - R[7]
//   23 :    SRAI R[5],R[5],1               // SHIFT_RIGHT_ARITH(R[5],1)
//   24 :    BR   6                         // jump to 6
//   25 :    SRAI R[5],R[5],1               // SHIFT_RIGHT_ARITH(R[5],1)
//   26 :    BR   6                         // jump to 6
//   27 :    HALT                           // Halt
        
//        Instruction to do insertion sort of 10 numbers
//      0:        MOVE R[1],R[0]              // For counter (i) for the outer loop
//      1:        SUBI R[2],R[1],1 0          // R[2] = R[1] - 10
//      2:        BZ R[2],16                  // PC <= PC + 16 if(R[2] == 0)
//      3:        LD R[2],0(R[1])             // R[2] = MEM[R[1]+0] 
//      4:        MOVE R[3],R[0]              // R[3] <= R[0] (counter(j) for the second loop)
//      5:        SUB R[4],R[3],R[ 1]         // R[4] =  R[3] - R[1]
//      6:        BZ R[4], 7                  // PC  <=PC + 7 if(R[4] == 0)
//      7:        LD R[2],0(R[1])             // R[2] = MEM[R[1] + 0]
//      8:        LD R[4],0(R[3])             // R[4] = MEM[R[3] + 0]
//      9:        SUB R[5],R[2],R[4]          // R[5] = R[2] - R[4]
//     10:        BMI R[5],5                  // PC <= PC + 5 if(R[5] < 0)
//     11:        ADDI R[3],R[3],1            // R[3] = R[3] + 1
//     12:        BR 5                        // jump to 5
//     13:        ADDI R[1],R[1],1            // R[1] = R[1] + 1
//     14:        BR  1                       // jump to 1
//     15:        ST R[2],0(R[3])             // swap the numbers  MEM[R[3] + 0] <= R[2]
//     16:        ST R[4],0(R[1])             // MEM[R[1] + 0] <= R[4]
//     17:        BR 11                       // jump to 11
//     18:        LD R[11],0(R[0])            // R[11] <= MEM[R[0] + 0]
//     19:        LD R[11],1(R[0])            // R[11] <= MEM[R[0] + 1]
//     20:        LD R[11],2(R[0])            // R[11] <= MEM[R[0] + 2]
//     21:        LD R[11],3(R[0])            // R[11] <= MEM[R[0] + 3]
//     22:        LD R[11],4(R[0])            // R[11] <= MEM[R[0] + 4]
//     23:        LD R[11],5(R[0])            // R[11] <= MEM[R[0] + 5]
//     24:        LD R[11],6(R[0])            // R[11] <= MEM[R[0] + 6]
//     25:        LD R[11],7(R[0])            // R[11] <= MEM[R[0] + 7]
//     26:        LD R[11],8(R[0])            // R[11] <= MEM[R[0] + 8]
//     27:        LD R[11],9(R[0])            // R[11] <= MEM[R[0] + 9]
//     28:        HALT                        // Halt

//        Instruction to check HAM and CMOV
//        LD R[1],0(R[0])
//        LD R[2],1(R[0])
//        HAM R[3],R[1]
//        HAM R[4],R[2]
//        CMOV R[5],R[3],R[4]
//        HALT

endmodule
