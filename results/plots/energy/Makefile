all: 25.png 50.png 100.png 500.png 1000.png best.png

%.png: %.plot
	gnuplot $< > $@
