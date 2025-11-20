# Problem

`munin-node` on Debian 12, fresh install - won't start:

This is the error message in `/var/log/munin/munin-node.log`:

```
shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
```

It's very likely related to ipv6 being disabled and `Host *` in `/etc/munin/munin-node.conf`.
See [Issue #1641 and its fix](https://github.com/munin-monitoring/munin/pull/1665) for more details.


# Quick solution:

Replace `host *` with `host 0.0.0.0` in `/etc/munin/munin-node.conf`


# Here are more infos...

Regarding error messages and behavior:


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
The logfile '/var/log/munin-node.log` contained stuff like:


```
2025/11/05-17:40:12 Munin::Node::Server (type Net::Server::Fork) starting! pid(1623030)
Resolved [*]:4949 to [::]:4949, IPv6
Not including resolved host [0.0.0.0] IPv4 because it will be handled by [::] IPv6
Binding to TCP port 4949 on host :: with IPv6
2025/11/05-17:40:12 Can't connect to TCP port 4949 on :: [Invalid argument]
  at line 66 in file /usr/share/perl5/Net/Server/Proto/TCP.pm
2025/11/05-17:40:12 Server closing!
shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
2025/11/05-17:40:13 Munin::Node::Server (type Net::Server::Fork) starting! pid(1623039)
Resolved [*]:4949 to [::]:4949, IPv6
Not including resolved host [0.0.0.0] IPv4 because it will be handled by [::] IPv6
Binding to TCP port 4949 on host :: with IPv6
2025/11/05-17:40:13 Can't connect to TCP port 4949 on :: [Invalid argument]
  at line 66 in file /usr/share/perl5/Net/Server/Proto/TCP.pm
2025/11/05-17:40:13 Server closing!
shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
2025/11/05-17:40:13 Munin::Node::Server (type Net::Server::Fork) starting! pid(1623044)
Resolved [*]:4949 to [::]:4949, IPv6
Not including resolved host [0.0.0.0] IPv4 because it will be handled by [::] IPv6
Binding to TCP port 4949 on host :: with IPv6
2025/11/05-17:40:13 Can't connect to TCP port 4949 on :: [Invalid argument]
  at line 66 in file /usr/share/perl5/Net/Server/Proto/TCP.pm
2025/11/05-17:40:13 Server closing!
shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
2025/11/05-17:40:13 Munin::Node::Server (type Net::Server::Fork) starting! pid(1623048)
Resolved [*]:4949 to [::]:4949, IPv6
Not including resolved host [0.0.0.0] IPv4 because it will be handled by [::] IPv6
Binding to TCP port 4949 on host :: with IPv6
2025/11/05-17:40:13 Can't connect to TCP port 4949 on :: [Invalid argument]
  at line 66 in file /usr/share/perl5/Net/Server/Proto/TCP.pm
2025/11/05-17:40:13 Server closing!
shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
2025/11/05-17:40:14 Munin::Node::Server (type Net::Server::Fork) starting! pid(1623055)
Resolved [*]:4949 to [::]:4949, IPv6
Not including resolved host [0.0.0.0] IPv4 because it will be handled by [::] IPv6
Binding to TCP port 4949 on host :: with IPv6
2025/11/05-17:40:14 Can't connect to TCP port 4949 on :: [Invalid argument]
  at line 66 in file /usr/share/perl5/Net/Server/Proto/TCP.pm
2025/11/05-17:40:14 Server closing!

shutdown() on unopened socket GEN0 at /usr/lib/x86_64-linux-gnu/perl-base/IO/Socket.pm line 325.
```

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

Or:
```
# Which address to bind to;
#host *
host 0.0.0.0
```

That did the trick.
I'm still wondering though, where I would be able to find log output for this?


# Links:

  * [[Bug] Munin-node fails to start when 'host *' is set in munin-node.conf #1641](https://github.com/munin-monitoring/munin/issues/1641)

  * [munin-node.service doesn't start until reboot [if IPv6 has just been disabled by sysctl] on Ubuntu 23.04 (Lunar Lobster) final release [similar on Debian 12 (Bookworm)] #3434
](https://github.com/iiab/iiab/issues/3434)

  * [munin-node.conf: add comment on how to make default host * work in IPv4-only case #1666](https://github.com/munin-monitoring/munin/pull/1666)
