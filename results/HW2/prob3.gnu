set term pngcairo
set output 'HW2_prob3.png'
set xlabel "Year/100"
set ylabel "Population/100,000"

plot "./HW2_prob3.data" using 1:2 with point title "Actual Population", "./HW2_prob3.data" using 1:3 with line title "Predicted Population = -56073 + 4069*y - 57*y^2"
set output
