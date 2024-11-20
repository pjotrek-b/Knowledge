General notes regarding digital asset management systems - and presentations related to them.
2023-07-06


# I



# Sandboxes / Demos

  * [Sandbox: Omeka S](https://omeka.org/s/download#sandbox)

  * [Demo: AtoM](https://demo.accesstomemory.org/)
    You can log in with full administrator privileges using the following email address and password:
    email: demo@example.com
    password: demo

    You can login with full translate privileges using the following email address and password,
    email: translate@example.com
    password: translate

  * [Free installation: RessourceSpace](https://pb.free.resourcespace.com/)
    user: admin
    password: d8f2cef8


# Data interfaces/migration

**AtoM:**
  * [AtoM: Data Migration](https://www.artefactual.com/services/data-migration/)
  * [AtoM: OAI Plugin](https://www.accesstomemory.org/en/docs/2.6/user-manual/import-export/oai-pmh/)

**ResourceSpace:**
  * [ResourceSpace: Exporting Data](https://www.resourcespace.com/knowledge-base/systemadmin/download-config)
    This seems to be only for exporting the RS setup/database config. Not for metadata exchange.
  * [ResourceSpace: CSV Export](https://www.resourcespace.com/knowledge-base/user/csv_export)
  * [ResourceSpace: CSV Upload (Import)](https://www.resourcespace.com/knowledge-base/plugins/csv-upload)
   


# Remarks

## Omeka: 

  * [Omeka Manual: Site Planning Tips](https://omeka.org/classic/docs/GettingStarted/Site_Planning_Tips/)
  * [Omeka FAQs](https://forum.omeka.org/t/omeka-frequently-asked-questions/6777)

## AtoM: 

  * Seems to be designed to implement metadata standards by-design.
  * Very straight forward, very professional - yet very rigid and "paper librariany"
  * Definitely proper import/export interfaces. Even OAI-PMH plugin by default.
  * Seems to serve as public web-access and in-house catalogue in one.
    If you don't log-in, you get the public view.
  * multi-lingual UI.
  * Cvocs are called "taxonomies"

Related links:
  [ISDF Guidelines (2007)](https://www.ica.org/sites/default/files/CBPS_2007_Guidelines_ISDF_First-edition_EN.pdf)


## RessourceSpace: 
  * Export seems to be CSV only.





# Related links

Maybe interesting/useful?


  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 1: Basic Rules)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0038_iso_wd_8601-1_2016-02-16.pdf)
  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 2: Extensions)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf)
    Gibt Syntax-Vorschläge für fuzzy-dates
  * [Wikidata Help: Dates](https://www.wikidata.org/wiki/Help:Dates)
    Includes information about handling date/time, ranges, precision, qualifiers - as well as exact/inexact dates, etc.
  * [AVP's DAM Operational Model](https://www.weareavp.com/guide/dam-operational-model/)
  * [Interview mit Kara van Malssen (AVP) about DAM operational model](https://www.weareavp.com/avps-operational-model-for-dam-success-an-interview-with-kara-van-malssen/)


# Requirements - Wishlist

(based on a copy from what I wrote into NHM KPN Kulturerbe Knowledgebase: https://kb.kulturerbe.work/books/collection-management-systems-alt/page/requirements-wishlist)

The following is a rough list of "things to be aware of" or to have decided
before going on the quest, seeking your hopefully "last" or "final" - at least
finally stable and enduring - Collection Management System.

To finally get at least part of the level of control back that we had over our
collections in the last centuries. But now in digital.

**Must have**
  * A web-based client/server architecture.
  * Well-integrated relationship handling.

  * Support proper identifier schemes/syntax/counter
  * Support ISO639 for languages.
  * Support ISO8601 date format (yyyy-mm-dd) properly (for input and display)

  * Controlled vocabulary, Lists and terms
    * Not too exotic, not too dumbed down handling of list-terms and their lists.
    * Import/export of lists in a reasonably easy way.
    * Support changing/editing list items while they have already been assigned/used.
    * Supporting hierarchies in lists
    * Support disabling list items (so they are shown, but not available for selection. Useful for hierarchy-grouping)
    * Support hiding list items
  * Advanced search = select specific fields to search for a given value.
  * Simple *and* advanced search.


**Should have**
  * Support fuzzy-dates (like "ca. 1900", "1920-01" or "bronce age")

  * A demo website where you can login and play and test and hack whatever you like.

  * Web-frontend for public access.

  * Runs on a pure FOSS-stack (server backend preferably on GNU/Linux). In
    contrast to requiring database engines like MSSQL, Oracle, etc.

  * Can handle values and identifiers for entries in (vocabulary) lists.

  * Proper import/export engines, preferred with templates and examples.

  * Support for describing relationships beyond one term (eg assign defined
    metadata forms schema to relationships. Example "hasAgent in EN15907")

  * Support multi-language data entries.
    Examples: Have the title of a work in English, as well as German (and
              marked properly)

  * FOSS licensed. See [Public Money, Public Code](https://publiccode.eu/)

  * Commit message log:
    Who changed what when (and why)?


**Could have**
  * Version control (for edits)
  * IIIF.io support.
  * Supports gathering data from online sources (wikidata, etc)
  * Content annotations (optional)
  * Save searches

 
**Questions**

  * Are the uploaded/linked files handled by the DAM?
  * Do you have any control over filename/folderstructure?
  * Which level of control do you need over filename/folderstructure?
    (external processes / references to these assets?)



