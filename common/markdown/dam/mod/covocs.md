<!-- 
Controlled vocabularies and lists
-->

# Controlled Vocabularies

> "Controlled vocabulary schemes mandate the use of predefined, authorised
> terms that have been preselected by the designers of the schemes, in contrast
> to natural language vocabularies, which have no such restriction."

<small>Source: ["Controlled Vocabulary" (Wikipedia)"](https://en.wikipedia.org/wiki/Controlled_vocabulary)</small>


# Why CoVocs / Taxonomies?

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
  * Standard terms? <small>(e.g. ISO mapping for Language, Country, Region, Tech-Terms, etc.)</small>
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



