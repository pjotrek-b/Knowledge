PD = pandoc
PD_DATA = /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs
PD_TEMPLATE_PRINT = --template=$(PD_DATA)/templates/default.revealjs-print

DT = decktape -s 2048x1536

SUBDIR = foss
OUT_BASE = ../..
REVEALJS = $(OUT_BASE)/../reveal4.js
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

DIR_MOD = mod

g_foss_0.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/_END.md
	cat $+ > $@

g_foss_full.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/intro_foss.md \
	$(DIR_MOD)/just_using.md \
	$(DIR_MOD)/q_your_reasons.md \
	$(DIR_MOD)/whatif_real_free.md \
	$(DIR_MOD)/popular_mistakes.md \
	$(DIR_MOD)/infrastructure.md \
	$(DIR_MOD)/roads_n_bridges_quotes.md \
	$(DIR_MOD)/infrastructure_taxes.md \
	$(DIR_MOD)/starting_conditions.md \
	$(DIR_MOD)/unpossible.md \
	$(DIR_MOD)/mediainfo_checks.md \
	$(DIR_MOD)/orphans.md \
	$(DIR_MOD)/success_stories.md \
	$(DIR_MOD)/stories/ffv1.md \
	$(DIR_MOD)/stories/mkv.md \
	$(DIR_MOD)/stories/mediainfo_checks.md \
	$(DIR_MOD)/taken_for_granted.md \
	$(DIR_MOD)/community_you.md \
	$(DIR_MOD)/summary1.md \
	$(DIR_MOD)/_END.md
	cat $+ > $@

g_foss_frame202412.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/intro_foss.md \
	$(DIR_MOD)/unprofessional.md \
	$(DIR_MOD)/just_using.md \
	$(DIR_MOD)/q_your_reasons.md \
	$(DIR_MOD)/whatif_real_free.md \
	$(DIR_MOD)/popular_mistakes.md \
	$(DIR_MOD)/infrastructure.md \
	$(DIR_MOD)/infrastructure_maintainer.md \
	$(DIR_MOD)/roads_n_bridges_quotes.md \
	$(DIR_MOD)/infrastructure_taxes.md \
	$(DIR_MOD)/starting_conditions.md \
	$(DIR_MOD)/unpossible.md \
	$(DIR_MOD)/success_stories.md \
	$(DIR_MOD)/stories/ffv1.md \
	$(DIR_MOD)/stories/mkv.md \
	$(DIR_MOD)/tools/tools_mediaarea.md \
	$(DIR_MOD)/stories/mediainfo_checks.md \
	$(DIR_MOD)/tools/tool_vlc.md \
	$(DIR_MOD)/tools/tool_ffmpeg.md \
	$(DIR_MOD)/tools/tool_vrecord.md \
	$(DIR_MOD)/tools/tool_ampv.md \
	$(DIR_MOD)/tools/tool_dvdisaster.md \
	$(DIR_MOD)/community_you.md \
	$(DIR_MOD)/summary1.md \
	$(DIR_MOD)/_END.md
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
	$(PD) -s -t revealjs -V revealjs-url=$(REVEALJS) $(PD_TEMPLATE_PRINT) -V theme=$(THEME)-print -V showNotes=true -o $(OUT_PRINT)/$@ $<

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
