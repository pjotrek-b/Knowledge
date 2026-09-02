# Problem installing Proxmox on Supermicro X9DRH-7F

I have a very nice Supermicro server mainboard here, I'd like to install Proxmox on.
However, the proxmox installer (GUI or Terminal installer) freezes after a line showing the kernel to boot with its parameters (in commandline/text mode).

Then it simply halts, and on some monitors it says "frequency out of range".
(First I thought it was a monitor issue, since I love installing my servers with 20y+ old VGA displays: they're the fastest on refreshing with server-boot-display-text changes :))

## Anyways, here's the fix!

Add the following boot options to the GRUB line (Select "edit" in Proxmox GRUB boot menu):

`nomodeset noapic`

Then boot.

Fixed this in my case!


## Related Links (Proxmox Forum)

  * [Install/Boot Issues on Supermicro Server (Feb 16, 2026)](https://forum.proxmox.com/threads/install-boot-issues-on-supermicro-server.180794/)

  * [Loading Initial ramdisk... Freeze](https://forum.proxmox.com/threads/loading-initial-ramdisk-freeze.170163/)

  * [Version 8 installation no display](https://forum.proxmox.com/threads/version-8-installation-no-display.131332/)
