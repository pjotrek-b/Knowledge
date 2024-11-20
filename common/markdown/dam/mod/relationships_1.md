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



# Relationship queries?

> (How well) can a system handle/search relationship-details?

* Which Work(s) feature which Agent(s) under the alias of ...?
* List all ... related to a work, in order of their ...?

<aside class="notes">
</aside>

