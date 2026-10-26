# Fixed-point and verification notes

- Define input signedness and Q format before selecting coefficients.
- Size accumulators for worst-case sum, not typical values.
- Verify positive, negative, alternating, impulse, step, and maximum-magnitude inputs.
- Compare RTL output with a bit-accurate software model.
- Add assertions for valid timing, reset behavior, and output-valid pulses.
- Record target FPGA, clock constraint, LUT/FF/DSP counts, and worst slack from actual synthesis reports.