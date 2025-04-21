# 💻 Custom Instruction Set Processor – Verilog (Harvard Architecture)
This project is a custom processor designed and implemented in Verilog HDL based on the Harvard Architecture, featuring separate instruction and data memory units. The processor includes a fully functional Control Unit and Main Datapath, capable of executing a defined instruction set with both basic and conditional instructions.

# 🔧 Features:
8 general-purpose registers and multiple special-purpose registers (SPRs)

Dedicated Instruction Memory (ROM) and Data Memory (RAM)

ALU supporting arithmetic and logic operations as defined in the instruction set

Control Unit with conditional execution support using status flags

Modular design: clean separation between Control Unit and Datapath

Condition-based instruction execution (e.g., based on Zero, Carry flags)

# 📁 Structure:
datapath.v – Implements main datapath components

control_unit.v – Controls instruction decoding and signal generation

alu.v – Performs arithmetic/logic operations

register_file.v – 8-register file with read/write capabilities

memory.v – Separate instruction and data memory

top.v – Top-level integration

testbench.v – Testbench for functional verification

# 📌 Instruction Set:
Includes basic operations (load, store, add, sub, etc.) and conditional instructions (e.g., ADDZ, MOVC) executed based on status flags.

# Flow Diagram

![16 bit processor](https://github.com/user-attachments/assets/01342005-b424-4b0a-b04f-8ed42c736315)

