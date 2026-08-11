# FPGA Game of Life

A hardware-level implementation of Conway's Game of Life running on an Artix-7 FPGA. This project calculates the cellular automata rules in real-time and renders the output to an SSD1331 OLED screen using a custom-built SPI driver.

## How It Works

Instead of running on a standard CPU, the simulation is built directly into the silicon using Verilog:
* **Compute Engine:** A state machine calculates the rules for cell survival, birth, and death for a 96x64 grid.
* **Render Engine:** An independent pipeline continuously updates the OLED display without interrupting the game logic.
* **Framebuffer:** The system uses a ping-pong memory buffer (Block RAM). The compute engine calculates the next frame on a hidden layer while the render engine draws the current frame, preventing any screen flickering or tearing.

## Demonstrations

* **Still Life:** mathematically provable permanence, no logic needed to sustain it
<img width="1591" height="1451" alt="IMG_1202" src="https://github.com/user-attachments/assets/a27471f7-156f-483a-a106-aab2d4b88987" />

* **Oscillator:** tests correct handling of periodic, synchronized state changes
<img width="400" height="419" alt="IMG_1204" src="https://github.com/user-attachments/assets/d3a7f46f-a792-4aca-a984-e5a452e74f0b" />

* **Spaceship (Glider):** validates the compute engine correctly propagates motion across cell boundaries
<img width="400" height="312" alt="IMG_1207" src="https://github.com/user-attachments/assets/f9fc1f77-e218-4003-83b4-249b60880ce6" />

* **Methuselah (Acorn):** stress-tests the compute engine with rapidly growing, unpredictable neighbor counts
<img width="400" height="301" alt="IMG_1208" src="https://github.com/user-attachments/assets/985d8873-80fd-4688-86fd-4755abb6e002" />

* **Glider Gun:** demonstrates the engine sustaining indefinite, non-decaying activity
<img width="400" height="344" alt="IMG_1209 (1)" src="https://github.com/user-attachments/assets/fca5f7a7-7677-46de-b934-8fb9d4e47e38" />

## Tech Stack
* **Hardware:** Xilinx Artix-7 FPGA, Pmod SSD1331 OLED
* **Language:** Verilog
* **Tools:** Vivado (Synthesis, Implementation, Waveform Simulation)

## Project Structure
* `/OLED_RGB.srcs/` - Contains all Verilog source code for the engines and SPI controller.
* `/GOL_Coefficient/` - The `.coe` memory files used to load the starting patterns into the FPGA.
* `/sim/` - Testbenches for hardware timing verification.
