set term pngcairo
set output 'HW3_prob2.png'
set xlabel "time [s]"
set ylabel "value [unit, unit/s, unit/s/s]"
set title "HW3 problem2 - System response to impluse at t=0"

plot "./HW3_prob2.data" using 1:2 with point title "x", "./HW3_prob2.data" using 1:3 with line title "x dot", "./HW3_prob2.data" using 1:4 with line title "x ddot"
set output
