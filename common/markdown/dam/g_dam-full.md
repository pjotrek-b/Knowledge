---
title: Data Models in DAMs - Lessons learned
author: |-
        Peter Bubestinger-Steindl \
        (`peter @ ArkThis.com`)
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

transition: none
defaultTiming: 60
slideNumber: true
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page

;date: October 2022

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover
---



<!--
# Abstract

Choosing any digital asset management system is a huge commitment, and
configuring the system to support a given data model (eg a certain ISO
Standard), is quite a non-trivial task.

There are certain things one would like to:

  * get right
  * avoid in the first place
  * have better metadata in the end
  * exchange data with others

What are controlled-vocabularies? keys-values? relationships? agents? LoD?
iso639? XSDs? - and how to make your life easier when dealing with
importing/exporting or implementing metadata layouts in a (media) asset
management system.

This may also influence your choice of DAMs:
Can it handle *your* data structure needs?
-->



<!--
Ideas:

  * mention basic ISO standards (date/time, lang, countries, etc)
  * don't invent your own terms, if there's a better source to reference
  * before you start anything new:
    Unless you're the only one with "that kind of collection":
    Speak with others who are in the same "business" as you.
    Find a common denomiator, don't re-invent the wheel, and combine resources.
  * content annotations:
    lack of exchange format definitions/standards
  * Except for: IIIF.io


-->

# Managing Digital Assets

![](../../../images/digital_asset/digital-asset-lifecycle.png){width=50%}



# CMS? MAM? DAM!

  * **CMS:** Collection Management System
  * **MAM:** Media Asset Management
  * **DAM:** [Digital Asset Management](https://en.wikipedia.org/wiki/Digital_asset_management)

<aside class="notes">
CMS usually includes a MAM, and a MAM is a media-type-aware version of a DAM.

Disclaimer: DAMs or MAMs may be used for preservation, but are sometimes/often
not designed or intended for use in a preservation context, but merely to store
and handle "digital assets": from regular office files (documents, images, etc)
to managing in-house assets of larger companies. And some of these systems were
then "also" used by archives.

The term "Collection Management System" usually indicates that it was more
likely intended to be used in a preservation context, such as museums for
example - where it may be used beyond digital: To handle physical collections
even, like books, chairs, or anything. And files ;)

You may see the term "Collection Management System" being used interchangeably
with DAM or MAM by the preservation community.

