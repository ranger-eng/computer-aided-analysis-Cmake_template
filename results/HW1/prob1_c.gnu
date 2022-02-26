set term dumb

set logscale y 10
set yrange [0.01:2000]

plot "./prob1_c.data" using 1:2 with point title "Prob1 - C - Histogram"
plot "./prob1_c.data" using 1:3 with point title "Prob1 - C - Mass"
plot "./prob1_c.data" using 1:4 with point title "Prob1 - C - PDF"
