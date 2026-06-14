FIFO USING SYSTEMVERILOG INTERFACE

<img width="786" height="488" alt="image" src="https://github.com/user-attachments/assets/c854b595-e3f5-4dae-b360-5886fa8a4dbe" />

Designed and simulated a First In First Out (FIFO) memory using Verilog HDL and verify its operation using a SystemVerilog interface-based testbench.

FIFO (First In First Out) is a memory structure in which the first data stored is the first data retrieved. It is commonly used in buffering and data transfer applications. FIFO performs data storage through write operations and retrieves stored data through read operations.

In this design, an 8-bit wide FIFO with 8 memory locations was implemented. Write and read operations are controlled using write enable and read enable signals. The FIFO uses write and read pointers to track memory locations and generate full and empty status conditions.
A SystemVerilog interface was used to group related signals together, reducing repeated signal declarations and simplifying module connections during simulation.

Modules Used:
fifo.v
fifo_test.sv

Inputs:
Clock (clk)
Reset (rst)
Write Enable (wrenb)
Read Enable (rdenb)
Data Input [7:0]

Outputs:
Data Output [7:0]
Full
Empty

Procedure:
Design the FIFO module using Verilog HDL.
Create memory locations and pointer logic for write and read operations.
Implement full and empty condition checking.
Create a SystemVerilog interface for signal grouping.
Develop a simulation testbench and apply input test cases.
Run Behavioral Simulation in Vivado.
Observe waveform outputs and verify FIFO operation.

Test Cases:
Write Operation:
Data Input = 10
Data Input = 20
Data Input = 30

Read Operation:
Enable read and observe output sequence.

Result:
The FIFO module was successfully implemented and simulated using Verilog HDL and SystemVerilog interface methodology. The waveform verified successful write and read operations with correct FIFO data sequence.
