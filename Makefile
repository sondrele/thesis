LTX ?= pdflatex
BTX ?= bibtex

OUTDIR=.
LTX_FLAGS=-output-directory $(OUTDIR)

REPORT=main.tex

report: setup
	makeglossaries main
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(BTX) $(OUTDIR)/$(REPORT:.tex=.aux)
	$(LTX) $(LTX_FLAGS) $(REPORT)
	makeglossaries main
	$(LTX) $(LTX_FLAGS) $(REPORT)

quick:
	$(LTX) $(LTX_FLAGS) $(REPORT)

show: report
	gnome-open $(OUTDIR)/$(REPORT:.tex=.pdf)

showquick: quick
	gnome-open $(OUTDIR)/$(REPORT:.tex=.pdf)

setup:
	@if [ ! -d $(OUTDIR) ]; then mkdir $(OUTDIR); fi

clean:
	@rm -rf *.aux
	@rm -rf *.bbl
	@rm -rf *.blg
	@rm -rf *.lof
	@rm -rf *.log
	@rm -rf *.lot
	@rm -rf *.pdf
	@rm -rf *.toc
