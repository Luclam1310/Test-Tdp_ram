read_verilog "tdp_ram.v"
synth_design -top "tdp_ram" -part "xc7a35tcpg236-1"
write_verilog -mode funcsim tdp_ram_netlist.v