LTX ?= $(shell which pdflatex)
BTX ?= $(shell which bibtex)
GLS ?= $(shell which makeglossaries)
OPEN ?= $(shell which open)
PLATFORM ?= $(shell uname)

ifeq ($(PLATFORM),Linux)
include Makefile.linux
endif

OUTDIR=.
LTX_FLAGS=-shell-escape -output-directory $(OUTDIR)

REPORT=main.tex

report: setup
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(GLS) $(OUTDIR)/$(REPORT:.tex=)
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(BTX) $(OUTDIR)/$(REPORT:.tex=.aux)
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(GLS) $(OUTDIR)/$(REPORT:.tex=)
	$(LTX) $(LTX_FLAGS) $(REPORT)

quick:
	$(LTX) $(LTX_FLAGS) $(REPORT)

show: report
	$(OPEN) $(OUTDIR)/$(REPORT:.tex=.pdf)

showquick: quick
	$(OPEN) $(OUTDIR)/$(REPORT:.tex=.pdf)

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
