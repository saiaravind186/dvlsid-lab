# dvlsid-lab
Digital VLSI Design Lab: A collection of Verilog experiments implementing various modeling styles including dataflow, sequential, structural, and switch-level for advanced VLSI circuit design.

# Digital VLSI Design Lab

A comprehensive collection of Verilog implementations for various digital circuit design techniques.

## Overview

This repository contains the lab experiments for ECE-5141 Digital VLSI Design Lab course, covering different modeling styles in Verilog HDL for VLSI circuit design.

## Experiments

### Experiment 1: Verilog Dataflow Modeling
Implementation of basic digital components using continuous assignment statements:
- Full adder/subtractor
- 32:1 multiplexer
- Code converters (Gray-to-Binary, 8421-to-2421)
- N-bit magnitude comparator
- 4-bit adder
- 4:16 decoder

### Experiment 2: Verilog Sequential Modeling
Circuit designs using sequential constructs (initial and always blocks):
- N-bit full adder with for-loops
- Synchronous mod-8 counter
- 8-bit priority encoder
- 4-bit up/down counter
- Universal shift register

### Experiment 3: Verilog Structural Modeling
Building hierarchical designs by instantiating modules:
- Mod-14 ripple counter
- Carry look ahead adder
- Carry select adder
- Carry save adder

### Experiment 4: Tasks, Functions and User-Defined Primitives
Implementation of reusable code blocks and custom gate-level primitives:
- 4-to-1 multiplexer as UDP
- Binary-to-Gray code converter with XOR UDP
- Two-input EXOR function
- D flip-flop as UDP

### Experiment 5: Switch Level Modeling
Transistor-level circuit implementation:
- 3-input CMOS NAND gate
- Complex function implementations (F = E(A + BCD), F = (ABC + DE))

### Experiment 6: Control Path Modeling
FSM design for controllers:
- Line follower robot
- Elevator control system
- Programmable datapath for various arithmetic operations

### Experiment 7: Euclid GCD Algorithm
Design of datapaths and control units:
- Division algorithm implementation
- 4-bit ALU datapath
- Complex function computation (F=(a*b)/(c*d))

### Experiment 8: Efficient Synthesizable FSM
Different coding styles for FSM implementation:
- Using functions for combinational logic
- Two always blocks approach
- Single always block approach

### Experiment 9: Verification Bridge Course
EDA tools and verification techniques:
- Signal generation
- Testbench construction
- Data types for verification
- Array operations

## Files Structure
Each experiment directory contains:
- Verilog source files (.v)
- Testbench code
- Simulation results (waveforms)
- Circuit schematics

## Tools Used
- Verilog HDL Simulator (EDA Playground, Cadence Xcelium)
