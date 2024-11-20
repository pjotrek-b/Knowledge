PD = pandoc
PD_DATA = /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs

DT = decktape -s 2048x1536

SUBDIR = storage
OUT_BASE = ../..
REVEALJS = $(OUT_BASE)/../reveal.js
THEME = avrd-ina

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

DIR_MOD = mod

g_storage_2h.md: $(DIR_MOD)/header.md \
	$(DIR_MOD)/begin.md \
	$(DIR_MOD)/requirements.md \
	$(DIR_MOD)/market_focus.md \
	$(DIR_MOD)/data_carriers.md \
	$(DIR_MOD)/lto_tapes.md \
	$(DIR_MOD)/layers1.md \
	$(DIR_MOD)/file_systems.md \
	$(DIR_MOD)/object_storage.md \
	$(DIR_MOD)/the_cloud.md \
	$(DIR_MOD)/ex_debate.md \
	$(DIR_MOD)/failsafe.md \
	$(DIR_MOD)/integrity_checks.md \
	$(DIR_MOD)/ex_integrity1.md \
	$(DIR_MOD)/backup.md \
	$(DIR_MOD)/data_migration.md \
	$(DIR_MOD)/your_choice.md \
	$(DIR_MOD)/storage_checklist.md \
	$(DIR_MOD)/summary_1.md \
	$(DIR_MOD)/end.md
	cat $^ > $@

g_storage_all.md: $(DIR_MOD)/begin.md \
	$(DIR_MOD)/data_carriers.md \
	$(DIR_MOD)/lto_tapes.md \
	$(DIR_MOD)/file_systems.md \
	$(DIR_MOD)/object_storage.md \
	$(DIR_MOD)/the_cloud.md \
	$(DIR_MOD)/ex_debate.md \
	$(DIR_MOD)/integrity_checks.md \
	$(DIR_MOD)/sds.md \
	$(DIR_MOD)/failsafe.md \
	$(DIR_MOD)/storage_terms.md \
	$(DIR_MOD)/backup.md \
	$(DIR_MOD)/data_migration.md \
	$(DIR_MOD)/your_choice.md \
	$(DIR_MOD)/summary_1.md \
	$(DIR_MOD)/end.md
	cat $^ > $@


handouts: $(wildcard PRINT-*.md)
	mkdir -p $(OUT_PDF)
	$(PD) -s -f markdown+smart -o $(OUT_PDF)$@ $<




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


PRINT-%.pdf: PRINT-%.md
	$(PD) -s -f markdown+smart -o $(OUT_PDF)/$@ $<



.PHONY: clean
clean:
	rm -f $(OUT_HTML)/*.html
	rm -f $(OUT_PRINT)/*.html
	rm -f $(OUT_PDF)/*.pdf
