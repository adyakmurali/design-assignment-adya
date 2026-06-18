Design and Verification of AMBA APB Slave Using SystemVerilog

Designed and verify an AMBA APB (Advanced Peripheral Bus) Slave module using SystemVerilog and validate its functionality through a class-based verification environment.

AMBA (Advanced Microcontroller Bus Architecture) is a bus protocol developed to enable communication between components in a System-on-Chip (SoC). APB (Advanced Peripheral Bus) is a low-power and low-complexity bus used for connecting peripheral devices such as timers, UART, GPIO, and memory blocks.
This implements an APB Slave module capable of performing read and write operations using APB control signals and verifies its operation using a SystemVerilog testbench.

Design Description

The APB slave module consists of a finite state machine (FSM) with three states:

1. IDLE
Default state after reset.
Waits for the slave selection signal (PSEL).
2. SETUP
Address and control information are captured.
Prepares for data transfer.
3. ACCESS
Actual read or write operation occurs.
PREADY is asserted to indicate transaction completion.

The slave contains:
256-word internal memory
32-bit data width
8-bit address width

Verification Methodology
A class-based verification environment was created using SystemVerilog.

Generator
Generates randomized transactions for write and read operations.

Driver
Acts as an APB Master and converts transactions into bus-level signals.

Monitor
Observes DUT signals and collects transaction information.

Scoreboard
Maintains reference memory and compares expected and actual read data.

Environment
Connects generator, driver, monitor, and scoreboard.

Test
Controls execution and determines number of transactions.

Top Module
Integrates:

Clock generation
Interface
DUT
Reset logic
Program block
Waveform dumping
Working Procedure
Reset initializes APB Slave.
Generator creates random write transactions.
Driver sends APB protocol signals.
Slave writes data into memory.
Generator issues read transactions for same address.
Monitor captures responses.
Scoreboard compares expected and actual data.
Pass/Fail result is displayed.

Simulation Result
Simulation executed successfully.

Observed Output:
PASS = 10
FAIL = 0

This confirms:
Successful APB write operation
Successful APB read operation
Correct FSM transitions
Proper verification environment functionality

Conclusion
The AMBA APB Slave module was successfully designed and verified using SystemVerilog. The APB protocol transactions were implemented through a finite state machine and validated using a class-based verification environment. The simulation results confirmed correct communication between the APB master behavior and slave design with all transactions passing successfully.

<img width="1600" height="976" alt="image" src="https://github.com/user-attachments/assets/a5a4dd76-f10e-454a-b252-93bb3e493991" />

