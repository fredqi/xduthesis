MODES	= bachelor master masterpro doctor
TEXFNS := $(wildcard [ac]*.tex)
EGFNS	= $(addsuffix .pdf, $(addprefix thesis-, $(MODES)))
BIBTEX	= bibtex
LATEX	= xelatex
CLEANEXT= aux bbl bcf blg fls lof log lot out run.xml toc
all:	$(EGFNS)
$(EGFNS):	%.pdf:	%.tex refs.bib $(TEXFNS)
	$(LATEX) -shell-escape -recorder -interaction=batchmode $< >/dev/null
	$(BIBTEX) $(basename $@).aux >/dev/null
	$(LATEX) --recorder --interaction=nonstopmode $< > /dev/null
	$(LATEX) --recorder --interaction=nonstopmode $< > /dev/null
.PHONY:	clean distclean
clean:
	for ext in $(CLEANEXT); do \
	for mode in $(MODES); do $(RM) thesis-$$mode.$$ext; done; done
distclean:	clean
	for fn in $(EGFNS); do $(RM) $$fn; done
