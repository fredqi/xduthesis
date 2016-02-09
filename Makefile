NAME  = xduthesis
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -u -d -t xduthesis.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
all:	$(NAME).pdf clean
	$(MAKE) -C examples all
$(NAME).pdf: $(NAME).dtx
	xelatex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	if [ -f $(NAME).glo ]; then makeindex -q -s gglo.ist -o $(NAME).gls $(NAME).glo; fi
	if [ -f $(NAME).idx ]; then makeindex -q -s gind.ist -o $(NAME).ind $(NAME).idx; fi
	xelatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	xelatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
clean:
	$(RM) $(NAME).{aux,fls,glo,gls,hd,idx,ilg,ind,ins,log,out,toc}
	$(MAKE) -C examples clean
distclean: clean
	$(RM) $(NAME).{pdf,cls,cfg}
	$(MAKE) -C examples distclean
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/xelatex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/xelatex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/xelatex/$(NAME)
	cp $(NAME).cfg $(UTREE)/tex/xelatex/$(NAME)
	cp xdu{badge,badge-gr,logo}.eps $(UTREE)/tex/xelatex/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/xelatex/$(NAME)
	cp examples/thesis-doctor.pdf $(UTREE)/doc/xelatex/$(NAME)
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/xelatex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/xelatex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/xelatex/$(NAME)
	sudo cp $(NAME).cfg $(LOCAL)/tex/xelatex/$(NAME)
	sudo cp xdu{badge,badge-gr,logo}.eps $(LOCAL)/tex/xelatex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/xelatex/$(NAME)
	sudo cp examples/thesis-doctor.pdf $(LOCAL)/doc/xelatex/$(NAME)
zip: all
	mkdir -p $(TEMP)/{tex,source,doc}/xelatex/$(NAME)
	cp $(NAME).dtx $(TEMP)/source/xelatex/$(NAME)
	cp $(NAME).cls $(TEMP)/tex/xelatex/$(NAME)
	cp $(NAME).cfg $(TEMP)/tex/xelatex/$(NAME)
	cp xdu{badge,badge-gr,logo}.eps $(TEMP)/tex/xelatex/$(NAME)
	cp $(NAME).pdf $(TEMP)/doc/xelatex/$(NAME)
	cp examples/thesis-doctor.pdf $(TEMP)/doc/xelatex/$(NAME)
	mkdir $(TEMP)/doc/xelatex/$(NAME)/examples
	cp examples/*.tex $(TEMP)/doc/xelatex/$(NAME)/examples
	cp examples/refs.bib $(TEMP)/doc/xelatex/$(NAME)/examples
	cp examples/photo.png $(TEMP)/doc/xelatex/$(NAME)/examples
	cd $(TEMP); zip -Drq $(TEMP)/$(NAME).tds.zip tex source doc
	mkdir -p $(TDIR)/examples
	cp $(NAME).{pdf,dtx} README.rst $(TDIR)
	cp xdu{badge,badge-gr,logo}.eps $(TDIR)
	cp examples/thesis-doctor.pdf $(TDIR)
	cp examples/*.tex $(TDIR)/examples
	cp examples/refs.bib $(TDIR)/examples
	cp examples/photo.png $(TDIR)/examples
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME) $(NAME).tds.zip
	$(RM) -r $(TEMP)
