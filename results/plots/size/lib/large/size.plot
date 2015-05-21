set terminal png enhanced

set xtics ('core' 0, 'collection' 1, 'unicode' 2)

set xtics rotate by -45
set style data histogram
set style histogram rowstacked
box_wd = 0.1
set boxwidth box_wd
set style fill solid
unset key

text = "#FF0000"
data = "#00FF00"
bss  = "#0000FF"

plot '1rust-O0g.dat' using 2 title "text" lt rgb text, "" using 3 lt rgb data, "" using 3 lt rgb bss, newhistogram at (box_wd+0.05), \
      '1rust-O0.dat' using 2 lt rgb text , "" using 3 lt rgb data, "" using 3 lt rgb bss, newhistogram at (box_wd+0.05)*2, \
      '1rust-O1.dat' using 2 lt rgb text , "" using 3 lt rgb data, "" using 3 lt rgb bss, newhistogram at (box_wd+0.05)*3, \
	  '1rust-O2.dat' using 2 lt rgb text , "" using 3 lt rgb data, "" using 3 lt rgb bss, newhistogram at (box_wd+0.05)*4, \
	  '1rust-O3.dat' using 2 lt rgb text , "" using 3 lt rgb data, "" using 3 lt rgb bss