(Note: The abbreviation "CMS" usually means
["**Content** Management System"](https://en.wikipedia.org/wiki/Content_management_system)
which is something completely different. In order to save some screen space, I
will use the abbreviation "CMS" in these slides however instead of typing
"Collection Management System")


A DAM is usually the generic version of MAM - and sometimes the borders between
"is it a MAM? is it a DAM?" are fuzzy and unclear, because they are so closely
related.


Typical for "classic" DAMs:
Often trimmed and designed for handling "2D material" (documents, images). When
it comes to audiovisual, they're mostly inadequate or not suitable for
archive-suitable quality media handling.

MAMs are usually better suited for handling media.
For example:

  * auto-generating access/preview copies suitable for low-bandwidth/internet/browser access.
  * image area annotation
  * time based annotation ("markers")

But watch out! Even systems designed to handle AV media, are often not taking
too much care about preservation/archival aspects. It's not uncommon that
"looks/sounds good enough!" is exactly where you're at.

So please:

  * Try *before* you buy!
  * Don't trust sales. Ever.
</aside>



# A loooong list of (70+) systems... 😮️

<small>
[https://bits.ashleyblewer.com/blog/2017/08/09/collection-management-system-collection/](https://bits.ashleyblewer.com/blog/2017/08/09/collection-management-system-collection/)
</small>

![](../../../images/tools/dam_mam_cms/ashley_cms_collection.png){width=80%}



# A short list

of some popular OpenSource CMS:

  * [Omeka](https://omeka.org/)
  * [AtoM (Access To Memory)](https://www.accesstomemory.org/)
  * [ResourceSpace](https://www.resourcespace.com/)




# Not all DAMs are created equal.

  * Which use-cases was it designed for?
  * Proper media-type handling? <small>(image, docs, AV?)</small>
  * Multiple data schemas in parallel?
  * Local app vs browser-based?
  * License model?
  * Setup/maintenance complexity?

<aside class="notes">
But watch out! Even systems designed to handle AV media, are often not taking
too much care about preservation/archival aspects. It's not uncommon that 
"looks/sounds good enough!" is exactly where you're at.

So please:

  * Try *before* you buy!
  * Don't trust sales too much...
  * Speak with others who have the same use-cases (or system).
</aside>


# Language matters.

> English, please?

  * All field-names
  * All tech-terms
  * Documentation
  * **but:** UI and term-labels multi-language

<!--
Date and Time Formats
-->


# Date and Time Formats

A classic.  
Never gets "old". 😜️



# Date Formats

| Dates | Times |
| ----- | ----- |
| January 3rd, 1981     | 13:37         |
| 3. Jänner 1981        | 13:37:00      | 
| 1/3/1981              | 0h13m37s      |
| 3.1.1981              | 123.4         |
| 1977-11-23-02         |               |

Timezones?  
Other calendar systems...?



# ISO 8601. 🤩️

  * **Date:**  
    1981-01-03
  * **Date &amp; Time (+TZ):**  
    1981-01-03**T**00:12:34<small>+02:00</small>
  * **Week (+weekday):**  
    2022-W46-5
  * **Duration:**  
    PnYnMnDTnHnMnS 

<cite>
See: [(Wikipedia) ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
</cite>

<aside class="notes">
Whatever you do, please:

  * Support iso8601 for date/time **input** <small>(if possible)</small>.
  * Support exporting/importing iso8601 date/time/duration strings.

You may however, want to be able to at least display date/time also in
different formats (configurable).

Why?
The "psycho-visual perception" (does it look/feel good?) of people reading
ISO8601 syntax is mixed...

  * Standalone dates: ok.
    Sometimes cleaner to read than written date.
    Sometimes not.

  * Date+Time: rather hard to grasp visually.
    (Add a timezone and you've lost most operator staff)

  * Duration: Forget it.
    Hard to read as a person.

**Examples:**

   * 1981-01-03 (nice) vs January 3rd, 1981 (warmer)
   * 1981-01-03T20:15+01:00 (uck.)
    

Here's a link to documents from the US LoC, about rules and extensions for
date/time cataloging:

  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 1: Basic Rules)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0038_iso_wd_8601-1_2016-02-16.pdf)
  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 2: Extensions)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf)
</aside>



# Duration / Period

  * Support having "from/to" in date fields?
  * With different, even mixed "precision"?
  * "1920-1923"
  * "1920-01 - 1923"


# Got "Fuzzy" Dates...?

  * 1910-01
  * circa. 1800
  * Bronce age
  * WWII
  * etc.

> Oh, btw: Got a [common syntax](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf)?

<aside class="notes">
Seems trivial, but it makes sense to support fuzzy date/time.

To my knowledge, there's no standard for fuzzy-dates (ISO8601 doesn't cover
that).

The US Library of Congress (LoC) has issued extension rules for datetime
issues, that include suggestions for approximate and uncertain date/time
values, as well as general rules for handling this for cataloging:

  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 1: Basic Rules)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0038_iso_wd_8601-1_2016-02-16.pdf)
  * [LoC: WD8601-2\_2016 Representation of dates and times (Part 2: Extensions)](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf)
</aside>

# The Unique Identifer

