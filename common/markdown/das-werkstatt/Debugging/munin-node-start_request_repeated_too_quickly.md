# Problem

`munin-node` on Debian 12, fresh install - won't start:

```
munin-node.service: Main process exited, code=exited, status=1/FAILURE
munin-node.service: Failed with result 'exit-code'.
Failed to start munin-node.service - Munin Node.
munin-node.service: Scheduled restart job, restart counter is at 5.
Stopped munin-node.service - Munin Node.
munin-node.service: Start request repeated too quickly.
munin-node.service: Failed with result 'exit-code'.
Failed to start munin-node.service - Munin Node.
```

I couldn't find any helpful error in journalctl output.
The logfile '/var/log/munin-node.log` just contained stuff like:

> shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.

I've also tried resetting the failed-count of this systemd process:

`$ systemctl reset-failed munin-node.service`

I've even resorted to uninstalling (`apt remove --purge`) munin-node and all config files - then reinstalling from scratch:
Same result.


# Solution

The host had more than 1 network interface - and for some reason, the "Which address to bind to" config line didn't work to bind to all available interfaces:

```
# Which address to bind to;
#host *
```

It prevented startup.
So I've removed the generic default and added localhost and LAN IP:

```
# Which address to bind to;
#host *
host 127.0.0.1
host 192.168.0.200
```

That did the trick.
I'm still wondering though, where I would be able to find log output for this?
