# Proxmox LXC container network interface names: eth1@if85 ?

The command `ip a`returns a strange addon to the interface names:
It adds `@if81` with different numbers.

So `eth0` now looks like `eth0@if81`. What the ...? O.O
Looks ugly. For decades it's been known to be best to copy/paste from "ifconfig" output. Now doing the same for "ip a" output **will not work!**.

Use the plain regular NIC name - *without* the `@ifNN` extension: `eth0`, `eth2`, and so on.
Simply refer to this interface as a good-old `eth0`, and NOT `eth0@if81`:

Here's the output of `ip a` (on Debian 12, inside an LXC container on PVE):

```
2: eth0@if145: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc noqueue state UP group default qlen 1000
    link/ether bc:24:11:6b:70:c9 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.2.300/24 brd 192.168.2.255 scope global eth0
       valid_lft forever preferred_lft forever

3: eth1@if149: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:50:56:01:21:c8 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 65.100.22.333/26 brd 65.100.22.191 scope global eth1
       valid_lft forever preferred_lft forever
```

Haven't read up yet what this `@ifNNN` is about.
btw: I just noticed, that the NNN index increased on that same machine.
When I started this text 2 days ago, it was @if81 and @if85. Now it's @if145 and @if149.

Curious what happens above @if255?

