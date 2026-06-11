Implementation of Block RAM Using Verilog

2<img width="782" height="491" alt="image" src="https://github.com/user-attachments/assets/160b277e-bde6-40c8-99c8-cc719307090a" />

implemented a Block RAM (BRAM) module in Verilog for performing controlled write and read operations using separate write and read addresses.


Block RAM (BRAM) is an internal memory resource used in digital systems and FPGA designs for temporary data storage. It provides faster access compared to external memory and supports sequential read and write operations.

In this implementation, a behavioural memory array is used to represent Block RAM. Data is written into memory when write enable is active and read from memory when write enable is inactive. An asynchronous active-low reset is provided to initialise the memory contents.

Module Description:
The Block RAM module contains memory organised as 256 locations with each location storing 8 bits of data.
Inputs:
clk : Clock signal
arstn : Asynchronous active-low reset
wr_enb : Write enable control signal
wr_address [7:0] : Address used during write operation
read_address [7:0] : Address used during read operation
data_in [7:0] : Input data to be stored
Output:
dout [7:0] : Output data during read operation

Memory Depth = 256 locations
Data Width = 8 bits
Total Storage Capacity = 256 × 8 bits

Data Flow:
data_in → Memory Array → dout
