set terminal png enhanced

set ylabel "Energy (mJ)"
set xlabel "Optimization Level"
set xrange [-1:5]
set yrange [25:35]
set xtics ('O0+debug' 0, 'O1' 1, 'O2' 2, 'O3' 3, 'Os' 4)

set key font ",15"
set tics font ",15"
set xlabel font ",15"
set ylabel font ",15"

plot 'c500.dat' using 2 title "C" with linespoints, \
     'r500.dat' using 2 title "Rust" with linespoints