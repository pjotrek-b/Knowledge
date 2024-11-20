# Physical Carrier Types


# Popular Options

![Classic "Spinning Platters" harddrive](../../../images/storage/media/hdd.png){width=300px .plain}
![LTO: Linear Tape Open cartridge](../../../images/storage/media/data_tape.png){width=280px .plain}
![Optical Disks](../../../images/storage/media/optical_disks.png){width=280px .plain}
![SSD: Solid State Disk (no cover)](../../../images/storage/media/ssd_naked.png){width=300px .plain}
![SD cards](../../../images/storage/media/MMC-SD-miniSD-microSD-Color-Numbers-Names.gif){width=120px .plain}

<aside class="notes">
Different carrier media have different properties when it comes to error
resilience, longevity - and of course: price.

  * Magnetic: Susceptible to electro-magnetic issues.
  * Optical: light, temperature, warping
  * Electronics: Failing capacitors
  * Mechanics: Wear and tear
  * Supported/obsolete interfaces or drives?

**It's usually good to mix storage media to distribute their pros/cons properties.**

I won't go into great detail here, as this is possibly covered in many other
preservation-storage presentations.




In greater detail:


**Optical Disks**

Pros:

  * Cost/size ratio: Relatively cheap (cheapest still?)
  * Not susceptible to electro magnetic (dis)charge
  * No mechanics/electronics in carrier - only in the drive

Cons:

  * Error prone
  * Suffers easily from material degradation
    (scratches, data layer falling off, light exposure, temperature, etc...)
  * Becoming less and less common = less support, less choice, etc.


**HDD: Hard Disk Drive**

Pros:

  * Reasonable cost/size ratio
  * (yet) cheaper than SSD
  * well known, well supported

Cons:

  * Mechanical wear (moving parts)
  * Susceptible to electro magnetic discharge
  * Electronics on carrier


**Data Tape**

Pros:

  * Cost/size ratio: Tape cartridge "cheaper" than HDD
  * Tape preserves well (and there is much experience with dealing with tape degradation/aging from analogue)
  * Supported in "tape libraries" (aka "tape robots") for removing "tape-jockey" limitations.
  * Larger capacity per cartridge than per HDD (yet)

Cons:

  * Not common outside certain domains (large institutions, broadcast preservation, ...)
  * Therefore support for tapes very "specialized"
  * Drives quite expensive (>3000 EUR)
  

**Flash Memory**

Pros:

  * cost/size ratio: getting cheaper, but still more expensive than HDD
  * No moving parts = no mechanical wear
  * SD cards: almost no electronics in the carrier
  * Speed: SD cards are not sooo fast, whereas SSDs 
    (or [M.2](https://en.wikipedia.org/wiki/M.2)) are extremely fast (compared to HDD).

Cons:

  * Currently most expensive (still)
  * Lack of long-term experience
  * Limited number of write/erase cycles per flash block (becoming less of an
    issue) =Should not be used for large number of write operations. But
    preservation storage case is mostly "read".

More about [Flash memory on Wikipedia](https://en.wikipedia.org/wiki/Flash_memory).
[SD card image by Steve Meirowsky (Wikipedia) - Own work, CC BY-SA 3.0](https://commons.wikimedia.org/w/index.php?curid=23928412)
</aside>



# Popular Use Cases

| Production | Backup | Access |
| ---------- | ------ | ------ |
| ![](../../../images/storage/media/hdd.png){width=200px} | ![](../../../images/storage/media/data_tape.png){width=280px} | ![](../../../images/storage/media/optical_disks.png){width=280px} |

<aside class="notes">
Examples for different use cases:

  * preservation / backup:  
    tape (affordable size, good preservation properties, less need for
    super-fast access)

  * access:
    No need for long-term endurance, so e.g. optical would be sufficient.

  * production:
    HDD-based storage for nearline files - tape for offline storage.
    Or: tape-robot with HDD cache (same concept, but fully automated)


More properties:

  * Data Access Speed?  
    SSD &gt; HDD &gt; Tape &gt; Optical

  * Cost/size ratio?  
    SSD &gt; HDD &gt; Tape &gt; Optical

  * Widespread?  
    * SSD, HDD: Excellent!
    * Tape: almost exclusive professional use case
      Drives not that "easy" to get (for particular LTO generation)
    * Optical: Declining (except for "cold storage" in large data centers)
</aside>


# HDD vs SSD

![SSDs: less stuff to break](../../..//images/storage/media/hdd_vs_ssd_bz.png){width=80%}

<aside class="notes">
**HDD:**

  * (yet still) cheaper cost-per-data ratio
  * moving parts = mechanical wear out
  * btw: Spinning up is most stressful for the disk.
    Avoid unnecessary up/down cycles.
  * Lots of electronics...
  * Faster than tape, slower than SSD

**SSD:**

  * Super fast!
  * (yet still) more expensive than HDDs (equal size)
  * NO moving parts: good!
  * Lots of electronics though...
  * Limited number of writes, but:
  * Not as relevant for content that is written once, then stays (=archival use case)
</aside>



# Good to know:

  * Higher data density = more impact of an error.  
    <small>(Example: 1mm hole in CD vs DVD vs BluRay)</small>
  * HDD: The longer it is active, the shorter is lives.
  * Anything moving can break.
  * But: "*Hardware that lies, dies.*"
  * Be aware if your HDD is "[Shingled (SMR)](https://en.wikipedia.org/wiki/Shingled_magnetic_recording)" or not.
  * <span class="fragment highlight-green">Mixing carrier/storage types: good idea!</span>

<aside class="notes">
**Density:**

  * Think of a 1mm hole on an optical carrier: CD vs DVD vs BluRay
  * All 3 have the same dimension, but different data density.
  * When choosing a carrier:
    Do you really need it to be as small/dense as possible?

**Hardware that lies, dies:**

**Got external HDDs stored on shelves?**  
You may want to power them up every once in a while (every 1-2 years or so),
and copy the data off them before the hardware gets old.
Because: Electronics fail (capacitors), lubricants harden out or movable parts
get "lazy" or stuck.

Das Werkstatt Rule #2 (German): "Hardware die liegt, stirbt"
[Useful "Das Werkstatt" principles](http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=15&t=241)


**Shingled HDD:**

> "The more time a shingled disk spends in band compaction, 
> the more it is wasting resources."

<cite>
Source: [Classifying Data to Reduce Long-Term Data Movement in Shingled Write Disks](https://dl.acm.org/doi/pdf/10.1145/2851505?download=true)
</cite>

This means: SMR disks are active when idle, causing them to potentially wear out faster.
</aside>



