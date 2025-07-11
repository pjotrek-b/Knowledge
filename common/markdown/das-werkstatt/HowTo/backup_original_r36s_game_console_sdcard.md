# How to backup an R36S original "firmware" SD-card

Or "firmware" (=stock software other devices that are shippe with and boot/run off, stored on a (micro) SD-card or similar.

## 1) Copy the sd-card to an image file

`❤️ dd if=/dev/sdX of=r36s_stock_firmware.img bs=8M`


## 2) Make a backup of that image file.

+ generate and save its hashcode (md5, etc), to be able to check its bit-proof integrity at any later point in time.
(=data integrity reasons)


## 3) Attach that image file as loop device

`🌟️ sudo losetup --find --show --partscan --read-only r36s_stock_firmware.img`

...in order to be able to access it like as-if you had the physical sd-card attached to your PC 😉️😎️

That command should return the name of "the next available" /dev/loopNN device - where it has attached the given image file.
Like:

`/dev/loop21`

(The parameter `--read-only` must be removed in order for you to be able to modify (resize/shrink) the ROMs partition.
Yet, if you ever want to do data-recovery, knowing how to put the image in read-only mode, so you can't break anything, may be useful.)

Partitions of that virtual device are accessed by adding `pN`, like `p1` for the first, `p2` for the second, and so on.


## 4) Mount and copy the EASYROMS partition "as-files" as backup

Since we're gonna shrink the ROMs-partition, in order to be able to use that firmware image on a smaller SD-card (than the 128 GB it was shipped with).

`# mkdir /mnt/easyroms_fs`
`# mount /dev/loop21p3 /mnt/easyroms_fs`
`# rsync -avP --xattrs /mnt/easyroms_fs /$HOME/backup/r36s/  # (or wherever you have enough free diskspace and like to keep a backup)


## 5) Shrink the partition

Use `gnome-disks` or `gparted` to shrink the existing EASYROMS partition:

`# gnome-disks /dev/loop21`

This will open gnome-disks/gparted on the image as loop-device. Nice.
I actually deleted the EASYROMS partition, as my gparted version wasn't giving me the option to shrink or format-as `exFAT`. So I used gnome-disks and deleted the partition and created a new, smaller one, formatted as `exFAT`.


# 6) Shave/truncate the image file


```
# Too lazy to type: ;)
IMAGE='r36s_stock_firmware'

# List (-l) the partition table of the original image
fdisk -l ./$IMAGE.img
```

```
# and look for the value "End" of the last partition:

> Disk ./g80CA-R36S-ArkOS_factory.img: 115,24 GiB, 123731968000 bytes, 241664000 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: gpt
> Disk identifier: DF00F539-80C8-4821-B189-C668431BE16C
> 
> Device                             Start      End  Sectors  Size Type
> ./g80CA-R36S-ArkOS_factory.img1    32768  1081343  1048576  512M EFI System
> ./g80CA-R36S-ArkOS_factory.img2  1081344 17858559 16777216    8G Linux filesystem
> ./g80CA-R36S-ArkOS_factory.img3 17858560 **25671679**  7813120  3,7G Microsoft basic data

# Then use `dd` to copy 25671679
CUT="$IMAGE-SMALLER"
dd if=./$IMAGE.img of=$CUT.img bs=512 count=$[(25671679+1+64)]
```

Why the "+1 +64"? As a "save space" for the backup-copy of the GPT header structure.

So the file "cut out" with `dd` will **need to be fixed first!**.


# 7) Fix the smaller, cut image file's GPT data

`$ gdisk $CUT.img`

> GPT fdisk (gdisk) version 1.0.5
> 
> Warning! Disk size is smaller than the main header indicates! Loading
> secondary header from the last sector of the disk! You should use 'v' to
> verify disk integrity, and perhaps options on the experts' menu to repair
> the disk.
> Caution: invalid backup GPT header, but valid main header; regenerating
> backup header from main header.
> 
> Warning! Error 25 reading partition table for CRC check!
> Warning! One or more CRCs don't match. You should repair the disk!
> Main header: OK
> Backup header: ERROR
> Main partition table: OK
> Backup partition table: ERROR
> 
> Partition table scan:
>   MBR: protective
>   BSD: not present
>   APM: not present
>   GPT: damaged
> 
> ****************************************************************************
> Caution: Found protective or hybrid MBR and corrupt GPT. Using GPT, but disk
> verification and recovery are STRONGLY recommended.
> ****************************************************************************
> 
> Command (? for help): ?
> b   back up GPT data to a file
> c   change a partition's name
> d   delete a partition
> i   show detailed information on a partition
> l   list known partition types
> n   add a new partition
> o   create a new empty GUID partition table (GPT)
> p   print the partition table
> q   quit without saving changes
> **r   recovery and transformation options (experts only)**
> s   sort partitions
> t   change a partition's type code
> v   verify disk
> w   write table to disk and exit
> x   extra functionality (experts only)
> ?   print this menu
> 
> Command (? for help): r
 
Select the option `r` = "recovery and transformation options (experts only)" to get to the repair submenu.

> Recovery/transformation command (? for help): v
> 
> Caution: The CRC for the backup partition table is invalid. This table may
> be corrupt. This program will automatically create a new backup partition
> table when you save your partitions.
> 
> Problem: The secondary header's self-pointer indicates that it doesn't reside
> at the end of the disk. If you've added a disk to a RAID array, use the 'e'
> option on the experts' menu to adjust the secondary header's and partition
> table's locations.
> 
> Problem: Disk is too small to hold all the data!
> (Disk size is 25671744 sectors, needs to be 241664000 sectors.)
> The 'e' option on the experts' menu may fix this problem.
> 
> Problem: GPT claims the disk is larger than it is! (Claimed last usable
> sector is 241663966, but backup header is at
> 241663999 and disk size is 25671744 sectors.
> The 'e' option on the experts' menu will probably fix this problem
> 
> Partition(s) in the protective MBR are too big for the disk! Creating a
> fresh protective or hybrid MBR is recommended.
> 
> Identified 5 problems!

Okay, it says for short:

> "The copy is good! Your main GPT data is fine. Disk-size is odd (due to leftovers from its source 128GB image)"
> Please use the 'e' option to adjust things back to normal, working conditions"


I used the recovery-submenu 'd' option to "rebuild the backup":

> Recovery/transformation command (? for help): e
> Warning! This will probably do weird things if you've converted an MBR to
> GPT form and haven't yet saved the GPT! Proceed? (Y/N): y
> 
> Recovery/transformation command (? for help): ?
> b   use backup GPT header (rebuilding main)
> c   load backup partition table from disk (rebuilding main)
> **d   use main GPT header (rebuilding backup)**
> e   load main partition table from disk (rebuilding backup)
> f   load MBR and build fresh GPT from it
> g   convert GPT into MBR and exit
> h   make hybrid MBR
> i   show detailed information on a partition
> l   load partition data from a backup file
> m   return to main menu
> o   print protective MBR data
> p   print the partition table
> q   quit without saving changes
> t   transform BSD disklabel partition
> v   verify disk
> w   write table to disk and exit
> x   extra functionality (experts only)
> ?   print this menu

> Recovery/transformation command (? for help): v
> 
> Problem: The secondary header's self-pointer indicates that it doesn't reside
> at the end of the disk. If you've added a disk to a RAID array, use the 'e'
> option on the experts' menu to adjust the secondary header's and partition
> table's locations.
> 
> Problem: Disk is too small to hold all the data!
> (Disk size is 25671744 sectors, needs to be 241664000 sectors.)
> The 'e' option on the experts' menu may fix this problem.
> 
> Problem: GPT claims the disk is larger than it is! (Claimed last usable
> sector is 241663966, but backup header is at
> 241663999 and disk size is 25671744 sectors.
> The 'e' option on the experts' menu will probably fix this problem
> 
> Partition(s) in the protective MBR are too big for the disk! Creating a
> fresh protective or hybrid MBR is recommended.
> 
> Identified 4 problems!
> 
> Recovery/transformation command (? for help): m
> 
> Command (? for help): ?
> b   back up GPT data to a file
> c   change a partition's name
> d   delete a partition
> i   show detailed information on a partition
> l   list known partition types
> n   add a new partition
> o   create a new empty GUID partition table (GPT)
> p   print the partition table
> q   quit without saving changes
> r   recovery and transformation options (experts only)
> s   sort partitions
> t   change a partition's type code
> v   verify disk
> w   write table to disk and exit
> x   extra functionality (experts only)
> ?   print this menu
> 
> Command (? for help): p
> Disk g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img: 25671744 sectors, 12.2 GiB
> Sector size (logical): 512 bytes
> Disk identifier (GUID): DF00F539-80C8-4821-B189-C668431BE16C
> Partition table holds up to 128 entries
> Main partition table begins at sector 2 and ends at sector 33
> First usable sector is 34, last usable sector is 241663966
> Partitions will be aligned on 2048-sector boundaries
> Total free space is 216025021 sectors (103.0 GiB)
> 
> Number  Start (sector)    End (sector)  Size       Code  Name
>    1           32768         1081343   512.0 MiB   EF00  system
>    2         1081344        17858559   8.0 GiB     8300  storage
>    3        17858560        25671679   3.7 GiB     0700  
> 
> Command (? for help): w
> Caution! Secondary header was placed beyond the disk's limits! Moving the
> header, but other problems may occur!
> 
> Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
> PARTITIONS!!
> 
> Do you want to proceed? (Y/N): y
> OK; writing new GUID partition table (GPT) to g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img.
> Warning: The kernel is still using the old partition table.
> The new table will be used at the next reboot or after you
> run partprobe(8) or kpartx(8)
> The operation has completed successfully.


# Finally: ready to write back to a new sd-card!

## gdisk says: all good.

> gdisk g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img 
> GPT fdisk (gdisk) version 1.0.5
> 
> Partition table scan:
>   MBR: protective
>   BSD: not present
>   APM: not present
>   GPT: present
> 
> Found valid GPT with protective MBR; using GPT.
> 
> Command (? for help): v
> 
> No problems found. 32765 free sectors (16.0 MiB) available in 2
> segments, the largest of which is 32734 (16.0 MiB) in size.


## Partition table data looking good, indeed:

> Command (? for help): p
> Disk g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img: 25671744 sectors, 12.2 GiB
> Sector size (logical): 512 bytes
> Disk identifier (GUID): DF00F539-80C8-4821-B189-C668431BE16C
> Partition table holds up to 128 entries
> Main partition table begins at sector 2 and ends at sector 33
> First usable sector is 34, last usable sector is 25671710
> Partitions will be aligned on 2048-sector boundaries
> Total free space is 32765 sectors (16.0 MiB)
> 
> Number  Start (sector)    End (sector)  Size       Code  Name
>    1           32768         1081343   512.0 MiB   EF00  system
>    2         1081344        17858559   8.0 GiB     8300  storage
>    3        17858560        25671679   3.7 GiB     0700  


# Almost done: enlarge the ROMs partition and fill it from backup

Remember the `easyroms_fs` backup back you made before?
We'll need that in a minute.

`$ gnome-disks $CUT.img`

Then erase the small 4 GB partition and create a new exFAT one filling up the whole card. You may choose any size you like, in fact. it's your card and device.
Name the new larger partition 'EASYROMS' (if we're talking ArkOS/R36S/K36 gaming handheld device).

Mount the new EASYROMS partition.
Select what folders of the original firmware to copy over (keep).
Depending also on filesize in total.

Copy it over.
Unmount it.

Insert into your gaming handheld: Reboot. Have fun!



# OPTIONAL INFO: fdisk output on 'yet-b0rken' cut-image

`$ sudo fdisk /dev/loop21`

> Welcome to fdisk (util-linux 2.34).
> Changes will remain in memory only, until you decide to write them.
> Be careful before using the write command.
> 
> GPT PMBR size mismatch (241663999 != 25671743) will be corrected by write.
> 
> Command (m for help): p
> 
> Disk /dev/loop21: 12,25 GiB, 13143932928 bytes, 25671744 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x00000000
> 
> Device        Boot Start      End  Sectors  Size Id Type
> /dev/loop21p1          1 25671743 25671743 12,2G ee GPT
> 
> Command (m for help): w
> The partition table has been altered.
> Calling ioctl() to re-read partition table.
> Syncing disks.

It should look like this, when fixed:

> Disk ./g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img: 12,25 GiB, 13143932928 bytes, 25671744 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: gpt
> Disk identifier: DF00F539-80C8-4821-B189-C668431BE16C
> 
> Device                                                    Start      End  Sectors  Size Type
> ./g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img1    32768  1081343  1048576  512M EFI System
> ./g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img2  1081344 17858559 16777216    8G Linux filesystem
> ./g80ca-r36s-kinmris-k36_clone-stock_firmware-cut.img3 17858560 25671679  7813120  3,7G Microsoft basic data

:)
