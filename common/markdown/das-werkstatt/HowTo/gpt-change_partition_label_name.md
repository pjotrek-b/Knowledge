# HowTo change GPT label/name of an existing partition

Use `gdisk` to do this:

`gdisk /dev/sdX`

Will greet you like this:

```
GPT fdisk (gdisk) version 1.0.10

Partition table scan:
  MBR: protective
  BSD: not present
  APM: not present
  GPT: present

Found valid GPT with protective MBR; using GPT.
```

In order to see the partitions on your device, enter the letter `p` and press Enter:

```
Command (? for help): p
Disk /dev/sdd: 468862128 sectors, 223.6 GiB
Model: 2115            
Sector size (logical/physical): 512/512 bytes
Disk identifier (GUID): 13900280-02CA-419B-9F34-8F03D1C8C3FE
Partition table holds up to 128 entries
Main partition table begins at sector 2 and ends at sector 33
First usable sector is 34, last usable sector is 468862094
Partitions will be aligned on 2-sector boundaries
Total free space is 3214 sectors (1.6 MiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1              34            2047   1007.0 KiB  EF02  
   2            2048         2099199   1024.0 MiB  EF00  
   3         2099200       251658240   119.0 GiB   BF01  
   4       251660288       260048895   4.0 GiB     8200  
   5       260048896       468860927   99.6 GiB    8300  
```

If you enter a `?`, you'll see the available command(letter)s:

> b       back up GPT data to a file
> **c       change a partition's name**
> d       delete a partition
> i       show detailed information on a partition
> l       list known partition types
> n       add a new partition
> o       create a new empty GUID partition table (GPT)
> p       print the partition table
> q       quit without saving changes
> r       recovery and transformation options (experts only)
> s       sort partitions
> t       change a partition's type code
> v       verify disk
> w       write table to disk and exit
> x       extra functionality (experts only)
> ?       print this menu

Using the command `c` will let you enter the (new) GPT label for a partition (selected by its number, shown in the listing `p` before):

```
Command (? for help): c
Partition number (1-5): 2
Enter name: boot

Command (? for help): c
Partition number (1-5): 4
Enter name: swap2
```

Now you'll see that 2 of my 5 partition have a name. Hooray!

```
Command (? for help): p

Disk /dev/sdd: 468862128 sectors, 223.6 GiB
Model: 2115            
Sector size (logical/physical): 512/512 bytes
Disk identifier (GUID): 13900280-02CA-419B-9F34-8F03D1C8C3FE
Partition table holds up to 128 entries
Main partition table begins at sector 2 and ends at sector 33
First usable sector is 34, last usable sector is 468862094
Partitions will be aligned on 2-sector boundaries
Total free space is 3214 sectors (1.6 MiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1              34            2047   1007.0 KiB  EF02  
   2            2048         2099199   1024.0 MiB  EF00  boot
   3         2099200       251658240   119.0 GiB   BF01  
   4       251660288       260048895   4.0 GiB     8200  swap2
   5       260048896       468860927   99.6 GiB    8300  
```

So far, no changes have been written to disk. Just in RAM: You need to save it to stay:

```
Command (? for help): w
```

I've done this on disk-partition that was (a) part of an mdadm SoftRAID1 (mirror), and (b) of the running operating system (OS). So you can do it on the fly on a running OS.

Good luck and have fun!


# Using GPT names to mount things

```
# Yes, this is my preferred setup for swap on mdadm Soft-RAID1.
# Swap is /not/ part of the mirror (=faster), and its own partition on each disk:
/dev/disk/by-partlabel/swap1    swap         swap      defaults            0   0
/dev/disk/by-partlabel/swap2    swap         swap      defaults            0   0
```

NOTE: If you'd like to mount something else "by-label", but it doesn't show up in `/dev/disk/by-label`, then the following article may help you debug - or fix/patch/improve the script `udev` uses to populate that folder:

https://unix.stackexchange.com/questions/56291/what-causes-dev-disk-by-label-to-be-populated
