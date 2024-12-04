---
title: Archival Storage
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
institute: ArkThis AV-RD
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

transition: none
slideNumber: true
defaultTiming: 6
;print-pdf: ?print-pdf&showNotes=separate-page

title-slide-attributes:
  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
  data-background-size: cover
;data-background-position: 4% 90%

background-image: "../../../images/_themes/ina/2022_frame/page.png"
background-image-size: cover
---
<!--
# Abstract

Storing digital assets is nothing new.

Yet, just "storing files on some carrier" doesn't seem to be enough when the
requirement is "as long and proper as possible".

When it comes to managing vast amount of material with ever-growing data sizes
on ever-changing technologies and expectations, it's good to know at least a
little bit about which properties to base decisions on.

Harddisk vs LTO vs SSD vs BluRay?  Which role does a DAM/MAM play, and what to
look out for?  What if conditions change, or disaster strikes?  How to balance
features and budget?

This session will be an interesting voyage through the important components of
storing and managing digital AV material - even for non IT staff.
-->


# So you need space? 😉️

![](../../../images/storage/indiana_jones_warehouse2.jpg){.r-stretch}



# Oh: Empty space. I get it.

![](../../../images/storage/empty-space.jpg){.r-stretch}

<aside class="notes">
Really, "just space"?

Digital archival storage is more than "just large diskspace".
</aside>


# Archival Storage
## More than "just space":

  * Physical carrier
  * Structure / Order
  * Access control
  * Monitoring
  * Stock keeping
  * Scalability
  * Routine automation
  * ...

<aside class="notes">
</aside>



# And never forget:
## Backup &amp; Migration!

![](../../../images/storage/hardware/storinator.png){width=40%}
![](../../../images/storage/hardware/backblaze.png ){width=40%}



# Physical carrier

![](../../../images/storage/hardware/backblaze.png){width=40% style="float:right"}

  * How much space?
  * How fast?
  * Which use case(s)?
  * How expensive?
  * <span class="fragment">Which level of long-term?</span>



# Structure / Order

![](../../../images/storage/storage_rack.png){width=20% style="float:left"}
![](../../../images/storage/labels.png){width=20% style="float:left"}

  * Folder structure?
  * File naming (conventions)?
  * (Unique) Identifiers?



# Access control

![](../../../images/storage/access_rights.png){width=30% style="float:right"}

  * User accounts?
  * Access rights management?
  * Legal issues? <small>(secrecy, copyright, etc)</small>
  * Which use cases?
  * Accidential human errors?



# Monitoring

![](../../../images/storage/sensorgraph.png){width=30% style="float:right"}

  * Hardware okay?
  * Data growth within expectation?
  * Temperature / humidity?
  * Access logs?
  * Data intact? <span class="fragment">(⬅️  =Stock keeping)</span>



# Stock keeping

![](../../../images/storage/staubwedel.png){width=30% style="float:right"}

  * Fixity checks?
  * Integrity checks?
  * Got hashcodes?
  * Got (run)time?

<aside class="notes">
Do not underestimate the pure runtime of any digital integrity checks.

This is the time to:

  1. Access the data (eg load tape)
  2. Read the data as-is
  3. Calculate hashcodes

</aside>



# Scalability

![](../../../images/storage/construction_plan.png){width=30% style="float:right"}

  * Got a plan?
  * Copy everything? 😒️
  * Combining mixed technologies? 💕️
  * Costs?
  * ...



# Routine automation

![](../../../images/misc/dltp_automation.jpg){width=30% style="float:right"}

  * Which workflows access your data?
  * Automated transcoding?
  * Virus checks?
  * Indexing: Finding your stuff?
  * ...


# Before you buy...

  * Does it scale?
  * Cross vendor compatibility?
  * Access your data without vendor support?
  * Open standards? Documentation? Spare parts?
  * Got community?



# Same interests?

  * Storage market focus may deviate from your use case <small>(=preservation)</small>
  * Business "longterm": 3-5 years <small>(=product lifecycle)</small>
  * Market focus affects prices, features and reusability.
  * **Who owns your storage = owns your work.**


<aside class="notes">
  * Business focus is usually on high availability, speed and least downtime
    = fast replacement, not necessarily compatibility or long lasting components.

  * Spare parts:
    Professional hardware is good, but:
    Often incompatible with standard components, due to proprietary plugs,
    pinouts, form-factor, etc.

    I've seen cases where whole rack-mounted hardware servers/JBODs had to be
    replaced because it was not possible to get spare power supply units (PSUs) or
    even ventilation fans for this proprietary layout.

    If you can, get good quality hardware with vendor-neutral replacement
    possibilities. Available beyond 3-5 years after purchase.


And if you like it or not:
Who controls your storage, or may decide what/if/how/when - owns control
over your work.
</aside>

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



# LTO Data Tapes
## (LTO: Linear Tape Open)



# Tape &amp; Drives

