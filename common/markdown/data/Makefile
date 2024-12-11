SUBDIR = data
OUT_BASE = ../..
REVEALJS = $(OUT_BASE)/../reveal4.js
RES_PATH = .:$(HOME)/ArkThis/Presentations/
THEME = avrd

# DeckTape (for rendering PDF print versions):
DT_VIEWPORT = -s 2048x1536
DT := decktape -p 0 $(DT_VIEWPORT)

# Use this for common assets:
ASSETS = $(OUT_BASE)/assets
# Use this for standalone assets:
#ASSETS = $(OUT_HTML)/assets

PD := pandoc
PD_DATA := /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs
PD_TYPE := -t revealjs

# Uncomment this to create a real standalone HTML copy with embedded images:
#EMBED := 1
# Uncomment this to copy media assets in a subfolder relative to the output HTML:
EXTRACT := 1

ifdef EMBED
	PD_EMBED := --embed-resources
endif

ifdef EXTRACT
	PD_EXTRACT = --extract-media=$(ASSETS)
endif

#PD_OPTS1 := --email-obfuscation=javascript
#PD_REBASE := -f markdown+rebase_relative_paths
PD_OPTIONS = $(PD_TYPE) --standalone $(PD_OPTS1) $(PD_EMBED) $(PD_EXTRACT) --resource-path=$(RES_PATH) -V revealjs-url=$(REVEALJS) $(PD_TEMPLATE)


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
	$(PD) $(PD_OPTIONS) -V theme=$(THEME) -o $(OUT_HTML)/$@ $<
	$(PD) $(PD_OPTIONS) -V theme=$(THEME)-print -V showNotes=true -o $(OUT_PRINT)/$@ $<

%.pdf: $(OUT_PRINT)/%.html
	mkdir -p $(OUT_PDF)
	$(DT) $(OUT_HTML)/$< $(OUT_PDF)/$@
#	$(PD) -s -f markdown+smart -o $(OUT_PDF)$@ $<


clean:
	rm -f $(OUT_HTML)/*.html
	rm -f $(OUT_PRINT)/*.html
	rm -f $(OUT_PDF)/*.pdf
