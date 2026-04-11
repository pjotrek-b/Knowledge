# High cpu usage on fileserver over sudden.

top process: ~25% CPU or higher - `z_rd_int`.
Okay, either Zorro is on my system - or I hope (fingerscrossed) it's ZFS.

(spoiler: it /is/)

# What's going on?

zpool status

```
  pool: MyPool
 state: ONLINE
  scan: scrub in progress since Sun Apr 12 00:24:02 2026
    1.34T / 5.36T scanned at 609M/s, 378G / 5.36T issued at 168M/s
    0B repaired, 6.89% done, 08:41:03 to go
```

Case closed, good night.

