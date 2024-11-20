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


