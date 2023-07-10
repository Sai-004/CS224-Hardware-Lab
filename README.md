# CS224 Hardware Lab

This repository contains walkthrough of the assignments and projects for the CS224 Hardware Lab course at the Indian Institute of Technology (IIT) Guwahati, Assam, India. The lab focuses on hardware-related concepts in computer science and provides a hands-on experience with various hardware design and implementation tasks. Each assignment is designed to challenge students and enhance their understanding of hardware systems.

## Course Details

- Course Code: **CS224**
- Course Name: **Hardware Lab**
- Institution: **Indian Institute of Technology (IIT) Guwahati**
- Year: **2023**

## Assignments

### Lab 1: 4-Bit Full Adder

- Design and implement a 4-bit full adder using a Hardware Description Language (HDL) such as VHDL or Verilog. The design should be synthesized and simulated using the selected HDL. Finally, download the bit file to the FPGA board and demonstrate the working of the design on the FPGA.

### Lab 2: Digital Clock

- Design and implement a digital clock using HDL (VHDL or Verilog). The clock should display time in HH:MM:SS format using a 7-segment display on the FPGA board. The design should support features like resetting the time and adjusting the time using selectable switches.

### Lab 3: Register Instruction Processor

- Design and implement an RTL processor operations demonstrator. The instruction size is 6 bits, with a 3-bit operations field and 3 bits for register selection. The design should include a register file (RF) with eight 8-bit registers and an accumulator (ACC) register (8-bit). The processor should support operations such as addition, subtraction, move, scan, and print.

### Lab 4: Vector Dot Product

**Part I: Design of Vector Dot Product Unit (VDPU)**
- Design and implement a Vector Dot Product Unit (VDPU) using HDL and demonstrate it using simulation. The VDPU should compute the dot product of two 16-element vectors. The design should support different modes, including data-ready mode, partial-ready mode, and data-transfer mode.

**Part II: Interface the VDPU with PC Serial Port**
- Interface the VDPU with the PC serial port and demonstrate the working of the VDPU using PC communication. Implement UART transmitter and receiver codes for the FPGA board to connect with the PC.

### Lab 5: Cache Implementation

**Part I: Design of Cache**
- Design and implement a cache using HDL and demonstrate it using simulation. The cache should have 256 sets, be 4-way set-associative, and have a line/block size of 64 bytes. The design should support tag comparison, LRU replacement policy, and handling cache misses using a Miss Status Holding Register (MSHR).

**Part II: Interface the Cache with PC Serial Port**
- Interface the cache with the PC serial port and demonstrate the working of the cache using PC communication. Generate trace files from a C++ code and use them to validate the design through simulation.

### Lab 6: DRAM Implementation

**Part I: Design of DRAM Memory**
- Design and implement a DRAM memory using HDL and demonstrate it using simulation. The DRAM should have 2 channels, 8 ranks per channel, 16 banks per rank, and each bank should have 256 rows and 1024 columns. The design should support page mode access, refresh operations, and status registers.

**Part II: Download the Design and Test on the FPGA Boards**
- Download the design and test it on the FPGA boards. Instantiate the testbench and read traces from memory, send them to the DRAM module, and display the number of page hits on the 7-segment display of the FPGA board.

## Setup

To work on the assignments, you will need to set up the Vivado Design Suite for coding in Verilog and VHDL. Follow the instructions below:

### Vivado Setup

1. Download Vivado Design Suite from the Xilinx website:
   - Exe File for Windows: [Vivado ML Edition](https://www.xilinx.com/member/forms/download/xef.html?filename=Xilinx_Unified_2023.1_0507_1903_Win64.exe)
   - For other download formats: [Xilinx Downloads](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)

2. Install Vivado Design Suite following the provided instructions.

### FPGA Board Documentation

The lab assignments use the Nexys A7 FPGA board. Refer to the documentation and reference manual for the Nexys A7 board to understand its features and usage:

- Documentation: [Nexys A7 Documentation](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/start)
- Reference Manual: [Nexys A7 Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/refmanual)

### 7-Segment Display

The lab assignments may involve working with the 7-segment display on the Nexys A7 board. Learn about the working principle and code examples for the 7-segment display:

- 7-Segment Display Working: [Nexys manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/refmanual#seven_segment_display)
- 7-Segment Display Code Examples: [Digilent tutorials](https://reference.digilentinc.com/learn/resources/tutorials/nexys-a7/7-segment-display)

## Contributing

This repository is for reference purposes for the CS224 Hardware Lab course at IIT Guwahati. Contributions are not expected as the assignments are meant for specific student groups. However, if you have suggestions or improvements for the existing content, feel free to open an issue or submit a pull request.

Please adhere to the academic integrity policies of your institution and refrain from submitting solutions to the assignments or projects in this repository as your own work.
