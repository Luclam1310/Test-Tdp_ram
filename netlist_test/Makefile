compile:
	vlib work
	vmap work work
	vlog -f tb.f
simulate:
	vsim -c -L unisims_ver work.tb_top glbl +UVM_TESTNAME=tdpram_test -do sim.do