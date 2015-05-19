LTX ?= $(shell which pdflatex)
BTX ?= $(shell which bibtex)
GLS ?= $(shell which makeglossaries)
OPEN ?= $(shell which open)
PLATFORM ?= $(shell uname)

ifeq ($(PLATFORM),Linux)
override OPEN=$(shell which gnome-open)
endif

IF=background/objectoriented

LTX_FLAGS=-shell-escape -pdf

REPORT=main.tex

report:
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(GLS) $(REPORT:.tex=)
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(BTX) $(REPORT:.tex=.aux)
	$(LTX) $(LTX_FLAGS) $(REPORT)
	$(GLS) $(REPORT:.tex=)
	$(LTX) $(LTX_FLAGS) $(REPORT)

quick:
	$(LTX) $(LTX_FLAGS) $(REPORT)

show: report
	$(OPEN) $(REPORT:.tex=.pdf)

showquick: quick
	$(OPEN) $(REPORT:.tex=.pdf)

mk:
	@latexmk -pdf -shell-escape main.tex

glsmk:
	@latexmk -pdf -shell-escape main.tex
	$(GLS) $(REPORT:.tex=)
	@latexmk -pdf -shell-escape main.tex

ls:
	@tree -P "*.tex|*.bib"

standalone:
	sed 's,INCLUDE,${IF},g' standalone.tex >.standalone.tex
	$(LTX) $(LTX_FLAGS) .standalone.tex
	$(OPEN) .standalone.pdf

clean:
	@rm -rf *.aux
	@rm -rf *.bbl
	@rm -rf *.blg
	@rm -rf *.lof
	@rm -rf *.log
	@rm -rf *.lot
	@rm -rf *.pdf
	@rm -rf *.toc
