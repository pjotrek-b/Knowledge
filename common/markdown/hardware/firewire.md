# IEEE1396 - aka "Firewire"

```
# /etc/udev/rules.d/50-firewire.rules
ACTION=="add", KERNEL=="fw1", SUBSYSTEM=="firewire", DRIVER=="", MODE="0660", OWNER="your username", GROUP="video"
ACTION=="add", KERNEL=="fw2", SUBSYSTEM=="firewire", DRIVER=="", MODE="0660", OWNER="your username", GROUP="video"
```

[Thanks user "Diego"](https://forums.linuxmint.com/viewtopic.php?p=2405899&sid=91452e0d0177dff42451fb2706d7a1d2#p2405899)
