coverage save -onexit -assert -directive -cvg -codeAll tdpram_cov;

vcover report -html spi_test.ucdb -htmldir covhtmlreport
vcover report -file cov_report.txt tdpram_test.ucdb

add wave -r /*;
run -all