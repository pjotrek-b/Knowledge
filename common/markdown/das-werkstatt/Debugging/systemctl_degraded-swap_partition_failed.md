# systemd status = `State: degraded`, because swap partitions couldn't be mounted.

I ran this:

`§ systemctl status`

```
● macrocosm
    State: degraded
    Units: 573 loaded (incl. loaded aliases)
     Jobs: 0 queued
   Failed: 2 units
    Since: Wed 2026-01-21 20:54:00 CET; 14h ago
  systemd: 257.9-1~deb13u1
  Tainted: unmerged-bin
   CGroup: /
```

To see to my surprise that the host's state is **degraded**?

So I wanted to know which units failed:

`§ systemctl list-units --failed`

```
  UNIT                                LOAD   ACTIVE SUB    DESCRIPTION                 
● dev-disk-by\x2dpartlabel-swap1.swap loaded failed failed /dev/disk/by-partlabel/swap1
● dev-disk-by\x2dpartlabel-swap2.swap loaded failed failed /dev/disk/by-partlabel/swap2

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

2 loaded units listed.
```

Okay, so it's got something-to-do with my swap partitions, but what?

I have 2 swap partitions: 1 one each mirrored OS drive, and I'm mounting them by GPT partition label:

`§ ls -la /dev/disk/by-partlabel/swap*`

```
lrwxrwxrwx 1 root root 10 Jan 21 20:53 /dev/disk/by-partlabel/swap1 -> ../../sdc4
lrwxrwxrwx 1 root root 10 Jan 21 20:53 /dev/disk/by-partlabel/swap2 -> ../../sdd4
```

# SOLUTION

I think I forgot to run "mkfs" on these partitions before using them.
So they're simply "non-formatted". Let's change that, using `mkswap`:

`§ mkswap /dev/disk/by-partlabel/swap1`
`§ mkswap /dev/disk/by-partlabel/swap2`

```
Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=1abdc1ce-c2d3-4a13-8f6d-fc6c142baxxx

Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=cb548247-8f5b-48fa-b40b-be0612e54xxx
```


# Additional knowhow

You cannot mount a SWAP partition, but the error message is confusing:

`§ sudo mount /dev/disk/by-partlabel/swap1`

```
mount: swap: unknown filesystem type 'swap'.
       dmesg(1) may have more information after failed mount system call.
```

Rather make sure you have proper entries for the swap partitions in your /etc/fstab:

make sure you have proper entries for the swap partitions in your /etc/fstab:

...and then and then use `swapon -a`, and check to see the total swap space available and used with `free -h`:

```
               total        used        free      shared  buff/cache   available
Mem:           7,6Gi       2,2Gi       5,3Gi        36Mi       421Mi       5,4Gi
Swap:          8,0Gi          0B       8,0Gi
```
