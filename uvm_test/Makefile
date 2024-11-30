compile:
	vlib work
	vmap work work
	vlog -f tb.f
simulate:
	vsim -c top_optimized -coverage +UVM_TESTNAME=tdpram_test -do sim.do