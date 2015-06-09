set terminal png enhanced

set xtics ('C' 0.35, 'C++' 1.35, 'Java' 2.35, 'C#' 3.35, 'Assembly' 4.35, 'Python' 5.35)
set xrange [0:6]
set style data histogram
set style fill solid
set boxwidth 0.95

set xlabel "Langauges"
set ylabel "Used in current project (%)"

plot 'langs.dat' using 1 title "2008", newhistogram at(0.35), "" using 2 title "2013"