
# Got "Fuzzy" Dates...?

  * 1910-01?
  * circa 1800?
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


# Partially Approximately Uncertain?

  * "**?**": Uncertain
  * "**~**": Approximate (circa)
  * "**%**": Both uncertain &amp; approximate
  * "**X**": Unspecified.

> 1981-01?, 20XX, 197X-11?-XX
> <small> ([https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf](https://www.loc.gov/standards/datetime/iso-tc154-wg5_n0039_iso_wd_8601-2_2016-02-16.pdf)) </small>

