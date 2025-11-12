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

The first empty `ListenStream=` entry is required to /DROP/ port 22 it would bind to by default.
When I just added `ListenStream=7022`, it would bind to both: 22 + 7022.

Anyways: **This is how-and-where you set your SSH daemon port, /in systemd/**

Works on Debian12, and related derivative-flavors (eg Ubuntu, MX-Linux, etc).


# Optional:

When you get an error like this from systemd:

> -- The unit ssh.socket has entered the 'failed' state with result 'service-start-limit-hit'.

Use this to reset the failed counter of "ssh.socket" service:

`systemctl reset-failed ssh.socket`

This occurs fairly often, if your `sshd_config` has an error - then ssh.socket will run into too-many-failed-retries pretty quickly.


# Other error: "ssh.service already active":

Output from `journalctl -xeu ssh`

> Nov 12 21:27:39 systemd[1]: ssh.socket: Socket service ssh.service already active, refusing.
> Nov 12 21:27:39 systemd[1]: Failed to listen on ssh.socket - OpenBSD Secure Shell server socket.

Most likely, your sshd and systemd.ssh.socket are somehow fighting over the same port, due to a racing condition?

`sudo systemctl daemon-reload`

Then stop everything, and start `ssh.socket`:

`systemctl stop ssh.socket`
`systemctl stop sshd.socket`

...which then auto-starts sshd upon the first connection request.

Works!
