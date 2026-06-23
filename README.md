VLSI IC Design Internship Assignments

This repository contains a collection of digital design and verification assignments completed as part of RTL design, SystemVerilog, and computer architecture learning. The projects range from basic combinational circuits to a full CNN accelerator verification environment using SystemVerilog.

Completed Assignments include
BCD Adder
Ripple Carry Adder (RCA)
Encoder
FIFO
AMBA APB Slave Interface


Final Project: 
CNN Accelerator Verification (SystemVerilog)

Description
Developed a SystemVerilog-based verification environment for a CNN (Convolutional Neural Network) hardware accelerator. The testbench follows a modular architecture similar to UVM, including generator, driver, monitor, scoreboard, and environment.

 Architecture Components
Interface (cnn_if)
Clock, reset, and enable signals
Image write interface
Weight configuration interface
Output classification interface

Features
Randomized test stimulus generation
File-based MNIST input loading
Functional correctness checking
Automated pass/fail reporting
Support for runtime weight loading

Results
Fully automated simulation flow
Verified CNN classification correctness
Pass/Fail tracking for multiple test cases

Tools Used
SystemVerilog
Vivado Simulator
MNIST dataset (text format)
RTL design environment


Skills Gained Across Projects
Digital logic design
RTL modeling in Verilog/SystemVerilog
Verification methodology (UVM-style thinking)
Bus protocol understanding (AMBA APB)
Testbench architecture design
File-based stimulus generation
Debugging waveform and simulation issues

This set of assignments builds a complete foundation in digital design and verification, progressing from basic combinational circuits to a full CNN accelerator verification system.
