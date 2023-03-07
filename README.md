# SLF
It's a set of logical functions and elements (SLF)

## Introduction

Here is a small library of primitives, sometimes used in the work of an RTL designer. 
It is divided into sections, according to their purpose or functionality.

## Software Requirements

* Python 3.6+
* Icarus Verilog + GTKwave

## Structure of project

/Arithmetic Circuits:
* 100b_binary_adder.sv
* Full_adder.sv
* Half_adder.sv
* Sign_AdderwOF.sv
* Unsig_altmult_accum.sv

/Flip-flops:
* DFF.sv
* DFFs.sv
* DFFwASR.sv
* DFFwSR.sv
* DLatch.sv

/Generators
* freq_conv.sv

/Memory
* dual_port_ram.sv
* regfile.sv
* rom.sv
* single_port_ram.sv
* sync_fifo.sv
* true_dpramwsclk.sv

/Multiplexers:
* mux_2to1.sv
* mux_9to1.sv
* mux_256to1.sv

/Synchronizers:
/rtl:
* debouncer.sv
* enable_sync.sv
* reset_sync.sv
/tb:
* tb_debouncer.sv
* tb_enable_sync.sv
* tb_reset_sync.sv
