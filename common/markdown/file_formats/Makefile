PD = pandoc
PD_DATA = /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs

DT = decktape -p 0 -s 2048x1536

SUBDIR = file_formats
OUT_BASE = ../..
REVEALJS = $(OUT_BASE)/../reveal4.js
# THEME = avrd-ina
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

# Subfolder where the Markdown modules are located.
# These module files can then be concatenated to generate different
# presentation versions from a common set of "module lego blocks".
DIR_MOD = mod

# Use this as Makefile rule-template for modular presentations:
# See: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
#   `cat $^ > $@` does not allow multiple copies of the same file as pre-requisite.
#   `cat $+ > $@` can be used to re-include the same copy of a pre-requisite.
#   
# Note: use "make -B ..." to force re-building the modular presentations, since
# only re-ordering the required modules sometimes won't be considered as a
# change to the code.
g_stub.md: $(DIR_MOD)/header.md \
	$(DIR_MOD)/begin.md \
	$(DIR_MOD)/end.md
	cat $+ > $@

g_fileformats_all.md: $(DIR_MOD)/_header.md \
	$(DIR_MOD)/_begin.md \
	$(DIR_MOD)/artificial_restrictions1.md \
	$(DIR_MOD)/av_trinity.md \
	$(DIR_MOD)/best_practice_ingest.md \
	$(DIR_MOD)/bitrate/bitrate_calc.md \
	$(DIR_MOD)/bitrate/bitrate_intro.md \
	$(DIR_MOD)/bitrate/bitrate_modes.md \
	$(DIR_MOD)/bitrate/bitrate_quality.md \
	$(DIR_MOD)/bitrate/bitrate_size.md \
	$(DIR_MOD)/calc_filesize_uncompressed.md \
	$(DIR_MOD)/checklist_preservation2.md \
	$(DIR_MOD)/checklist_preservation.md \
	$(DIR_MOD)/choice_balance1.md \
	$(DIR_MOD)/choice_tempting2.md \
	$(DIR_MOD)/choice_tempting.md \
	$(DIR_MOD)/data_structure1.md \
	$(DIR_MOD)/different_strokes2.md \
	$(DIR_MOD)/different_strokes.md \
	$(DIR_MOD)/error_resilience.md \
	$(DIR_MOD)/eternal_replayer.md \
	$(DIR_MOD)/ex_rebrand.md \
	$(DIR_MOD)/filesize_calc.md \
	$(DIR_MOD)/filesize_matters.md \
	$(DIR_MOD)/format_complexity.md \
	$(DIR_MOD)/format_examples.md \
	$(DIR_MOD)/format_wars.md \
	$(DIR_MOD)/h1-look_inside.md \
	$(DIR_MOD)/h1-obsolescence.md \
	$(DIR_MOD)/holy_grail.md \
	$(DIR_MOD)/links1.md \
	$(DIR_MOD)/list_moscow.md \
	$(DIR_MOD)/look_inside1.md \
	$(DIR_MOD)/look_inside-paper.md \
	$(DIR_MOD)/look_inside-table1.md \
	$(DIR_MOD)/naming/av_format_naming1.md \
	$(DIR_MOD)/naming/fourcc.md \
	$(DIR_MOD)/naming/magix_naming.md \
	$(DIR_MOD)/naming/mpeg4_confusion.md \
	$(DIR_MOD)/open_vs_closed.md \
	$(DIR_MOD)/performance_tradeoff.md \
	$(DIR_MOD)/policies_examples.md \
	$(DIR_MOD)/properties_significant1.md \
	$(DIR_MOD)/quality_tips.md \
	$(DIR_MOD)/questions/q_your_formats.md \
	$(DIR_MOD)/questions/q_your_interests.md \
	$(DIR_MOD)/questions/q_your_wishes.md \
	$(DIR_MOD)/risks_longevity.md \
	$(DIR_MOD)/summary_preservation.md \
	$(DIR_MOD)/theory_vs_practice.md \
	$(DIR_MOD)/_end.md
	cat $+ > $@

g_fileformats_50m.md: $(DIR_MOD)/_header.md \
	$(DIR_MOD)/_begin.md \
    $(DIR_MOD)/holy_grail.md \
    $(DIR_MOD)/choice_tempting.md \
    $(DIR_MOD)/questions/q_your_formats.md \
	$(DIR_MOD)/av_trinity.md \
    $(DIR_MOD)/av_format_naming1.md \
	$(DIR_MOD)/ex_rebrand.md \
    $(DIR_MOD)/h1-look_inside.md \
    $(DIR_MOD)/look_inside1.md \
    $(DIR_MOD)/look_inside-table1.md \
    $(DIR_MOD)/bitrate/bitrate_intro.md \
    $(DIR_MOD)/properties_significant1.md \
    $(DIR_MOD)/different_strokes.md \
    $(DIR_MOD)/different_strokes2.md \
    $(DIR_MOD)/choice_balance1.md \
    $(DIR_MOD)/risks_longevity.md \
    $(DIR_MOD)/error_resilience.md \
    $(DIR_MOD)/open_vs_closed.md \
    $(DIR_MOD)/theory_vs_practice.md \
    $(DIR_MOD)/eternal_replayer.md \
    $(DIR_MOD)/format_complexity.md \
    $(DIR_MOD)/questions/q_your_interests.md \
    $(DIR_MOD)/list_moscow.md \
    $(DIR_MOD)/policies_examples.md \
    $(DIR_MOD)/checklist_preservation.md \
    $(DIR_MOD)/checklist_preservation2.md \
	$(DIR_MOD)/links1.md \
	$(DIR_MOD)/_end.md
	cat $+ > $@


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
