set terminal png enhanced

set ylabel "Energy (mJ)"
set xlabel "Interrupt Interval (ms)"
set xrange [-1:5]
set yrange [0.95:1.25]
set xtics ('25ms' 0, '50ms' 1, '100ms' 2, '500ms' 3, '1000ms' 4)

set key font ",15"
set tics font ",15"
set xlabel font ",15"
set ylabel font ",15"

plot 'cbest.dat' using 2 title "C Os" with linespoints, \
     'rbest.dat' using 2 title "Rust Best" with linespoints, \
     'cworst.dat' using 2 title "C O3" with linespoints