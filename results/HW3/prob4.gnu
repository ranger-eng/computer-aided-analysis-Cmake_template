set term pngcairo
set output 'HW3_prob4.png'
set xlabel "Year"
set ylabel "Population"
set title "HW3 problem4 - fitting data to quadratic using SVD least squares method."

plot "./HW3_prob4.data" using 1:2 with line title "actual population", "./HW3_prob4.data" using 1:3 with point title "svd least squares fit", "./HW3_prob4.data" using 1:4 with point title "svd least squares fit - drop the smallest singular value"
set output
