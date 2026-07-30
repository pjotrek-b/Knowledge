# ZFS performance drops, with lots-of-files over Samba

I'm transferring scanned film, and often folder-trees with 0-byte, xattrs-only datasets, natively on ZFS with nice performance.

But when doing the same over Samba, the performance is surprisingly slow, and the smbd process uses between 25% and up to 80% CPU. This seems odd.

I haven't been able to solve/tune/fix that yet, but here's ...



# ...a workaround!

Don't use Samba-mounts if you need to transfer at higher speeds.

I'm quite happily running `rsync user@server:/my/dir` with speeds that match my hardware ;)

If you have suggestions on fixing the samba performance, I'm all ears!
