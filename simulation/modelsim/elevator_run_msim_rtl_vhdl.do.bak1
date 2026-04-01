transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/tuvab/OneDrive/Dokument/VHDL/labs/lab5/SevenSegmentDecoding.vhd}
vcom -93 -work work {C:/Users/tuvab/OneDrive/Dokument/VHDL/elevator-fpga/elevator.vhd}

vcom -93 -work work {C:/Users/tuvab/OneDrive/Dokument/VHDL/elevator-fpga/simulation/modelsim/elevator.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  elevator_vhd_tst

add wave *
view structure
view signals
run -all
