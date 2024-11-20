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

  * With &gt; 4TB disks, **RAID-6 may be insufficient**...
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



