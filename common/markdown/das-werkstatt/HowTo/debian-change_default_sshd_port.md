# Changing the default port the SSH demon (sshd) is listening on

## Option A "Classic" (old-school): edit `/etc/ssh/sshd_config`

There, copy paste the line `#Port 22` and edit the number to your liking.
For example, if you'd like SSH to listen on port #3022, your config should look like this:

```
#Port 22
Port 3022
```

Save the config file and restart sshd:

`$ sytemctl restart sshd`

Then, make sure to provide the new (non-default) port information when connecting. :wink:


## Option B: Systemd's `ssh.socket` port

I just found out (the hard way), that just changing the sshd "Port" config, doesn't do the trick anymore on newer (systemd) systems.

Actually, you need to change the port that "ssh.socket" systemd service is listening on.
You could either manually create-and-edit `/etc/systemd/system/ssh.socket.d/override.conf`, with the following lines:

```
[Socket]
ListenStream=3022
Accept=no
```

**OR**: You can use systemd's edit functionality to change setting-overrides (preferred method):

`$ systemctl edit ssh.socket`

This should bring you a text like this:

```
### Editing /etc/systemd/system/ssh.socket.d/override.conf
### Anything between here and the comment below will become the new contents of the file

[Socket]
ListenStream=
ListenStream=3022

### Lines below this comment will be discarded

### /lib/systemd/system/ssh.socket
# [Unit]
# Description=OpenBSD Secure Shell server socket
# Before=sockets.target
# ConditionPathExists=!/etc/ssh/sshd_not_to_be_run
#
# [Socket]
# ListenStream=22
# Accept=no
#
# [Install]
# WantedBy=sockets.target
```

The line `ListenStream=` (without a port) is required to unbind from default 22 (as by default), and instead /just/ bind to the new port.

## Restart services

`$ systemctl daemon-reload`
`$ systemctl stop ssh.socket`
`$ systemctl start ssh.socket`


For more info about what-and-why, see this article for more details:
https://rome-rohani.medium.com/socket-based-activation-ssh-old-linux-dogs-vs-new-systemd-tricks-656207db13c9

**NOTE:** It is better to *overload* local configuration with files in `/etc` instead of editing the system-default config files in general.

The article above suggests editing `/lib/systemd/system/ssh.socket` for a local config - which I would advise against!

