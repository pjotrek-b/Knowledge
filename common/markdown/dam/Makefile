PD = pandoc
PD_DATA = /usr/share/pandoc/data
PD_TEMPLATE = --template=$(PD_DATA)/templates/default.revealjs
PD_TEMPLATE_PRINT = --template=$(PD_DATA)/templates/default.revealjs-print

DT = decktape -s 2048x1536

SUBDIR = dam
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

g_dam_0.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/_END.md
	cat $+ > $@

g_dam-data_models.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/overview.md \
	$(DIR_MOD)/not_equal.md \
	$(DIR_MOD)/language_matters.md \
	$(DIR_MOD)/datetime.md \
	$(DIR_MOD)/datetime_period.md \
	$(DIR_MOD)/datetime_fuzzy.md \
	$(DIR_MOD)/md_standards_1.md \
	$(DIR_MOD)/common_entities.md \
	$(DIR_MOD)/common_terms.md \
	$(DIR_MOD)/md-dc_intro.md \
	$(DIR_MOD)/covocs.md \
	$(DIR_MOD)/identifiers.md \
	$(DIR_MOD)/wikidata.md \
	$(DIR_MOD)/relationships_1.md \
	$(DIR_MOD)/import_export.md \
	$(DIR_MOD)/xsd_validation.md \
	$(DIR_MOD)/value_source.md \
	$(DIR_MOD)/annotations_1.md \
	$(DIR_MOD)/lod_1.md \
	$(DIR_MOD)/_END.md
	cat $+ > $@

g_dam-full.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/asset_lifecycle.md \
	$(DIR_MOD)/dam_intro.md \
	$(DIR_MOD)/dam_list.md \
	$(DIR_MOD)/not_equal.md \
	$(DIR_MOD)/web_based.md \
	$(DIR_MOD)/language_matters.md \
	$(DIR_MOD)/datetime.md \
	$(DIR_MOD)/datetime_period.md \
	$(DIR_MOD)/datetime_fuzzy.md \
	$(DIR_MOD)/identifier.md \
	$(DIR_MOD)/md_standards_1.md \
	$(DIR_MOD)/md_standards_requirements.md \
	$(DIR_MOD)/common_entities.md \
	$(DIR_MOD)/common_terms.md \
	$(DIR_MOD)/md-dc_intro.md \
	$(DIR_MOD)/covocs.md \
	$(DIR_MOD)/identifiers.md \
	$(DIR_MOD)/wikidata.md \
	$(DIR_MOD)/relationships_1.md \
	$(DIR_MOD)/multi_schema.md \
	$(DIR_MOD)/import_export.md \
	$(DIR_MOD)/file_reference.md \
	$(DIR_MOD)/got_apis.md \
	$(DIR_MOD)/xsd_validation.md \
	$(DIR_MOD)/value_source.md \
	$(DIR_MOD)/annotations_1.md \
	$(DIR_MOD)/lod_1.md \
	$(DIR_MOD)/does_it_scale.md \
	$(DIR_MOD)/got_plugins.md \
	$(DIR_MOD)/got_support.md \
	$(DIR_MOD)/good_practice.md \
	$(DIR_MOD)/have_failover.md \
	$(DIR_MOD)/_END.md
	cat $+ > $@

g_dam-45m.md: $(DIR_MOD)/_HEADER.md \
	$(DIR_MOD)/_BEGIN.md \
	$(DIR_MOD)/asset_lifecycle.md \
	$(DIR_MOD)/dam_intro.md \
	$(DIR_MOD)/dam_list.md \
	$(DIR_MOD)/not_equal.md \
	$(DIR_MOD)/cms_criteria.md \
	$(DIR_MOD)/language_matters.md \
	$(DIR_MOD)/datetime.md \
	$(DIR_MOD)/datetime_period.md \
	$(DIR_MOD)/datetime_fuzzy.md \
	$(DIR_MOD)/identifier.md \
	$(DIR_MOD)/identifier_pid.md \
	$(DIR_MOD)/identifier_requirements.md \
	$(DIR_MOD)/common_terms.md \
	$(DIR_MOD)/covocs.md \
	$(DIR_MOD)/identifiers.md \
	$(DIR_MOD)/wikidata.md \
	$(DIR_MOD)/relationships_1.md \
	$(DIR_MOD)/multi_schema.md \
	$(DIR_MOD)/import_export.md \
	$(DIR_MOD)/file_reference.md \
	$(DIR_MOD)/got_apis.md \
	$(DIR_MOD)/does_it_scale.md \
	$(DIR_MOD)/got_plugins.md \
	$(DIR_MOD)/got_support.md \
	$(DIR_MOD)/good_practice.md \
	$(DIR_MOD)/have_failover.md \
	$(DIR_MOD)/_END.md \
	$(DIR_MOD)/value_source.md
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
