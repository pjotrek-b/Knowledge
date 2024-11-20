---
title: Archival Storage - Brainstorming
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

date: November 2022
---


# Exercises:

  1. Storage debate: 
    3 groups (all-in, all-external, cloud)
    or 2 groups (all-in, cloud)

    3 groups
     * all in-house
       self-support, hardware on-site, no external help
     * all out-sourced
       external support, hardware off-site, choice of geographically "near" provider
     * Cloud storage
       Everything somewhere.
       
     To decide: Group size?
     15min. to "collect" their findings.

  2. Which physical carrier types are you storing archival data on already?

  3. Which filesystems have you heard / do you use?



# Take-aways

  * Different basic physical types:
    * Magnetic, Optical, more?
    * Moving vs non-moving parts (spinning platter vs flash chips)
    * "standalone" vs "needs a drive"

  * Filesystems!
    * "bit pulp": Without FS, any digital storage is just a long series of bits...
    * Analogy: book-page-numbers and index.
    * Filesystem *is* also a data format (open, closed, documented, supported, etc?)
    * LTFS

  * Pros/cons sustainability of different physical carriers
    * Bitrot
    * Hashcodes / Integrity checks

  * Methods for grouping individual carriers/storage entities to larger virtual spaces:
    * RAID
    * Tabe library (robot)
    * Software Defined Storage

  * The Cloud:
    * Online connection: Mandatory?
    * Contracts for getting your data back.
    * What happens if they vanish or change their ToS?
    * Provider: Which country, jurisdiction, (political) interests, etc?
    * and/or: option for copying directly over to another provider?
    * Filesize considerations: capacity and data transfer

  * Data tape:
    * standalone vs tape library
    * LTO-Generations: Handling & Migration planning

----
Storage debate exercise here.
----

  * Mixing is always a good idea:
    * Another option: On-site, externally supported
    * Access copies: Cloud, but archival storage "local"?

  * Eternal Migration
    * No eternal carrier
    * Include "getting out" of any storage before getting in.
    * Schedule 

  * Who may...?
    * read? write?
    * Ransom viruses >:D

  * Does it scale?
    * How to add new space?

  * ...and: Make backups!
    * 3-2-1 backup rule.

  * The Present Future:
    * Limitations of classical filesystems
    * Object based storage
    * Relevant difference to classical hierarchical filesystems
    * End of RAID6?
    * Storage Cluster & Replication
    * Erasure coding

  * Conclusion
    * Who owns your storage, owns your work.
    * Every digital storage has a form of filesystem.
    * Storage Monitoring!
      * Integrity checks
      * SMART
    * Include migration planning
    * Mix: carrier, types, everything!
      (Never good to put too much on a single bet :P)
    * If we archivists lose/outsource most-if-not-all knowhow/skills regarding
      digital storage, is this good?

