
# 🚗 Smart Parking Lot – Verilog FSM Simulation

This project simulates a smart parking lot system using Verilog, designed to manage car entries and exits with real-time feedback through LED indicators. It models a finite state machine (FSM) that tracks the number of cars in the lot (0-7) and prevents overfilling or underflow.

## 🔧 Features

- **FSM-based control logic**  It has 3 states `IDLE`, `CAR_IN`, and `CAR_OUT`.
- **4-bit car counter** to track occupancy (0 to 8)
- **LED indicators**:
  - `full_led`: ON when the lot is full
  - `available_led`: ON when slots are available
- **Button inputs** for car entry and exit
- **Reset functionality** to initialize the system

## 🧪 Testbench Highlights

The testbench simulates various scenarios:
- System reset
- Sequential car entries and exits
- Boundary conditions (full lot, empty lot)
- Attempted overfill (ignored when full)
- File logging of simulation results (`output.txt`) 

### Sample Output


In the file [output]()

### Simulation Link

[Parking Lot]()


## 🛠️ Tools Used

- **Language**: Verilog
- **Simulator**: [EDA Playground](https://www.edaplayground.com/)
- **Waveform Viewer**: EPWave (`dump.vcd`)
- **File Output**: `output.txt` (generated using `$fopen` and `$fdisplay`)


## 🚀 How to Run

1. Open [EDA Playground](https://www.edaplayground.com/)
2. Paste the design code in the left pane and testbench in the right pane
3. Select **Aldec Riviera-PRO** or **Icarus Verilog** as the simulator
4. Enable **EPWave** for waveform viewing
5. Choose `output.txt` from the file dropdown after simulation
6. Click **Run**

## 📌 Applications

This project demonstrates:
- FSM design in Verilog
- Real-time system simulation


## Author 

Manvitha Bheemavarapu 
[Github Profile](https://github.com/Manvi1670)
