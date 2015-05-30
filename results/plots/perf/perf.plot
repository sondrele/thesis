set terminal png enhanced

set xlabel "Optimization Levels"
set ylabel "Frames Per Second"

set xrange [0:6]
set xtics ('-O0' 0.75, '-O1' 1.75, '-O2' 2.75, '-O3' 3.75, '-Os' 4.75)

set boxwidth 0.3
set style fill solid

plot 'rust.dat' every 1   using ($1-0.4):($2) title "Rust" with boxes ls 1, \
		  'c.dat'   every 1   using ($1-0.1):($2) title "C" with boxes ls 2
