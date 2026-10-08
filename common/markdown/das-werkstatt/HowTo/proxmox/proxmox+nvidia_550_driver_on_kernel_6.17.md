# Installing nvidia 550.163.01 kernel module on Proxmox, Linux Kernel v6.17

So it has been quite an adventure so far...

The "issues" In a nutshell:

  1. Proxmox' latest kernel of the 6.x series is 6.17
  2. Current nvidia-driver from "trixie" only build until 6.15


the solution in a nutshell:

  1. Enable "download.proxmox.com", Categories "pve-no-subscription" in APT sources.list.d

  2. apt install pve-headers-$(uname -r)

  3. apt install -t trixie-backports nvidia-drivers

Using the `trixie-backports` version should do the trick ;)


# Most recent or newer driver version

for nvidia driver 595.85, simply replace the last command (3) with:

  3. Download the desired nvidia driver:
     https://www.nvidia.com/en-us/drivers/details/272964/

  4. Mark it executable:
     `chmod +x NVIDIA*.run`

  5. `sudo ./NVIDIA*.run`
     And choose "nvidia-proprietary" (for now)
