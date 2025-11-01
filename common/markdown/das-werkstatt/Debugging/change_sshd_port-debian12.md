# HowTo: Changing the sshd port.

This used to be very straightforward and easy in the past:
Edit the line "Port 22" in `/etc/ssh/sshd_config` to a port you'd like; restart sshd - aaaand: DONE.

Now things are different...

That config line still exists. Default 22.
But: systemd has control over spawning ssh now - so check the config of `ssh.socket` unit:

`$ systemctl status ssh.socket`

```
* ssh.socket - OpenBSD Secure Shell server socket
     Loaded: loaded (/lib/systemd/system/ssh.socket; enabled; preset: enabled)
    Drop-In: /etc/systemd/system/ssh.socket.d
             `-override.conf
     Active: active (running) since Sat 2025-11-01 20:26:36 CET; 33min ago
   Triggers: * ssh.service
     Listen: [::]:7022 (Stream)
     CGroup: /system.slice/ssh.socket

Nov 01 20:26:36 amp systemd[1]: Listening on ssh.socket - OpenBSD Secure Shell server socket.
```

Here's mine: listening on "7022" - although my `sshd_config` still says "Port 22".


# HowTo change systemd's `ssh.socket` options

`$ touch /etc/systemd/system/ssh.socket.d/override.conf`

Edit that file, to match the following contents:

> [Socket]
> ListenStream=
> ListenStream=7022

I remember the empty `ListenStream=` entry is required to /DROP/ port 22 it would bind to by default.
When I just added `ListenStream=7022`, it would bind to both: 22 + 7022.

Anyways: **This is where you now may set your SSH daemon port**

Works on Debian12, and related derivative-flavors (eg Ubuntu, MX-Linux, etc).

