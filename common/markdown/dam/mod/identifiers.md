<!--
-->

# Shared Identifiers

> If you're not the only one referring to ...
>
> Wouldn't it make sense to have a common,
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
