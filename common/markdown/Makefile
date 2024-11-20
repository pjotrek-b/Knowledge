PD = pandoc
PD_DATA = /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs

DT = decktape -s 2048x1536

SUBDIR = 
OUT_BASE = ..
REVEALJS = $(OUT_BASE)/../../reveal4.js
THEME = avrd

SRC = $(wildcard *.md)
HTML = $(SRC:.md=.html)
PDF = $(SRC:.md=.pdf)
OUT_HTML = $(OUT_BASE)/html/$(SUBDIR)
OUT_PDF = $(OUT_BASE)/pdf/$(SUBDIR)

# To export PDFs with speaker notes embedded, open the HTMLs in this folder,
# and add the following parameters after ".html" in the browser navigation
# field:
# ?print-pdf&showNotes=separate-page
OUT_PRINT = $(OUT_BASE)/print/$(SUBDIR)


all: $(HTML)

html: $(HTML)

pdf: $(PDF)

%.html: %.md
	mkdir -p $(OUT_HTML)
	mkdir -p $(OUT_PRINT)
	$(PD) -s -t revealjs -V revealjs-url=$(REVEALJS) $(PD_TEMPLATE) -V theme=$(THEME) -o $(OUT_HTML)/$@ $<
	$(PD) -s -t revealjs -V revealjs-url=$(REVEALJS) $(PD_TEMPLATE) -V theme=$(THEME)-print -V showNotes=true -o $(OUT_PRINT)/$@ $<

%.pdf: $(OUT_PRINT)/%.html
	mkdir -p $(OUT_PDF)
	$(DT) $(OUT_HTML)/$< $(OUT_PDF)/$@
#	$(PD) -s -f markdown+smart -o $(OUT_PDF)$@ $<


clean:
	rm -f $(OUT_HTML)/*.html
	rm -f $(OUT_PRINT)/*.html
	rm -f $(OUT_PDF)/*.pdf