A "*must have*". Also known as:

  * Object ID
  * Archive signature
  * Item ID
  * [UID](https://en.wikipedia.org/wiki/Unique_identifier), [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier)
  * ...

<aside class="notes">
Questions:
  * For what reason(s) would you want/need an identifier?
  * Why is it desired that it's unique?
  * What is "Linked Open Data", and what's its relation to 
</aside>



# The Unique Identifer
## Examples

  * V-00815
  * W/S #00034
  * FBW002984
  * 38AF2EC1A13494B9DF6FD6E75960307
  * 111-ADC-4319
  * 8-717774-330128
  * [adBDwKf_aSE](https://www.youtube.com/watch?v=adBDwKf_aSE)
  * [Q83697636](https://www.wikidata.org/wiki/Q83697636)
  * ...

<aside class="notes">
All of the above examples are patterns used for real.
</aside>



# Requirements

  * Stable syntax?
  * Recognizable?
  * Scope?
  * Filename-safe?
  * Printable? <small>(QR- or barcode label)</small>


# DAM-handle it?

  * auto-generate?
  * increment?
  * validate?
  * more than 1 syntax?

<aside class="notes">
If you're dealing with different entity- and object-types, that require
different identifier-syntaxes:
Check if your DAM supports different ID-syntax for these cases in parallel,
without conflicts.
</aside>
# MD-Standards: Some of Them

  * [Dublin Core](http://dublincore.org/):
    <small>Core fields (&amp; their names)</small>
  * [METS](http://www.loc.gov/standards/mets/):
    <small>(MD container) descriptive, administrative, structural</small>
  * [PREMIS](http://www.loc.gov/standards/premis/):
    <small>A metadata framework</small>
  * [FRBR ("furbur")](https://www.loc.gov/cds/downloads/FRBR.PDF):
    <small>Comprehensive description of bibliographic works</small>
  * [CEN EN 15907](http://filmstandards.org/fsc/index.php/EN_15907):
    <small>Comprehensive description of cinematographic works</small>
  * [EBUCore](https://tech.ebu.ch/MetadataEbuCore):
    <small>descriptive & technical (broadcast use case focus)</small>
  * [Mediainfo XML](https://mediaarea.net/mediainfo/mediainfo_2_0.xsd):
    <small>Technical metadata (AV)</small>
  * u.v.m

<aside class="notes">
So you see:
Metadata itself needs to be stored in "a format" too.  Same rules
and properties as for the other data formats apply (open, accessible, etc)

PREMIS: PREservation Metadata: Implementation Strategies
METS: Metadata Encoding and Transmission Standard
EBUCore: European Broadcast Union (EBU) - based on Dublin Core
FRBR: Functional Requirements for Bibliographic Records
EN 15907: Metadata standard for Cinematographic Works
</aside>



# Some Generic Basics

  * [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601): Date &amp; time-related
  * [ISO 639](https://en.wikipedia.org/wiki/ISO_639): Languages
  * [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1): Countries, subdivisions
  * [Getty TGN](https://www.getty.edu/research/tools/vocabularies/tgn/faq.html): Geographic names
  * ...







# MAM Requirements for MD-Standards

  * Store ID/ISO values (or just label)?
  * Relationships between different schema?
  * Import/export schema support?
  * Field labels in UI vs "The Standard Terms"?
  * Watch out for "EEE":  
    [Embrace, Extend, and Extinguish](https://en.wikipedia.org/wiki/Embrace,_extend,_and_extinguish)

<aside class="notes">
**EEE:**
Although the phrase "Embrace, Extend, and Extinguish" was invented by
Microsoft, the principle is neither new, nor limited to their company:

With any standard, it may be so that someone implements it, but then feels like
adding an additional field (for whatever reason). This may seem fine at first,
but may lead to interoperability issues pretty fast.

If possible, pay attention to how "proper" someone/some system implements a
certain Standard if they claim to do so. Sometimes this happens by best
intentions, by accident or by strategic intentions.

In any case, you may have to deal/suffer from the consequences.
</aside>


# Common Entity Terms

![](../../../images/metadata/en15907-entities.png){width=600px}

<aside class="notes">
The image graph shows the basic entity-relationship layout of the EN15907
metadata standard for cataloging cinematographic works.

Even if you have nothing to do with cataloging of cinematographic works, there
are certain names for common entities here, which are already common terms
even in other metadata models:

  * Work / Variant / Manifestation (FRBR)
  * Agent
  * Event

</aside>

# Common terms?

> "We've always called it that way, so it's clear."

  * Person, Company, Actor or: **Agent**?
  * Recording, Film, Video or: **MovingImage**?
  * Action, Shooting or: **Event**?
  * Author or: **Creator**?
  * etc.

<aside class="notes">
I'm very sure, most use-cases are not unique.
As said before: If someone else is collecting and cataloguing and managing
similar items or has similar use-cases, please get in contact with each other.

But: As great as sharing and using common CoVocs is, it brings the "problem" that
you need to agree on common terms. :)

This can sometimes be trivial, and otherwise be non-trivial - and even very
emotional.  Practically, a major issue is often that different domains have
different terms in their professional vocabularies already - which are (or may
be) mis-interpreted or confusing for other domains.  

> "But we call it '...' - and calling it '...' may completely confuse our operators"

Example: The term "Agent" ;)


Be ready for trade-offs.
Be ready to use different, but now common, terms.
</aside>


# Dublin Core: Elements

<small>

  1. Contributor
  2. Coverage
  3. Creator
  4. Date
  5. Description
  6. Format
  7. **Identifier**
  8. Language
  9. Publisher
  10. Relation
  11. Rights
  12. Source
  13. Subject
  14. **Title**
  15. Type

</small>

<aside class="notes">
It may seem trivial, but agreeing on calling these collection-agnostic, basic
fields by certain names already made your data-handling life easier (and more
compatible).

  1. Contributor - “An entity responsible for making contributions to the
     resource.”
  2. Coverage - “The spatial or temporal topic of the resource, the spatial
     applicability of the resource, or the jurisdiction under which the
resource is relevant.”
  3. Creator - “An entity primarily responsible for making the resource.”
  4. Date - “A point or period of time associated with an event in the
     lifecycle of the resource.”
  5. Description - “An account of the resource.”
  6. Format - “The file format, physical medium, or dimensions of the
     resource.”
  7. Identifier - “An unambiguous reference to the resource within a given
     context.”
  8. Language - “A language of the resource.”
  9. Publisher - “An entity responsible for making the resource available.”
  10. Relation - “A related resource.”
  11. Rights - “Information about rights held in and over the resource.”
  12. Source - “A related resource from which the described resource is
      derived.”
  13. Subject - “The topic of the resource.”
  14. Title - “A name given to the resource.”
  15. Type - “The nature or genre of the resource.”
</aside>
<!-- 
Controlled vocabularies and lists
-->

# Controlled Vocabularies

And other lists/terms/taxonomies


# Controlled Vocabulary

> "Controlled vocabulary schemes mandate the use of predefined, authorised
> terms that have been preselected by the designers of the schemes, in contrast
> to natural language vocabularies, which have no such restriction."

<small>Source: ["Controlled Vocabulary" (Wikipedia)"](https://en.wikipedia.org/wiki/Controlled_vocabulary)</small>


# Why CoVocs?

> Same-same 😇, but different... 😭

  * **35mm** = 35 mm = 35 millimètre
  * **dup pos** = duplicate positive
  * **de** = deu = german = German = alemán
  * **yuv422p10le** = YUV, 4:2:2, 10 bpc
  * **Director** = Directed by = Regisseur = Regie

<aside class="notes">
**Controlled vocabulary:**
Be very greedy with "free text" fields, as they lead to chaos, disorder and mayhem!

On the other hand:
It's always good to have "some" field where to put the "doesn't go anywhere
else" stuff. And it may also be useful/necessary to be able to store/preserve
the original terms "as-is", since mapping different sources to a vocabulary may
not be as straight forward or exact as one would hope.

Oh and other mapping fun:
  * Typos do happen! "35mn" anyone?
  * 1967-06-07-12 (Date with a "sort index" hack added in Freetext field)
</aside>



# Handling CoVocs

  * Clear choice/definition of terms?
  * Standard terms <small>(e.g. ISO mapping)</small> for:  
    Language, Country, Region, Tech-Terms, etc.
  * Keyboard shortcuts to select specific terms?
  * Nested hierarchies?!
  * Maintaining / augmenting terms?
  * Identifier vs Label?



# Identifier &amp; Label

> Can the MAM store &amp; handle this properly?  

| Identifier<small>(for machines)</small> | Label<small>(for humans>) | Translations? |
| ------------------------ | --------------| ------------- |
| `sq`, `sqi`, `alb`, ...  | Albanian      | Albanisch<sup>(de)</sup>, Albanais<sup>(fr)</sup>    |
| `de`, `deu`, `ger`, ...  | German        | Deutsch<sup>(de)</sup>, Allemand<sup>(fr)</sup>      |
| `und`                    | Undetermined  | ...?                   |

<small>
Examples: 
[ISO 639 (Languages)](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes),
[ISO 3166 (Countries)](https://en.wikipedia.org/wiki/ISO_3166-1),...
</small>

<aside class="notes">
Separating label from identifier, has the following benefits:

  * Label can be translated arbitrarily.
  * The meaning of the data stored is (more) "clear".
    Less options for mis-interpretation errors.
  * Can even be (more easily) upgraded to shared CoVocs and Linked Open Data in
    the future.
  * Import/Export and exchange with others (and systems) greatly improved.
</aside>



# Shared CoVocs

  * Same vocabulary terms/lists can be 
    used across different systems/domains.
  * Use existing CoVocs where possible.
  * Share/publish yours.
  * Be in contact/exchange with others.
  * Be ready for embracing trade-offs.



# Dynamic CoVocs

> How does your DAM deal with:

  * Adding new terms (on the fly)?
  * Editing terms that have already been assigned...? 😱️
  * Import / export lists?

<aside class="notes">
It's quite unrealistic to assume any term-list will not change over time.
Depening on how a DAM system is designed/built under the hood, it may (or may
not) handle changes to term-lists well.

Try to assign terms to records, then change/move/re-label/etc those
already-assigned terms.

Some DAMs store terms by references (usually some form of identifier), others
store the actual value at the time the term was assigned to a field.

Both have their pros and cons, yet with data being more and more required to
become "flexible" and interoperable, it is more likely that being able to
handle term-assignments dynamically will be the preference for future-proof
systems.

</aside>



<!--
-->

# Shared Identifiers

> If you're not the only one referring to ...
> wouldn't it make sense to have a common,
> shared identifier?

<aside class="notes">
With data being exchanged and aggregated, it's becoming more interesting (and practically important) to include identifiers from different sources, to be able to relate database entries with each other.

A typical scenario is:

  * in-house identifier
  * additional external identifier(s), like IDs for Agents.
  * external identifier from data source.  
    Example: When merging multiple collections into one.


Increasingly popular:

  * Store Wikidata identifier to relate to common entries.
</aside>


# Handling Multiple IDs?

Add attribute option declaring "which" identifier:

`<id schema="dnb"> ... </id>`  
`<id schema="efg"> ... </id>`  
`<id schema="wikidata"> Q84199 </id>`  

<aside class="notes">
This is a very simple "attribute" added to an identifier field.
This example was taken from EN15907 standard for cataloguing cinematographic
works.
</aside>
<!-- Wikidata -->

# Wikidata

![WikiData Logo](../../../images/icons-logos/wikidata-logo.png){width=160px}  

> "[...] is a free and open knowledge base that can be read and edited by
> both humans and machines."

<cite>
Example: 
[Earth (Q2)](https://www.wikidata.org/wiki/Q2) vs 
[Earth (Q83697636)](https://www.wikidata.org/wiki/Q83697636)
</cite>

<!--
Entity-relationships.
-->

# Data Structure Matters

> "classical" catalogue = flat, table/cell thinking.

  * Better: Identify **Entities** and **Attributes**.
  * Then: Identify **Relationships** <small>(and their "`@`")</small>
  * [Entity Relationship Model (ERM)](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model)
  * Think in "[Semantic Triples](https://en.wikipedia.org/wiki/Semantic_triple)":  
    `Subject - Predicate - Object`

<cite>
Example [elgrito.witness.org](https://elgrito.witness.org/portfolio/metadata-entities/)
</cite>

<aside class="notes">
Inspiration for terms, but IMO not useful because the relationships combine
more than 1 thing, therefore their approach is by definition built to lead to
thousands of "terms", which actually describe too much - and cannot be combined
and re-used properly: [rda-registry.info](http://www.rdaregistry.info/)

Good idea to put terms in a version control system - and publish them. Like this:
[RDA registry on Github](https://github.com/RDARegistry/RDA-Vocabularies/tree/master/csv/Elements)
</aside>



# Relationships

![](../../../images/metadata/erm/erm_rel1.png)

  * **Forward**: Agent1 `is parent` of Agent2
  * **Reverse**: Agent2 `is child` of Agent1

<aside class="notes">
How (and if) a MAM handles relationships, their terms, directions - and their
attributes - plays a major role, not only for modelling your data, but
especially for search/retrieval and other future usage of whatever you've put
in there.
</aside>



# Annotating relationships

  * For which time-period was the relationship valid?
    <small>(Agent "married to" Agent)</small>

  * Anything else you'd like to add?

<aside class="notes">
</aside>



# Relationships: @Attributes

> (How well) can a system handle/search relationship-attributes?


# Relationship queries: Examples

> Which Work(s) feature which Agent(s) under the alias of ...?

> List all ... related to a work, in order of their ...?

<aside class="notes">
</aside>


# More than just 1 standard/schema?

![](../../../images/metadata/en15907-entities.png){width=50%}

Great! Now what about the "film-related" materials? 🤨️
<small>(posters, documents, etc)</small>

<!-- IMPORT / EXPORT -->

# Import / Export



# Considerations

  * Lists / CoVocs?
  * Link cataloguing data <small>(DB)</small> &amp; files? <small>(storage)</small>
  * Programming language &amp; skills?
  * Value/term/schema mapping options?
  * Schema valid?

<aside class="notes">
</aside>

# Access &amp; Control

  * [(Web) APIs](https://en.wikipedia.org/wiki/Web_API): Application Programming Interfaces
  * [REST API](https://en.wikipedia.org/wiki/Representational_state_transfer):
  * [OAI-PMH](http://www.openarchives.org/): Protocol for Metadata Harvesting
  * ...


# APIs: Whatfor?

Access &amp; exchange your data...

  * &dots; with other institutions.
  * &dots; by external tools.
  * &dots; for backup/migration.
  * &dots; to use your data differently.
  * etc.


# Remote control

  * Common backend + different UIs.
  * Automate workflows/actions externally.
  * etc.


# (More) Future-proof. 😎️🤓️
<!--
XML XSDs
-->

# Schema Validation
## What are XSDs?

  * [XML Schema Definition](https://en.wikipedia.org/wiki/XML_Schema_(W3C))
  * Defines structure of an XML data layout (=schema).
  * In machine readable form.
  * Used for automated metadata schema validation.


# W3C Example

```
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:html="http://www.w3.org/1999/xhtml"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform
                                http://www.w3.org/1999/XSL/Transform.xsd
                                http://www.w3.org/1999/xhtml
                                http://www.w3.org/1999/xhtml.xsd">
```

<small>
Or see: [EFG (European Film Gateway) XSD](https://efgproject.eu/downloads/efg_3.2.07_fixed.xsd)
</small>
<!--
-->

# Oh, btw: "Says who?"

  * Declare information sources?
  * At which level? <small>(record? field?)</small>
  * Who edited which field when and why?
  * Could a source be "linked"? <small>(as relationship)</small>
  * What if you have &ge; 1 sources?


# Oh, there's a typo...

  * Should we correct it?
  * How do we document that change?
  * Is it even a typo, or was it proper "back then"?
  * Can we keep multiple "versions"?


<!--
Content Annotations.
-->


# Content annotations

In difference to regular descriptive metadata:

  * Image annotations?
  * Time-based annotations?
  * Import/Export/Exchange of content annotations?



# Lack of Standards

  * AV: Simple markerlists (EDLs)?
  * Time offset units:    
    Frame? Audio-sample? Timecode? (nano-)seconds?



# IIIF.io

  * [International Image Interoperability Framework (IIIF)](https://iiif.io/)
  * Zooooooomable images.
  * Content annotation standards!  
    (image regions, text-segments, time-based sequences)
  * For AV, too: [iiif-av (GitHub)](https://github.com/IIIF/iiif-av/issues?page=2&q=is%3Aissue+is%3Aopen)


<!-- Linked Open Data -->

# Access &amp; Exchange: Data Formats

![](../../../images/metadata/lod/5star_deployment_open_data.png)

<aside class="notes">
The options for accessing, exchanging - basically working with your data - play
an increasingly important role in the choice of any catalogue / MAM.


| quality | description |
| -------:| ----------- |
|       ★ | make your stuff available on the Web (whatever format) under an open license  |
|      ★★ | make it available as structured data (e.g., Excel instead of image scan of a table) |
|     ★★★ | make it available in a non-proprietary open format (e.g., CSV instead of Excel) |
|    ★★★★ | use URIs to denote things, so that people can point at your stuff |
|   ★★★★★ | link your data to other data to provide context |

See: https://5stardata.info/en/
</aside>




# Linked (Open) Data

> "linked data (often capitalized as Linked Data) is structured data which is
> interlinked with other data so it becomes more useful through semantic
> queries"

<small>Source: [Linked data (Wikipedia)](https://en.wikipedia.org/wiki/Linked_data)</small>

<aside class="notes">
LoD is still a bit "new", and there are many many many things to be considered,
tested, found out, implemented, improved, etc. Yet, having isolated catalogues
and maintaining all entitites individually, does not seem like a long-term
sustainable approach.

However, many archives are still using conventional "flat" data models, local
CoVocs - and are slowly transitioning towards shared CoVocs and
Entity-Relationship models.

If you are interested in more hands-on practical experience with LoD and interoperability of data, you may want to get in touch with the FIAF cataloging commission, who is very actively charting the new territory of
archives and LoD.

There's a short summary from a
[FIAF LoD Workshop in 2019](https://www.fiafnet.org/pages/E-Resources/LoD-Task-Force-Workshop-2019.html), 
which contains very valuable overviews and insights in a quick read :)
</aside>



# Linked (Open) Data

![](../../../images/metadata/lod/lod_cloud_2014.svg){.plain}




# Does it scale?

<small>

  * Speed? <small>(search, retrieve, data, files, etc)</small>
  * Cache & tuning options?
  * Synchronize multiple instances?
  * Ongoing import/export? <small>(in-house, external)</small>
  * License conditions and impact?
  * Multiple data schemas in parallel?
  * Multi-language support?
  * Migration to a "better scaling" system when needed?

</small>

# Got Plugin Support?

  * Usually a one-size-fits-all is rigid and hard to maintain.
  * Slim core + additional features as plugins.
  * Preferred: Plugin interfaces open &amp; documented.


# Got Support?

  * Whom to call in case of ...?
  * Option to switch/choose "your mechanic"?
  * Which conditions?
  * Support contracts?
  * Which license model?

# Reference between Catalogue and Files

  * How are catalogue entries related to files (and vice-versa)?
  * How (in)dependent of the catalogue can files be used/modified?


# Filename &amp; Folder structure

  * Many DAMs do that automatically
  * In a non-human readable layout (UUIDs)
  * Which level of control do you need over this?
  * Got external workflows accessing the files/data?

# Good practice

  * Get access to a demo installation (local or online).
  * Try to import/export lists/CoVocs.
  * Consider import/export with *your* data (layout).
  * *Before* you make a final choice.
  * Get cataloguers *&amp;* technicians together.
  * Get help from experts with your tool-choice/use-cases.
  * Get support contracts.
<!-- END / CREDITS -->

# The End



# Questions?
## Comments?

Peter Bubestinger-Steindl

`peter @ ArkThis.com`
