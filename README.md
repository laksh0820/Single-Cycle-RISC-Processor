# 🧮 Single-Cycle RISC Processor

## 📘 Overview

This project outlines the architecture and functionality of a custom Arithmetic Logic Unit (ALU) integrated with a Control Unit and Data Path. It defines a specialized instruction set architecture (ISA) supporting R-type, I-type, J-type, memory, and branch operations.

The design encompasses:
- Custom instruction encoding
- Register-level ALU operation
- Memory access and conditional branching
- Modular control signal flow

---

## 🏗️ Architecture Components

### 🔧 ALU
Performs arithmetic and logical operations using the instruction function field.

### 🧠 Control Unit
Generates control signals based on opcode and function field to manage the data path.

### 🛤️ Data Path
Connects all components (registers, ALU, memory) allowing instruction execution and data manipulation.

---

## 🔠 Instruction Types

| Type              | Purpose                                    |
|-------------------|--------------------------------------------|
| R-TYPE            | Register-to-register ALU operations        |
| I-TYPE (ALU)      | Immediate arithmetic and logic operations  |
| I-TYPE (Memory)   | Load and Store instructions                |
| I-TYPE (Branch)   | Conditional branching                      |
| J-TYPE            | Unconditional branching and function call  |
| No-Field Type     | Control instructions like RET, HALT, NOP   |

> 📝 See `Instruction_Format.txt` for bit-level format.

---

## 💡 Supported Instructions

- **R-Type Instructions**: ADD, SUB, SLT, SGT, AND, OR, XOR, NOT, SLL, SRL, SRA, NOR, INC, DEC, HAM, MOVE, CMOV
- **I-Type Instructions**: ADDI, SUBI, SLTI, SGTI, ANDI, ORI, XORI, NOTI, LUI, NORI, SLLI, SRLI, SRAI
- **Memory Access**: LD (Load), ST (Store)
- **Conditional Branch**: BMI (Branch if Minus), BPL (Branch if Plus), BZ (Branch if Zero)
- **J-Type Instructions**: BR (Branch), CALL (Function Call)
- **No-Field Instructions**: RET, HALT, NOP
---

## 🎛️ Control Signals

| Signal         | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `PCin`         | Enables writing to the PC register                                          |
| `PCsel`        | Selects source for next PC value                                            |
| `JumpAddr`     | Specifies source for jump address                                           |
| `WriteRegSel`  | Chooses which register to write to (RT/RD/RET)                              |
| `WriteInfoSel` | Selects data to be written (ALU output or Memory)                           |
| `RegRead`      | Enables reading from registers                                              |
| `RegWrite`     | Enables writing to registers                                                |
| `ImmSel`       | Chooses between 15-bit or 28-bit immediate value                            |
| `ALUin2`       | Selects second operand for ALU (register or immediate)                      |
| `ALUfunc`      | Specifies the ALU operation to perform                                      |
| `BranchOp`     | Type of branch (BMI, BPL, BZ, BR)                                           |
| `MemRead`      | Enables reading from memory                                                 |
| `MemWrite`     | Enables writing to memory                                                   |

---

## 📎 Design Assumptions

- Separate instruction and data memory modules.
- Register 14 is used as Stack Pointer (SP).
- Register 15 is the Return (RET) register.
- Dedicated Jump Control Unit handles PC changes for BR, CALL, RET.

---

## 📂 File Reference

- `Instruction_Format.txt` — Instruction format tables
- `Signal_Encodings.txt` — Control Signals to carry-out the instructions
- `README.md` — Project documentation (this file)

---

## 📌 Summary

This design offers a streamlined and extensible instruction set along with the corresponding data path and control logic. It serves as a foundational framework for implementing a functional CPU model in hardware or simulation.
