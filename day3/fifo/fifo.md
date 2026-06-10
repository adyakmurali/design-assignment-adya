Implementation of Face Module, FIFO and FSM-Based Output Module in Verilog

<img width="779" height="467" alt="image" src="https://github.com/user-attachments/assets/949b588b-96bc-44bf-a8ce-09100e15984b" />

Implemented a Verilog design consisting of a Face Module, FIFO buffer, and FSM-based output module for controlled 8-bit data transfer without data loss.

In digital systems, data processing blocks may operate at different speeds. If output processing is slower than input generation, incoming data may be lost. To overcome this issue, a FIFO (First In First Out) memory is introduced between modules to temporarily store data and release it in the correct order.
A finite state machine (FSM) is used to control the output operation and manage the reading process from the FIFO.


Face Module:
The Face Module receives an 8-bit input signal and transfers it to the output synchronously with the clock signal. In the current implementation, the module performs direct data forwarding and serves as the initial processing stage.
Inputs:clk,rst,s_in [7:0]
Output:s_out [7:0]

FIFO Module
The FIFO module acts as temporary storage between input and output stages.
Features:
Memory size: 8×8
Write enable and read enable control
Full and Empty status indication
Sequential data storage and retrieval.
Inputs:clk,rst,wrenb,rdenb,data_in [7:0]
Outputs:data_out [7:0],full,empty,Mod_Out Module

The Mod_Out block is implemented using a three-state FSM.
States:IDLE,S1,S2
The FSM controls when data is read from FIFO and transferred to output.
Inputs:clk,rst,d_in [7:0],empty
Outputs:rdenb,d_out [7:0]

Data Flow:
Input → Face Module → FIFO → Mod_Out → Output
