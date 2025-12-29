# Using 8TB Seagate IronWolf SATA in HPE Proliant Gen8

  * I had a mix of 2 disks in bays: 2+3 - which is /VERY BAD/.
    The disks will stay with ~20-30 MB/s (or slower) write speeds, and sound
like swapping which doing transfer: Like the head could not focus on sequential
writing, busy always moving. You can /hear/ that pattern when the disks are
written. It sounds stressful and very noisy.

  * When putting 2x8TB SATA disks in bay 1+2 = SATA 6 Gb/s:
    BUT: This makes it impossible to boot the OS disk (from bay 3).

  * Therefore you need to change the SATA controller from AHCI to "smart RAID", then reboot and start the "HPE SSA" (smart storage admin) and assign the OS disk (bay3) as one-disk-RAID0.

    Keeps the OS on the disk intact, but allows the Gen8-BIOS to boot from "not-bay1" disk now :)

