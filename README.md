# FPGA Digital Signal Processor

A SystemVerilog learning project for streaming DSP on FPGA. This repository starts with a parameterized signed moving-average filter and a basic testbench, with a roadmap toward FIR filters and AXI-Stream integration.

## Contents
- `rtl/moving_average.sv`: running-sum moving-average RTL.
- `tb/tb_moving_average.sv`: basic stimulus testbench.
- `docs/fixed-point.md`: sizing and verification checklist.

## Simulation
Open the RTL and testbench in Vivado Simulator or QuestaSim. Add the exact compile/run commands for your installed simulator and commit actual logs/waveforms.

## Verification plan
Test impulse, step, positive/negative, alternating, and maximum-magnitude inputs. Compare against a bit-accurate software model. Record synthesis part, clock constraint, LUT/FF/DSP counts, and timing from actual reports.

## Limitations
This is a starter block, not a complete DSP processor. Confirm accumulator width, reset/valid behavior, and fixed-point rounding for your application before use.