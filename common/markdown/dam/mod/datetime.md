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


