# How to disable IPv6 on debian-based GNU/Linux distros:


Show the current status of the IPv6 configuration:

`$ sudo sysctl net.ipv6.conf.all.disable_ipv6`

If it returns `0` means IPv6 is *enabled* (default on Debian/Ubuntu since many years)


Add the following lines to `/etc/sysctl.conf`:

```
# Disabling the IPv6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```
