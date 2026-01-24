# ClamAV on Debian 13: clamdscan throws "File path check failure: Permission denied. ERROR"

#tl;dr - use "fdpass" option:

Running clamdscan like this fixed the problem:

> `clamdscan --fdpass /mnt/storage/home`

# Permission denied, but permissions are correct.

I get the following error, but user "clamav" can read-access those paths/files:

```
clamdscan /mnt/storage/home/
/mnt/storage/home: File path check failure: Permission denied. ERROR
```

Adding this option solves the issue:

From the `man clamdscan` page:

```
--fdpass
      Open  the  file  and pass the opened file descriptor to clamd. This is useful if clamd is
      running as a different user or if clamd sees a different file system tree. This is faster
      than streaming the file to clamd.  Only available if connected to clamd  via  local(unix)
      socket.
```

This has been tested on Proxmox pve-9.1-debian-13.2 ZFS dataset mountpoints.
Works nicely!
