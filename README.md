# SRAM Controller in Verilog (RTL Design + Testbench)

A simple FSM-based SRAM Controller designed in Verilog with a clear and effective testbench. Demonstrates synchronized read/write memory operations, state transitions, tri-state data bus behavior, and ready signal generation along with power, schematic, implementation diagrams, and simulation waveform results for quick understanding of RTL memory controller design.

## 📁 Files Included

| File | Description |
|------|-------------|
| sram_controller.v | RTL design of the SRAM Controller |
| sram_controller_tb.v | Basic testbench for read/write verification |
| power.png | Power overview of the SRAM controller |
| schematic.png | RTL/netlist schematic representation |
| implementation.png | Block-level implementation structure |
| waveform.png | Simulation waveform output |


# RTL Design

A compact FSM-based SRAM controller built using synthesizable Verilog HDL. Designed with clean synchronous logic, efficient state transitions, and controlled memory access behavior for reliable read and write operations.

View the full file: `sram_controller.v`

# Testbench

A lightweight Verilog testbench created to verify reset, read, and write functionality through meaningful stimulus generation and waveform observation.

View the full file: `sram_controller_tb.v`

# Conclusion

This project demonstrates a clean and synthesizable SRAM controller RTL design verified using simulation waveforms and functional testing. The design showcases reliable memory control behavior and serves as a strong foundation for larger memory interface systems and FPGA-based digital designs.
