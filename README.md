# FPGA Game of Life

A hardware-level implementation of Conway's Game of Life running on an Artix-7 FPGA. This project calculates the cellular automata rules in real-time and renders the output to an SSD1331 OLED screen using a custom-built SPI driver.

## How It Works

Instead of running on a standard CPU, the simulation is built directly into the silicon using Verilog:
* **Compute Engine:** A state machine calculates the rules for cell survival, birth, and death for a 96x64 grid.
* **Render Engine:** An independent pipeline continuously updates the OLED display without interrupting the game logic.
* **Framebuffer:** The system uses a ping-pong memory buffer (Block RAM). The compute engine calculates the next frame on a hidden layer while the render engine draws the current frame, preventing any screen flickering or tearing.

## Demonstrations

* **Still Life:** mathematically provable permanence, no logic needed to sustain it
* **Oscillator:** tests correct handling of periodic, synchronized state changes
* **Spaceship (Glider):** validates the compute engine correctly propagates motion across cell boundaries
* **Methuselah (Acorn):** stress-tests the compute engine with rapidly growing, unpredictable neighbor counts
* **Glider Gun:** demonstrates the engine sustaining indefinite, non-decaying activity

## Tech Stack
* **Hardware:** Xilinx Artix-7 FPGA, Pmod SSD1331 OLED
* **Language:** Verilog
* **Tools:** Vivado (Synthesis, Implementation, Waveform Simulation)

## Project Structure
* `/OLED_RGB.srcs/` - Contains all Verilog source code for the engines and SPI controller.
* `/GOL_Coefficient/` - The `.coe` memory files used to load the starting patterns into the FPGA.
* `/sim/` - Testbenches for hardware timing verification.
