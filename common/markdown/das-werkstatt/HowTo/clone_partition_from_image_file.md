Thanks [a reply by user 'frostschutz' on stackexchange](https://unix.stackexchange.com/questions/73125/how-to-use-dd-to-clone-a-partition-off-a-disk-image), here are working instructions for how-to clone a partition from inside a disk-image:

```
$ losetup --find --show --partscan --read-only 2013-02-09-wheezy-raspbian.img
/dev/loop7
$ dd if=/dev/loop7p2 of=/dev/narnia bs=1M
```

> If --partscan doesn't work, you can also use one of:

```
$ partx -a /dev/loop7
$ kpartx /dev/loop7
```
