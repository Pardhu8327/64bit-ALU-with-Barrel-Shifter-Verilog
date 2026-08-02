#  Pipelined 64-bit ALU with Barrel Shifter (Verilog)

##  Overview

This project implements a **high-performance 64-bit pipelined ALU** integrated with a **logarithmic barrel shifter**. The design uses a **multi-stage pipeline** to improve throughput and enable high-frequency operation.

---

##  Key Features

*  64-bit datapath
*  3-stage pipelined architecture
*  Integrated barrel shifter (O(log N) delay)
*  Supports arithmetic, logic, shift, and comparison
*  Valid signal propagation (valid_in → valid_out)

---

##  Supported Operations

| alu_sel | Operation |
| ------- | --------- |
| 0000    | ADD       |
| 0001    | SUB       |
| 0010    | AND       |
| 0011    | OR        |
| 0100    | XOR       |
| 0101    | SHL       |
| 0110    | SHR       |
| 0111    | ASR       |
| 1000    | SLT       |

---

##  Pipeline Stages

###  Stage 1: Input Register Stage

* Latches inputs (`A`, `B`, `alu_sel`)
* Synchronizes with clock
* Stores `valid_in`

---

###  Stage 2: Execution Stage

* Performs:

  * Addition/Subtraction
  * Logic operations
  * Barrel shifting
  * Comparison
* Stores intermediate results

---

###  Stage 3: Output Stage

* Selects final output
* Generates flags:

  * Zero
  * Negative
  * Carry
  * Overflow
* Outputs `valid_out`

---

##  Barrel Shifter

* 6-stage logarithmic structure:

  * 32, 16, 8, 4, 2, 1 shifts
* Supports:

  * Logical left shift
  * Logical right shift
  * Arithmetic right shift

---

##  Pipeline Advantage

* Increased throughput
* Reduced critical path delay
* Suitable for high-frequency processors

---

##  Simulation

Tested using xilinx Vivado

##  Applications

* CPU datapath design
* DSP processors
* FPGA-based accelerators
