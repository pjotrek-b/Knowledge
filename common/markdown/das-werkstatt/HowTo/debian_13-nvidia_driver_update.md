# Updating nvidia driver on Debian 13 (Trixie)

On my system I had enabled 'trixie non-free` repositories, and installed the nvidia driver 550.x from Debian-backports repos. Worked fine!

...but I needed a newer CUDA version for pytensor libraries.

These instructions were used and tested on Proxmox 9.1 (Base: Debian 13 Trixie), running a local LLM AI in an LXC container

The AI-and-proxmox-LXC parts were taken from the following tutorial:
[Local Ai Server Setup Guides Proxmox 9 - Llama.cpp in LXC w/ GPU Passthrough (2025-08-17)](https://youtu.be/Met9pEfxsF8)
(BIG Thanks to the guy(s) from DigitalSpaceport.com for the very useful howtos and details!)

**Do the following on the Proxmox Node (Host), unless stated to run things in the container.**

## 0. Installing prerequisites

`apt install build-essentials dkms vulkan-loader vulkan-icd-loader libvulkan1 pkg-config`



## 1. Uninstalling all nvidia packages.

`apt remove --purge nvidia-\*`


## 2. Blacklisting `nouveau` driver

Create and edit the file `/etc/modprobe.d/blacklist-nouveau.conf`, with this content:

```
blacklist nouveau
options nouveau modeset=0
```

Then update the boot-kernel image and restart the node:

```
update-initramfs
reboot
```

Now the noveau driver is not loaded after reboot, so the nvidia driver install can continue:

## 3. Downloading the proprietary (😥️) driver from nvidia

https://www.nvidia.com/en-us/drivers/unix/

When I did this, the version was:

> Linux x86_64/AMD64/EM64T
> Latest Production Branch Version: **595.84**

Download the '.run' file (=shell script):

```
mkdir ~/install
cd ~/install/
wget [Linux-x86_64/595.84/NVIDIA-Linux-x86_64-595.84.run](https://us.download.nvidia.com/XFree86/Linux-x86_64/595.84/NVIDIA-Linux-x86_64-595.84.run)
```


## 4. Run the install script

On the Proxmox Node/Host:

```
./NVIDIA-Linux-x86_64-595.84.run --dkms
```

Then push that file into the running container. Mine has ID 101.

```
pct push 101 ~/install/NVIDIA-Linux-x86_64-595.84.run /root/install/NVIDIA-Linux-x86_64-595.84.run
pct enter 101
cd /root/install
chmod +x NV*
./NV* --no-kernel-modules


## (optional) Limit the power consumption of GPU

Edit crontab (as root):

`crontab -e`

Then put the following as the first line (above the default comment-block):

`@reboot nvidia-smi -pm 1 && nvidia-smi -pl 150`

The `nvidia-smi` command is used with `-pl 150` set the "power limit" to 150 Watts.


