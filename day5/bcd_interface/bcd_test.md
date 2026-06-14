IMPLEMENTATION OF BCD ADDER USING SYSTEMVERILOG INTERFACE

<img width="787" height="505" alt="Screenshot 2026-06-14 225250" src="https://github.com/user-attachments/assets/2b1e2d9a-eca9-4ef6-9174-5bad6c43aca8" />

Designed and simulated a Binary Coded Decimal (BCD) Adder using Verilog HDL and verify its functionality using a SystemVerilog interface-based testbench.

A Binary Coded Decimal (BCD) Adder performs addition of two decimal digits represented in binary form. Initially, two 4-bit binary inputs and an optional carry input are added using a Ripple Carry Adder (RCA). If the obtained result exceeds decimal value 9 or produces a carry, a correction factor of 0110 is added to generate a valid BCD output.

The design consists of three modules:
Full Adder – Performs single-bit binary addition.
Ripple Carry Adder (RCA) – Cascades four full adders to perform 4-bit addition.
BCD Adder – Performs decimal correction after binary addition.

A SystemVerilog interface was used in the testbench to group related input and output signals, reducing repeated signal declarations and simplifying simulation.

Modules Used:
fulladder.v
rca.v
bcd_adder.v
bcd_test.sv

Inputs:
A [3:0]
B [3:0]
Cin

Outputs:
S0, S1, S2, S3
Cout

Procedure:
Design the Full Adder module.
Construct a 4-bit Ripple Carry Adder using Full Adders.
Implement the BCD Adder correction logic.
Create a SystemVerilog interface to connect signals.
Develop a simulation testbench with different input combinations.
Run Behavioral Simulation in Vivado.
Observe the waveform and verify output values.

Test Cases:
Case 1:
A = 5
B = 2
Cin = 0

Case 2:
A = 8
B = 1
Cin = 1

Case 3:
A = 6
B = 3
Cin = 0

The BCD Adder was successfully implemented and simulated using Verilog and SystemVerilog interface methodology. The waveform verified correct transfer of inputs and generation of BCD outputs for different test conditions.
