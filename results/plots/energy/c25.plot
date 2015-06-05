set terminal png enhanced

set ylabel "Energy (mJ)"
set xlabel "Optimization Level"
set xrange [-1:5]
set yrange [450:600]
set xtics ('O0+debug' 0, 'O1' 1, 'O2' 2, 'O3' 3, 'Os' 4)

plot 'c25.dat' using 2 title "C" with linespoints, \
     'r25.dat' using 2 title "Rust" with linespoints