![LTO tape with a drive](../../../images/storage/hardware/lto_tape_drive2.png){width=40% style="float:left"}

  * Got both?
  * Got drivers?
  * Got cables?
  * Got tape software?

<aside class="notes">
There's more to say on drive+media storage, but I'll focus on LTO tapes here,
since they become more "important".

What may seem obvious is, that even if a tape may last a very very long time:
Without a proper drive, you're pretty much lost.
you also need the infrastructure (hardware + drivers) which can operate the
drive properly and the software stack to interpret the filesystem, etc on the
tape itself.

With LTO-tapes, you also need to consider which "LTO Generation" (LTO-4, LTO-5,
... LTO-9, etc) drive and tape are, since not all LTO drives may read all LTO
tapes.
</aside>



# LTO Generations

Imagine you find an old LTO tape...

  * Not every drive can read every tape.
  * New LTO generation release: ~every 2-3 years.
  * &lt; LTO-7: Read=2 gen. / Write=1 gen.
  * BUT: LTO-8: Read/write=**1 gen.**!

<span class="fragment">
Oh, and: Which **filesystem** was it written with...?
</span>

<aside class="notes">
LTO improvements include new LTO generations: Higher data density at same form
factor.  This allows the mechanics (of drives and robots) to stay compatible,
with only requiring certain parts to be updated to support a new generation.

The LTO consortium guarantees a certain level of downwards compatibility.
This used to be:

  * Read: 2 generations down
  * Write: 1 generation down

Example: LTO-6 drive should be able to read LTO 6,5,4 - but write only 6 and 5.

With LTO-8, this was reduced to 1 generation backwards compatibility, so an
LTO-8 drive can *not* read LTO-6, only back to LTO-7

New LTO generation release: About every 2-3 years.
This must be considered for migration!

This also means that you might want to keep a few drives of different
generations in your house?
</aside>



# Layers.



# Digital Storage is an Onion

![](../../../images/misc/ogres_layers.png){width=40% style="float:left"}

<small>

  1. **A Digital File**
  2. File format support
  3. Application required to read/write data
  4. Filesystem
  5. Operating System (OS)
  6. OS hardware driver
  7. Hardware it runs on <small>(Drive? Controller?)</small>
  8. **Physical carrier (medium)**

</small>

<aside class="notes">
When considering a storage for long-term preservation, at least the following
layers/components should be considered:

  * Application required to read/write data
  * Operating system
  * Hardware it runs on
  * Filesystem
  * Drive (e.g. for tapes, optical media)
  * Physical carrier (medium)

On top of that (but independent of the storage type chosen) are additional
layers of the file itself:

  * container format
  * video format
  * audio format
  * metadata format
  * ...

Similar principles for selecting a file format apply to selecting a long-term
storage solution.
</aside>




<!-- 
=========================================
  STORAGE: File system
=========================================
-->

# The File System

![A drive partition viewed as raw data](../../../images/storage/filesystem/hexedit-partition.png)

<aside class="notes">
That image shows a disk drive partition as quasi-uninterpreted raw data.
This is what your folders and files would look like without a "file system."

Ever encountered an "unreadable" storage medium? (SD card, USB stick, HDD,
etc?) In most cases the reason were broken bits in its Filesystem.
The data is often still where it was.

Without the ability to read/understand the file-system of any digital
storage, your data may be perfectly intact, but it's inaccessible: It's just
a long string of numbers.  Their structure unknown. Where does a file
begin/end? Are there folders? Filenames?

Your software stack needs to handle the file-system which is used to access
your data *at all*.

I call this "bit-or-byte pulp".
</aside>



# Hierarchical File-Systems

  * Folder structure
  * File- and folder-names
  * Timestamps
  * Access rights
  * ...

