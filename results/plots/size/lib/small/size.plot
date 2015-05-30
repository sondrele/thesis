set terminal png enhanced

set ylabel "Size (bytes)"
set xtics ('alloc' 0, 'cmsis' 1, 'libc' 2, 'rlibc' 3, 'startup' 4)

set xtics rotate by -45
set style data histogram
set style histogram rowstacked
box_wd = 0.1
set boxwidth box_wd
set style fill solid

O0g = "#FF0000"
O0  = "#00FF00"
O1  = "#0000FF"
O2  = "#000000"
O3  = "#F0F0F0"

plot '0rust-O0g.dat' using 2 title "O0+debug" lt rgb O0g, newhistogram at (box_wd+0.05), \
      '0rust-O0.dat' using 2 title "O0" lt rgb O0, newhistogram at (box_wd+0.05)*2, \
      '0rust-O1.dat' using 2 title "O1" lt rgb O1, newhistogram at (box_wd+0.05)*3, \
	  '0rust-O2.dat' using 2 title "O2" lt rgb O2, newhistogram at (box_wd+0.05)*4, \
	  '0rust-O3.dat' using 2 title "O3" lt rgb O3
