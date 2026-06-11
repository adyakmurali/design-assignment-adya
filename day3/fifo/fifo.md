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



Utilization Summary

Slice LUTs          : 33 (0.08%)
Slice Registers     : 96 (0.12%)
Block RAM Tile      : 0 (0.00%)
DSP                 : 0 (0.00%)
IOB                 : 20 (6.67%)
Clock Buffer (BUFG) : 1 (3.13%)


Utilization Report

1. Slice Logic
--------------

+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |   33 |     0 |          0 |     41000 |  0.08 |
|   LUT as Logic          |   33 |     0 |          0 |     41000 |  0.08 |
|   LUT as Memory         |    0 |     0 |          0 |     13400 |  0.00 |
| Slice Registers         |   96 |     0 |          0 |     82000 |  0.12 |
|   Register as Flip Flop |   96 |     0 |          0 |     82000 |  0.12 |
|   Register as Latch     |    0 |     0 |          0 |     82000 |  0.00 |
| F7 Muxes                |    8 |     0 |          0 |     20500 |  0.04 |
| F8 Muxes                |    0 |     0 |          0 |     10250 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+
* Warning! The Final LUT count, after physical optimizations and full implementation, is typically lower. Run opt_design after synthesis, if not already completed, for a more realistic count.
Warning! LUT value is adjusted to account for LUT combining.


1.1 Summary of Registers by Type
--------------------------------

+-------+--------------+-------------+--------------+
| Total | Clock Enable | Synchronous | Asynchronous |
+-------+--------------+-------------+--------------+
| 0     |            _ |           - |            - |
| 0     |            _ |           - |          Set |
| 0     |            _ |           - |        Reset |
| 0     |            _ |         Set |            - |
| 0     |            _ |       Reset |            - |
| 0     |          Yes |           - |            - |
| 0     |          Yes |           - |          Set |
| 0     |          Yes |           - |        Reset |
| 0     |          Yes |         Set |            - |
| 96    |          Yes |       Reset |            - |
+-------+--------------+-------------+--------------+


2. Memory
---------

+----------------+------+-------+------------+-----------+-------+
|    Site Type   | Used | Fixed | Prohibited | Available | Util% |
+----------------+------+-------+------------+-----------+-------+
| Block RAM Tile |    0 |     0 |          0 |       135 |  0.00 |
|   RAMB36/FIFO* |    0 |     0 |          0 |       135 |  0.00 |
|   RAMB18       |    0 |     0 |          0 |       270 |  0.00 |
+----------------+------+-------+------------+-----------+-------+
* Note: Each Block RAM Tile only has one FIFO logic available and therefore can accommodate only one FIFO36E1 or one FIFO18E1. However, if a FIFO18E1 occupies a Block RAM Tile, that tile can still accommodate a RAMB18E1


3. DSP
------

+-----------+------+-------+------------+-----------+-------+
| Site Type | Used | Fixed | Prohibited | Available | Util% |
+-----------+------+-------+------------+-----------+-------+
| DSPs      |    0 |     0 |          0 |       240 |  0.00 |
+-----------+------+-------+------------+-----------+-------+


4. IO and GT Specific
---------------------