<aside class="notes">
A [File system (FS)](https://en.wikipedia.org/wiki/File_system) is what forms
raw data into a file/folder structure

  * Storage without FS = Byte pulp.
    Like pages of a phone book torn apart, page numbers and index removed -
    then shuffled.

  * Filesystem = A data format
    Therefore, the same requirements for preservability/accessability apply:
    * Is it documented?
    * Who can read it?
    * Under which terms and conditions?

  * Different FS = different formats
</aside>



# Popular File Systems

  * [FAT{16,32}](https://en.wikipedia.org/wiki/File_Allocation_Table) <small>(Microsoft - 1977/1996)</small>
  * [NTFS](https://en.wikipedia.org/wiki/NTFS) <small>(Microsoft - 1993)</small>
  * [EXT{2,3,4}](https://en.wikipedia.org/wiki/Extended_file_system) <small>(Linux - 1993+)</small>
  * [ZFS](https://en.wikipedia.org/wiki/ZFS) <small>(Sun - 2005)</small>
  * [HFS,HFS+](https://en.wikipedia.org/wiki/HFS_Plus) <small>(Apple - 1985/1998)</small>
  * [LTFS](https://en.wikipedia.org/wiki/Extended_file_system) <small>(IBM - 2008)</small>
  * [exFAT](https://en.wikipedia.org/wiki/ExFAT) <small>(Microsoft - 2006)</small>

Yes, there's [more!](https://en.wikipedia.org/wiki/Comparison_of_file_systems)

<aside class="notes">
**FAT:**

  * FAT introduced in 1977.
  * Widespread, well-known and documented
  * Default for SD cards and embedded devices
  * FAT32: 32bit limitation
    (max 4GB filesize, limited max. device size)
  * No access permissions (=everyone can read/write everything)
  * Very simple and straightforward filesystem
  * Non-free / license fees by Microsoft.

**NTFS:**

  * Introduced in 1993.
  * max volume size (different implementations):
    256 TiB (pre 2016), now 8 PiB (2019 or later)
  * Non-free / license fees by Microsoft.

**EXT:**

  * ext2 introduced in 1993.
  * ext4 standard for Linux-based OS.
  * ext4 and NTFS supported by digital cinema standard.
    (Because the projectors probably run Linux ;))
  * max volume size: 1 EiB (1024 PiB)
  * No licensing fees

**ZFS:**

  * Introduced in 2005
  * More than "just a filesystem":
   combines RAID (redundancy, handle harddisk failure)
   [Logical Volume Management (LVM)](https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux))
   and filesystem in one.
  * Integrated integrity checks
  * (recently) well known among IT administrators of unixoid systems.
  * Requires slightly more experience to handle (because of complexity.
  * Very interesting filesystem (also for preservation).
    Too much to describe here. You may want to read more on Wikipedia :)

**HFS+:**

  * HFS Introduced in 1985.
  * HFS+ introduced in 1998.
  * max volume size: 8 EB
  * Successor of "[HFS](https://en.wikipedia.org/wiki/Hierarchical_File_System)"
  * Officially only supported on Apple OS

**LTFS:**

  * LTFS first prototype (Linux and Mac OS X) during 2008/2009.
  * Only for LTO tapes.
  * See separate page/slide on LTFS for details.

**exFAT:**

  * Introduced by Microsoft in 2006.
  * Optimized for flash memory (such as USB flash drives and SD cards).
  * was proprietary until 28 August 2019, when Microsoft published its specification.
  * Microsoft owns patents on several elements of its design.
</aside>



# LTFS: Linear Tape File System

  * Open specification = vendor neutral
  * Better for preservation, but may not support "convenience" features.
  * All implementations must:
    * Correctly read media that was compliant with any prior version.
    * Write media that is compliant with the version they claim compliance with.

<aside class="notes">
The [Linear Tape File System (LTFS)](https://en.wikipedia.org/wiki/LTFS) is a
good solution to avoid vendor lock-in by tape filesystems. Please make sure
that you can read the data written onto the tapes under the following
conditions:

  * Different drive
  * From different vendor
  * With (FOSS) software (and/or from different vendor)

Otherwise, you won't really know if you can access your data as technology- and
vendor-neutral as desired.

By default, different applications may write data in their own way on LTO
tapes. This allows them to implement some non-standard features that often
provide more "convenience" by offering additional features. Using such
vendor-specific features, instead of LTFS has the downside of reducing the
possibilites to read that data under different conditions in the future.

Therefore it is advised to use LTFS for long term preservation use cases.
</aside>



# File system: Disaster relevant?

  * Deleted files are still there. <small>(maybe fragmented)</small>
  * Different FS = different error resilience and recovery options.
  * Does it scale?
    <small> (moving files is when they're most vulnerable...) </small>
  * Tools/KnowHow to deal with recovery of broken filesystems in your setups?
  * [Logical Volume Management (LVM)](https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)) snapshots

<aside class="notes">
  * Deleted files:
    Deleting files is just flagging them in the index and their disk space is
    marked as available again. The data is still where it was - until a new write
    operation (=creating new data) uses the same space and overwrites the old data.

    Related articles:
    * [Get Your Data Back with Linux-Based Data Recovery Tools](https://www.linux.com/training-tutorials/get-your-data-back-linux-based-data-recovery-tools/)
    * [How to Install and Use TestDisk Data Recovery Tool in Linux]((https://www.tecmint.com/install-testdisk-data-recovery-tool-in-linux/)
    * [Scalpel: Extract lost files from disk/card image](http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=24&t=2326)

  * Different FS have different error resilience and recovery options:
    Go ask your IT guys!
    ZFS is pretty awesome, but "simple and well known" is also nice for recovery.

  * FS recovery requires understanding the FS format.
    Got documentation? Source code?

  * Logical Volume Management (LVM)
    Remember VM-snapshots?
    You can do the same on storage level (below filesystem):
    [LVM Snapshots](https://en.wikipedia.org/wiki/Snapshot_(computer_storage))
        
  * Does it scale?
    * Total number of files/folders?
    * Length of path?
    * Suitable for NAS/SAN/cluster?
    * [FS vs Blocks vs Object-based?](https://www.networkcomputing.com/data-centers/storage-comparison-object-vs-file-vs-block-storage)
</aside>


# Object storage

Beyond classical, hierarchical filesystems



# Object storage

![](../../../images/storage/types/objectStorageOracle.jpg){width=90%}



# Object storage

  * Files become "objects".
  * There are no (actual) folders. <small>(Foldername = Plain Metadata)</small>
  * There's just an identifier.
  * Arbitrary metadata may be assigned to each "object".
  * Scales infinitely <small>(theoretically)</small>
  * Clusters of block storages with clever abstraction layers.
  * Quite a complex construct of APIs, layers and components. Fascinating.

<aside class="notes">
You may have been using object based storage on Google Drive or Amazon S3.

Pretty cool, but it handles very differently from any regular file/folder based
storage!  Please do your homework before deploying this.

It is still pretty new and if done wrong, it can cause more troubles/effort
than a regular, hierarchical FS storage.

What is often left out by marketing:

  * Underneith, it is still using block storage.

  * Just with clever abstraction layer(s).

  * Important: Your toolchain needs to be object-storage-aware!  Regular,
  well-known tools cannot easily access object files as it used to be.

  * I mention it here, because if done right, it scales.

I'm pretty sure, this is the future - and (at least large scale) storage will
be going from classical (filesystem-based) to this (=object based) way.
</aside>



# Object Storage = The Future?

![](../../../images/misc/doc_brown_painting.jpg){width=20% style="float:right"}

Object based storage may very likely replace hierarchical filesystems
<small>(but things need to be rewritten/adapted to properly support it.</small>

**It's not yet (really) plug-compatible with existing programs.**


# Filesystem = MAM?

  * An annotated filesystem **is an actual catalogue**
  * If implemented well, the storage itself may be a future DAM/MAM.
    (key/value metadata in the filesystem)
  * Links/relationships between objects = 🤯🤠🥳
  * Combined with LoD, MD Standards & APIs = Wikidata for your files.
  * No more distance between file and its catalogue entry.

This is still R&D, but maybe...

<aside class="notes">
There is great potential in using the filesystem as a catalogue.

2 features are important:
  * The ability to store key/value /with/ an object (xattrs)
  * The ability to address by ID (rather than filename/path)

OBS are already in production usage for a few years by major (online cloud)
storage service providers. Yet, the "catalogue" world, including the WWW are
still mostly running and "thinking" in hierarchical filesystems. DAMs and MAMs
are currently a middleware layer for trying to link files and "other stuff
related to them" in a way that solely serves: Search and Retrieval.

A basic condition for this to work well is that it is implemented using open
and interoperable standards.

Then, any metadata, any relationship - and additional description or history
that would be assigned to a data-file over its lifecycle would simply
accumulate as part of its object-record.
On filesystem-level.

The default file manager would function as a very basic asset-management system.
It already does so, but in a crude, not-so-interoperable way. And the metadata fields available are currently very file-format related, since often stored inside the file itself.

If moving the paradigm from "metadata in a file", plus the "rest in a separate,
decoupled database" to a "no metadata inside the file, since the file is now an
object, and that object can have certain basic metadata fields by its new
"nature":

  1. objects can be file-data or metadata-only.
  2. +keywords / tags
  3. +key = value pairs (as much as your hardware can handle)
  4. +relationships between objects (as many as your hardware can handle)
  5. relationships are themselves just regular "objects"

This is still ongoing R&D.
</aside>

<!-- 
=========================================
  CLOUD STORAGE
=========================================
-->

# Cloud Storage

![](../../../images/storage/cloud/nocloud.png){width=60%}



# Cloud Storage

![](../../../images/storage/cloud/nocloud.png){width=40% style="float:right"}

<small> 

  * No internet = No service.

  * Make sure your online bandwidth is sufficient.

  * Have an exit plan for migration <sup>(+contract?)</sup>

  * What if their conditions change?

  * Where is your data actually stored?

  * Does it matter for you? <sup>(e.g. legally)</sup>

  * <span class="fragment">Again: Consider mixing.</span>

</small>

<aside class="notes">
The term "Cloud" in computing came from marketing, and describes nothing else
than digital services that already existed for over 20 years - but now had a
nicer GUI and focus on convenient usability.

There's "[cloud storage](https://en.wikipedia.org/wiki/Cloud_storage)" (e.g. Owncloud/Nextcloud, Dropbox, etc)
and "[cloud computing/services](https://en.wikipedia.org/wiki/Cloud_computing)" (GDocs, etc).

In this context we will only deal with "cloud storage".


Storing data in large data centers is very convenient. All the same challenges
regarding large-scale storage still apply, but they're someone else's problem
now :)

What's still relevant for you though is:

  * What happens if the provider changes their conditions?
  * What happens in case of unstable political situations, war, etc?
  * What if you want to migrate your stuff to another storage/provider?
  * Does it matter (e.g. legally) if the provider could access your data?
</aside>



<!--
  EXERCISE
-->

# Storage Debate! 

<aside class="notes">
Make 2 groups:

  * One group for "all in-house"
  * One group for "all external"
  * Think of "pros" why your scenario is a good choice.
  * Afterwards we'll get back and debate.
</aside>



# Storage Debate: Summary?

  * Online/Cloud: For "smaller" files
    <small>(eg Access copies, documents)</small>
  * Decide which level of control you *want* to have over your data.
  * Large storage: You may want/need to get external support.
  * Mixing (again) is a good idea.
  * **Should we archives outsource all knowhow/skills about digital storage?**
<!-- 
=========================================
  FAILSAFE MECHANISMS
=========================================
-->

# Failsafe Mechanisms

![Just to be sure.](../../../images/fixity/bubble-wrapped-person.jpg)

<aside class="notes">
Of course: If nothing goes wrong, there's nothing gained from the extra effort
of implementing any failsafe mechanisms.

It's like riding a motorbike on a sunny day, with short trousers, sandals, no
gloves and no helmet. Wonderful to enjoy!
If nothing goes wrong...

It's still great to ride a motorbike, but a few things may make a huuuuge
difference in case "something" does happen. :)
</aside>



# S.M.A.R.T.
## Self-Monitoring, Analysis and Reporting Technology

<small>

> "[...] monitoring system included in computer HDDs, SSDs and eMMC drives.
> Its primary function is to detect and report various indicators of drive
> reliability with the intent of anticipating imminent hardware failures."
> <cite>-- [Wikipedia: S.M.A.R.T.](https://en.wikipedia.org/wiki/S.M.A.R.T.) </cite>

</small>

<aside class="notes">
  * Part of the ATA standard since around 2004.
  * All HDDs these days usually support SMART.
  * Different vendors/drives return different readings.
  * "The meaning and handling of the raw value is a secret of the vendors
    embedded S.M.A.R.T.-Software on the disk."
  * It makes sense to monitor these values and alert if values deviate from a
    certain threshold.
</aside>



# SMART Graph

![SMART graph for a single drive](../../../images/storage/errors/smart_sdg-week.png)

<aside class="notes">
  * SMART values can be collected over time and drawn as graph.
    This allows to literally "see" if some reading is "going down".

  * Generated using [Munin](http://munin-monitoring.org/), which uses the
    great [RRDTool](https://oss.oetiker.ch/rrdtool/) to generate graphs.
</aside>



# R.A.I.D.

<small> 
Redundant Array of Inexpensive Disks  
![Example of a disk chassis](../../../images/storage/hardware/SA2U-24.jpg){width=50%}

> "[...] is a data storage virtualization technology that combines multiple
> physical disk drive components into one or more logical units for the
> purposes of data redundancy, performance improvement, or both."
> <cite>-- [Wikipedia: RAID](https://en.wikipedia.org/wiki/RAID)</cite>

</small>


<aside class="notes">
  * Good 'old' friend: exists since before 1988
  * Here you see a classical hardware RAID chassis.
  * This is just one option.
</aside>



# RAID

  * Different [RAID levels](https://en.wikipedia.org/wiki/RAID#Standard_levels):
    * 0: Stripe = Fast, but dangerous!
    * 1: Mirror = Perfect for OS system disks
    * 10: Stripe+Mirror
    * RAID 5/6 = 1 or 2 disks fault tolerance
      <small>([parity bits](https://en.wikipedia.org/wiki/Parity_bit))</small>
  * **RAID is *not* a backup.**


<aside class="notes">
Data replication is not a Backup:
It is not unusual to discover an undesired modification or error only later on.

  * Sync:
    + File changes (new, modification) are immediately replicated
    - Unwanted actions, too! (wrong modification or deletion)
  * Async:
    + Allows you to go back in time.
    + Allows multiple copies/revisions of the same data.
    - "Long" time between new/modification and the copy.
</aside>



# Sad, but true:

  * With larger density-per-disk (20 TB+), **RAID-6 is getting thin**...
  * Long rebuild times may "burn out" the left-over disks.
  * ZFS supports 3 disks parity, but ... future?

<span class="fragment">
btw: How does "The Cloud" do it?
</span>


<aside class="notes">
The algorithm RAID-6 uses to provide data redundancy for rebuilding in case of
harddisks failing, may have come to an end with HDD capacities beyond about 4TB
per-disk.

The reason for that is, that in case of a disk failure, the RAID mechanism
reads the parity data from all remaining disks to reconstruct the one that "has
gone". With larger disks, the time for this rebuild to happen is getting
longer. During that period, all remaining disks are constantly "stressed" until
the required data has been read and the new disk rewritten.

Considering that disk failures more likely occur in RAID arrays that have been
running for quite some time, it can be assumed that the other disks may be
stressed too hard during that rebuild, causing other disks to fail *due* to the
recovery - resulting in a complete data loss.
</aside>



# Cluster &amp; replication

![](../../../images/storage/cloud/backblaze-cloud-storage-datacenter-photo.jpg){width=50% style="float:right"}

<small>

  * Multiple copies on multiple servers  
    ("cluster nodes")

  * Synchronized (replicated) automatically

  * Off-site replication possible

  * Replication is *not* a backup!

  * What if a node goes down?

</small>


<aside class="notes">
Where RAID provides failover redundancy for individual storage devices, a
storage cluster may provide failover redundancy by means of whole PCs.

Each PC is called a "node" and is designed as a component that may fail, while
the rest of the cluster can maintain their services. This is how cloud
storage/service providers provide transparent failover setups.


**Replication is not a backup.**

Replication mechanisms try to keep all their data in-sync as quickly and
seamlessly as possible. This means that if you delete a file, it is usually not
known by any replicating system if that was on purpose on in error.

Therefore, the replication mechanism happily will synchronize this change (=the
deletion) to all of its nodes. Voila.

You get it, why this would be a bad backup option? ;)
</aside>



# So what if cluster nodes fail?

  * Another node takes over.
  * Seamlessly. Transparently.
  * The faulty node is removed &amp; replaced.
  * Life continues.
  * Thanks to math-magic!


<aside class="notes">
In case a node fails, another node jumps in to take over its job(s). The failing
node is replaced in due time. Comparable to RAID setups, but on another
abstraction layer.

Of course they need some kind of "magic" (=algorithms, data protocols,
mechanisms, applications, etc) to do so.

There are many different cluster operating systems and applications, some of
</aside>



<aside class="notes">
</aside>



# Erasure Coding

  * More parity possible than RAID
  * Data can be spread across network cluster nodes.
  * Does not suffer from rebuild "burn out".
  * More complex to set up &amp; compute.
  * Not that widely known/supported/used yet.
  * A FOSS implementation: [MinIO](https://min.io/)


<aside class="notes">

> "protects data from multiple drives failure, unlike RAID or replication. For
> example, RAID6 can protect against two drive failure whereas in MinIO erasure
> code you can lose as many as half of drives and still the data remains safe."

<cite>
Source: [MinIO Erasure Code Quickstart Guide](https://docs.min.io/docs/minio-erasure-code-quickstart-guide)
</cite>

> "Compared to data replication, erasure-coding approaches have better
> performance at reducing storage redundancy and data recovery bandwidth."

<cite>
Source: [Reliability Assurance of Big Data in the Cloud (2015)](https://www.sciencedirect.com/book/9780128025727/reliability-assurance-of-big-data-in-the-cloud)
</cite>


Erasure coding is a different (algorithmic) approach to provide data redundancy
to counteract device/node failures.

Quote from [the Minio website](https://docs.min.io/docs/minio-erasure-code-quickstart-guide):

"Erasure code is a mathematical algorithm to reconstruct missing or corrupted
data. MinIO uses Reed-Solomon code to shard objects into variable data and
parity blocks. For example, in a 12 drive setup, an object can be sharded to a
variable number of data and parity blocks across all the drives - ranging from
six data and six parity blocks to ten data and two parity blocks.

By default, MinIO shards the objects across N/2 data and N/2 parity drives.
Though, you can use storage classes to use a custom configuration. We recommend
N/2 data and parity blocks, as it ensures the best protection from drive
failures.

In 12 drive example above, with MinIO server running in the default
configuration, you can lose any of the six drives and still reconstruct the data
reliably from the remaining drives."


More math at: [Wikipedia: Erasure Code](https://en.wikipedia.org/wiki/Erasure_code)

**Quote from Wikipedia:**

"Example: In RS (10, 4) code, which is used in Facebook for their HDFS,[4] 10 MB
of user data is divided into ten 1MB blocks. Then, four additional 1 MB parity
blocks are created to provide redundancy. This can tolerate up to 4 concurrent
failures. The storage overhead here is 14/10 = 1.4X.

In the case of a fully replicated system, the 10 MB of user data will have to be
replicated 4 times to tolerate up to 4 concurrent failures. The storage overhead
in that case will be 50/10 = 5X.

This gives an idea of the lower storage overhead of erasure-coded storage
compared to full replication and thus the attraction in today's storage systems."

Links: 

  * [MinIO: Storage usage](https://github.com/minio/minio/tree/master/docs/erasure/storage-class#storage-usage)
  * [MinIO: Erasure Code Quickstart Guide](https://docs.min.io/docs/minio-erasure-code-quickstart-guide)
  * [Erasure coding vs RAID: Data protection in the cloud era (ComputerWeekly)](https://www.computerweekly.com/feature/Erasure-coding-vs-RAID-Data-protection-in-the-cloud-era)
  * [RAID Vs. Erasure Coding (NetworkComputing)](https://www.networkcomputing.com/data-centers/raid-vs-erasure-coding)
  * [What is erasure coding? (VirtuService)](http://virtuservice.com/what-is-erasure-coding/)
  * [Isilion.com: Erasure Coding (Isilon)](http://doc.isilon.com/ECS/2.2/PlanningGuide/vipr_c_commodity_data_protection_erasure_coding.html)
  * [Erasure Coding vs. RAID: Which Is Right and When? (ITProToday)](https://www.itprotoday.com/storage/erasure-coding-vs-raid-which-right-and-when)
  * [Wikipedia: Erasure code](https://en.wikipedia.org/wiki/Erasure_code)
</aside>



<!-- 
=========================================
  INTEGRITY CHECKS
=========================================
-->


# Data Integrity?

![](../../../images/team_dp/digiman-bitrot.png){width=90%}



# Fixity information & Hashcodes

> **Hashcodes:**  
> A fixed size number that's like a fingerprint for data.



# Hashcode Algorithms

 * CRC =  
   <small style="font-family:courier">4294967295</small>
 * **MD5** =  
   <small style="font-family:courier">d41d8cd98f00b204e9800998ecf8427e</small>
 * SHA256 =  
   <small style="font-family:courier">e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855</small>
 * **xxHash** =  
   <small style="font-family:courier">e4c191d091bd8853</small>

<aside class="notes">

[Hashcodes](https://simplicable.com/new/hashcode) are fixed-length numbers that
are generated in a way that if even a single bit in the source data changes,
that number will be completely different.
They are often written in [hexadecimal](https://en.wikipedia.org/wiki/Hexadecimal),
therefore including the characters 0-9 and A-F.

If you have a hashcode for a set of data, it can be used to verify the
bit-exact integrity of that data, by calculating the same-algorithm hashcode
again and comparing them. If they're identical, the data is intact.
If two distinct sets of data have the same hash, it's called a
"[hash collision](https://en.wikipedia.org/wiki/Collision_(computer_science)).
Hash algorithms are designed particularily to keep the chance for collision as
low as possible.

Anyways: hashcodes are *a must* for safe data transfer and integrity checks.

Different hashcodes algorithms/implementations may have significantly different
runtimes.  When dealing with large quantities of data, this may matter.

MD5 is the most popular one around:
Well known and widely supported by different applications/systems, etc.

Anyone transferring lots of uncompressed film?
You may want to look at [xxHash](www.xxhash.com). It's designed for speed.

In case someone has heard that [MD5 is broken](https://www.avira.com/en/blog/md5-the-broken-algorithm), fear not:
For plain checking of file transfer or stored data integrity, MD5 is sufficient.
It was cryptographically "broken" - which is relevant for security, but not for
data integrity checking.


**Important: Hashcodes are not sufficient for proving authenticity!**
In case you need to deal with important originals/documents and you need to
make sure they're originals and not forged, etc. please check out this:

  * [Digital Signatures](https://en.wikipedia.org/wiki/Digital_signature)
  * [Blockchain](https://en.wikipedia.org/wiki/Blockchain)

Digital signatures are good, but could be signed with a date in the past 
([backdating](https://www.investopedia.com/terms/b/backdating.asp)).

If this is a concern, you may consider blockchain mechanisms:
Blockchain cipher became popular for digital currency (like
[Bitcoin](https://en.wikipedia.org/wiki/Bitcoin)), but it can also be used to
proof data authenticity and avoid backdating. 

AFAIK there are currently no systems that implement this productively yet, but
some have already researched into prototyping blockchain use for storage.
</aside>



# Do it early, do it continuously.

  * Create hashcodes early in the lifecycle.
  * Use them when transferring files.
  * Storage: Ongoing integrity checks matter.
  * Consider runtimes &amp; interference with daily work.


<aside class="notes">
Ongoing integrity checks on your storage:
Know where your collection is at.

It also makes sense to verify your backup that way.

Consider runtimes:

  * In order to generate/verify a hashcode, the whole file must be read at least once.
  * The chosen hashcode algorithm and its implementation may have impact on processing speed.
  * Do some tests, calulations to find a sweet spot for how often you can do integrity checks.
  * Consider throttling throughput data to avoid interference with daily work.


Real world example:

1) Archival Institution had hashcodes (ingest system created them), but never used them.
They told me: "We don't need to verify hashcodes, we have no problems"
So I checked. More than 1000 items had invalid hashcodes.
Since they were never checked before, it is unknown when or what caused them -
and also their impact on the material.

It's good practice to document the result of integrity checks somewhere.
It helps finding issues in your setup, or at least narrowing things down.
</aside>


# Hashcode manifest

![Example for an MD5 file manifest](../../../images/fixity/example-md5sum.png)

As simple as that. Plain text.



# AV Content hashing? 😎️

![Example of FFmpeg's FrameMD5 manifest](../../../images/fixity/example-framemd5.png)



# Using (=validating) hashcodes

![HashCheck: GUI tool showing data validation](../../../images/fixity/hashcheck-md5mismatch.png){.plain}

<aside class="notes">
</aside>


# Some tools

  * [Fixity (AVP)](https://lp.weareavp.com/products/fixity)
  * [HashCheck](http://code.kliu.org/hashcheck/)
  * [QuickHash GUI](https://www.quickhash-gui.org/)
  * ...



# Our storage has integrity checks built in!

  * Good! 🥳
  * But it can only do so as soon as data has arrived.
  * Did you verify that the data got there intact? 🧐


<aside class="notes">
There are storage systems that have (continous) integrity checks built in. This
is very good!  However, it still seems to be common to simply copy files there
without checking if they have ever arrived without transfer errors.

If the whole transfer chain was fine, no problem - if there was any
read/transfer error: Your storage could not tell you.

If a hashcode already exists at the source, you can use this to verify
bit-proof transfer.
</aside>


# Exercise

## The "cursed" digital archive folder.

What hashcode manifests can tell you beyond "*it's borken*", 
and how to interpret them.

<aside class="notes">

  * Make groups of 2-3 people each.
  * Download the fixity example zip:  
    <small>
  [http://download.av-rd.com/pub/exercises/fixity/hashcode-exercise_1a.zip](http://download.av-rd.com/pub/exercises/fixity/hashcode-exercise_1a.zip)
    </small>
  * Extract the files.
  * Compare the manifests with the "reference" and try to spot issues (=differences).
  * Try to find out what caused these issues.
  * You may want to use a "diff" tool
    (e.g. 
[MELD](http://meldmerge.org/)
![](../../../images/tools/diffing/meld_logo.png){width=50px}
    )

</aside>

<!-- 
=========================================
  BACKUP
=========================================
-->


# Digital Data:
## Backup copies



# The 3-2-1 Backup Rule 

  * Keep at least **three** copies of your data.
  * Store **two** backup copies on different devices or storage media.
  * Keep at least **one** backup copy offsite.

<aside class="notes">
That's not a law, it's a rule :)
It's good however to try to implement as much of it as you can.

If you can only do "2-1", it's better than not trying at all.
</aside>



# Backup integrity?

  * btw: Is your backup copy (still) intact...?
  * Did you check? ;)
  * Tape: Backup drives on shelf vs robot?
  * Handout: [Backup checklist](../pdf/PRINT-Backup_Checklist.pdf)



# Backup Checklist

  * How is the backup/restore done?
  * Who takes care of the backup?
  * Who can do a restore?
  * Is the restore being tested before needed?
  * When/why is a backup restored?
  * How can integrity of backup be verified?
  * How long is the expected "restore downtime"?

<aside class="notes">
The following is not a quiz, but merely a question-checklist that can help to
assess the status of backup/restore routines, as well as data integrity
validation in an archive. These questions were put together based on practical
experience, so that these answers can help save precious time (and troubles)
when a restore is actually needed.

It is best to go through these questions together
with the technicians responsible for backup/restore.
</aside>

<!-- 
=========================================
  MIGRATION 
=========================================
-->


# Storage Migration?

![](../../../images/migration/neverending_story-book_cover.jpg)

<aside class="notes">
  * There is no final carrier.
  * There is no evergreen format.

> Therefore fact: Any data must sooner or later be migrated.
</aside>


# Eternal Migration

  * Always consider how to get your data out of any system *before* you get
    into it.
  * Or at least while it's still running.
  * As vendor- and technology neutral as possible.
  * Try that *before* you buy.
  * Include migration in your planning.


<aside class="notes">
It’s like brushing your teeth or cleaning things:
It has to be done and is part of the natural life cycle.
Don’t avoid it - include it.
</aside>

# 💾 Which Storage is Right for YOU? 🤩

| Must | Should | Could | Won't |
| ---- | ------ | ----- | ----- |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |


Choose a use-case and try to phrase your wishes and requirements.

<aside class="notes">

Now, according to the MoSCoW method, write down which features you:

  * must have
  * should have
  * could have
  * won't have (this time)

And check which storage option provides them, then draw a dot in the
corresponding circle area.

It makes perfect sense to fill these lists even if you're not a technician.
Having such a list is then an excellent entry point for consulting someone
to help you, fill and translate your demands into a proper "solution".
<!--
=========================================
  Storage CHECKLIST
=========================================
-->


# Storage Checklist

  * How much size is needed: now & growing?
  * What’s the desired level of long-term?
  * Which carrier type(s) are you storing on?
  * Which use cases does it need to address?
  * Which functions are in place?
<small>(access control, monitoring, integrity checks, etc)</small>
  * Which automated actions are in place/desired?
  * Tiering support?
  * How can it be scaled if you run out of space?
  * What’s the life expectancy of the storage?



<!-- SUMMARY -->

# Storage: Summary

  * There's more than just *one right* solution...
  * Mixing is usually a good idea.
  * RAID6 might be at its limits 😢️
  * Consider LTFS and LTO generations
  * Embrace hashcodes!
  * Consider which level of control *you* have/want.
  * Have a backup- &amp; migration-plan



<!-- END / CREDITS -->

# - Fin -



# Questions?
## Comments?

Peter Bubestinger-Steindl

`email (at) ArkThis com`
