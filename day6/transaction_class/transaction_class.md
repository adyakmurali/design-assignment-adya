Transaction Class for FIFO Verification

Created a transaction class for the designed FIFO using SystemVerilog. The transaction class is used in verification to represent the input and output signals of the FIFO and generate test data during simulation.

Description:

A transaction class is a SystemVerilog class that encapsulates all the signals required for a single operation of the Design Under Test (DUT). For FIFO verification, the transaction class contains randomized input signals and output variables used to observe FIFO behavior.
The created transaction class includes the FIFO control signals such as reset (rst), write enable (wrenb), read enable (rdenb), and input data (data_in) as randomized variables. The output signals such as output data (data_out), full condition (full), and empty condition (empty) are declared as normal variables to capture the FIFO response.

A distribution constraint (dist) is applied to the write enable signal to influence randomization and make write operations occur more frequently during simulation. This enables controlled random testing instead of purely equal random values.
A display function is included to print the values of all transaction variables during simulation for easier observation and debugging.

Features:

Uses randomized input signals for test generation.
Stores FIFO output responses for verification.
Applies constrained randomization using distribution constraints.
Provides display functionality for monitoring simulation results.
Supports reusable and structured verification methodology.

Conclusion:

The transaction class provides an organized method for generating and managing FIFO test data. It improves verification efficiency by grouping related signals together and enabling controlled random stimulus generation for functional validation of the FIFO design.
