# Steps to reduce flash/SSD wear on Proxmox

There are several howtos and forum entries out there, like this one:
https://www.xda-developers.com/disable-these-services-to-prevent-wearing-out-your-proxmox-boot-drive/

In a nutshell, the common steps to reduce writes to PVE's system disks are:

  1. Stop and disable PVE high-availability (HA) and cluster services:

     `systemctl stop pve-ha-crm.service pve-ha-lrm.service corosync.service`
     `systemctl disable pve-ha-crm.service pve-ha-lrm.service corosync.service`

  2. Mount `/var/log` to either RAM or disks.
     I've chosen the "log2ram" approach.


## Logging to RAM

Run the following commands as `root`:

  1. Download the repository key for "azlux.fr":

    `wget -O /usr/share/keyrings/azlux-archive-keyring.gpg https://azlux.fr/repo.gpg`

  2. Add the repository to APT:

    `echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ trixie main" | tee /etc/apt/sources.list.d/azlux.list`
    (Replace `trixie` with your Debian version)

  3. Update the repository index and install `log2ram` package:

    `apt update && apt install log2ram`

  4. Configure journald to a fixed-size limit for logs:

    * Edit `/etc/systemd/journald.conf`
    * Set the value `SystemMaxUse=40M`  
      (set the limit to fit your needs. log2ram defaults to 128MB ramdisk size)

  5. Reboot.



I have not yet done additional tests on the effectiveness myself, but even just moving logs away from a flash disk already makes sense.

Have fun!


# More related links

  * https://homelab.casaursus.net/minimize-wear-and-tear-on-system-ssd/
  * https://github.com/azlux/log2ram