+-----------------------------+------+-------+------------+-----------+-------+
|          Site Type          | Used | Fixed | Prohibited | Available | Util% |
+-----------------------------+------+-------+------------+-----------+-------+
| Bonded IOB                  |   20 |     0 |          0 |       300 |  6.67 |
| Bonded IPADs                |    0 |     0 |          0 |        26 |  0.00 |
| Bonded OPADs                |    0 |     0 |          0 |        16 |  0.00 |
| PHY_CONTROL                 |    0 |     0 |          0 |         6 |  0.00 |
| PHASER_REF                  |    0 |     0 |          0 |         6 |  0.00 |
| OUT_FIFO                    |    0 |     0 |          0 |        24 |  0.00 |
| IN_FIFO                     |    0 |     0 |          0 |        24 |  0.00 |
| IDELAYCTRL                  |    0 |     0 |          0 |         6 |  0.00 |
| IBUFDS                      |    0 |     0 |          0 |       288 |  0.00 |
| GTXE2_COMMON                |    0 |     0 |          0 |         2 |  0.00 |
| GTXE2_CHANNEL               |    0 |     0 |          0 |         8 |  0.00 |
| PHASER_OUT/PHASER_OUT_PHY   |    0 |     0 |          0 |        24 |  0.00 |
| PHASER_IN/PHASER_IN_PHY     |    0 |     0 |          0 |        24 |  0.00 |
| IDELAYE2/IDELAYE2_FINEDELAY |    0 |     0 |          0 |       300 |  0.00 |
| ODELAYE2/ODELAYE2_FINEDELAY |    0 |     0 |          0 |       100 |  0.00 |
| IBUFDS_GTE2                 |    0 |     0 |          0 |         4 |  0.00 |
| ILOGIC                      |    0 |     0 |          0 |       300 |  0.00 |
| OLOGIC                      |    0 |     0 |          0 |       300 |  0.00 |
+-----------------------------+------+-------+------------+-----------+-------+


5. Clocking
-----------

+------------+------+-------+------------+-----------+-------+
|  Site Type | Used | Fixed | Prohibited | Available | Util% |
+------------+------+-------+------------+-----------+-------+
| BUFGCTRL   |    1 |     0 |          0 |        32 |  3.13 |
| BUFIO      |    0 |     0 |          0 |        24 |  0.00 |
| MMCME2_ADV |    0 |     0 |          0 |         6 |  0.00 |
| PLLE2_ADV  |    0 |     0 |          0 |         6 |  0.00 |
| BUFMRCE    |    0 |     0 |          0 |        12 |  0.00 |
| BUFHCE     |    0 |     0 |          0 |        96 |  0.00 |
| BUFR       |    0 |     0 |          0 |        24 |  0.00 |
+------------+------+-------+------------+-----------+-------+


6. Specific Feature
-------------------

+-------------+------+-------+------------+-----------+-------+
|  Site Type  | Used | Fixed | Prohibited | Available | Util% |
+-------------+------+-------+------------+-----------+-------+
| BSCANE2     |    0 |     0 |          0 |         4 |  0.00 |
| CAPTUREE2   |    0 |     0 |          0 |         1 |  0.00 |
| DNA_PORT    |    0 |     0 |          0 |         1 |  0.00 |
| EFUSE_USR   |    0 |     0 |          0 |         1 |  0.00 |
| FRAME_ECCE2 |    0 |     0 |          0 |         1 |  0.00 |
| ICAPE2      |    0 |     0 |          0 |         2 |  0.00 |
| PCIE_2_1    |    0 |     0 |          0 |         1 |  0.00 |
| STARTUPE2   |    0 |     0 |          0 |         1 |  0.00 |
| XADC        |    0 |     0 |          0 |         1 |  0.00 |
+-------------+------+-------+------------+-----------+-------+


7. Primitives
-------------

+----------+------+---------------------+
| Ref Name | Used | Functional Category |
+----------+------+---------------------+
| FDRE     |   96 |        Flop & Latch |
| LUT6     |   26 |                 LUT |
| OBUF     |   10 |                  IO |
| IBUF     |   10 |                  IO |
| MUXF7    |    8 |               MuxFx |
| LUT3     |    4 |                 LUT |
| LUT4     |    2 |                 LUT |
| LUT2     |    2 |                 LUT |
| LUT5     |    1 |                 LUT |
| LUT1     |    1 |                 LUT |
| BUFG     |    1 |               Clock |
+----------+------+---------------------+


8. Black Boxes
--------------

+----------+------+
| Ref Name | Used |
+----------+------+


9. Instantiated Netlists
------------------------

+----------+------+
| Ref Name | Used |
+----------+------+


