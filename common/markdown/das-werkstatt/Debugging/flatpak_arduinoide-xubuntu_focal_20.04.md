# Flatpak error: "Unable to load summary from remote flathub - summary exceeded maximum size"

TL;DR:
> **(X)ubuntu 20.04's flatpak was version v1.6.5: Added PPA and updated flatpak (to v1.14.10-1~flatpak1~20.04.1) fixed the issue.**

So I wanted to install [Arduino IDE](https://packages.debian.org/search?suite=all&section=all&arch=any&searchon=names&keywords=arduino), but (x)ubuntu's 20.04 repositories had v1.0.5, whereas the Arduino-website listed support for the versions: "1.8.19 Legacy" or "2.x Latest".

Here's the error:

> § flatpak install flathub cc.arduino.arduinoide

```
Looking for matches…
error: Unable to load summary from remote flathub: URI https://dl.flathub.org/repo/summary exceeded maximum size of 10485760 bytes
```

## Fix: Update flatpak.

On [Launchpad, you'll get the links for flatpak-PPA](https://launchpad.net/~flatpak/+archive/ubuntu/stable):

```
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install flatpak
```

Should return something like this:

```
The following packages will be upgraded:
  flatpak libostree-1-1
2 upgraded, 0 newly installed, 0 to remove and 205 not upgraded.
Need to get 1.774 kB of archives.
After this operation, 2.239 kB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://ppa.launchpad.net/flatpak/stable/ubuntu focal/main amd64 libostree-1-1 amd64 2020.8-flatpak2~20.04 [311 kB]
Get:2 http://ppa.launchpad.net/flatpak/stable/ubuntu focal/main amd64 flatpak amd64 1.14.10-1~flatpak1~20.04.1 [1.464 kB]
Fetched 1.774 kB in 2s (1.021 kB/s)  
(Reading database ... 412427 files and directories currently installed.)
Preparing to unpack .../libostree-1-1_2020.8-flatpak2~20.04_amd64.deb ...
Unpacking libostree-1-1:amd64 (2020.8-flatpak2~20.04) over (2020.3-1) ...
Preparing to unpack .../flatpak_1.14.10-1~flatpak1~20.04.1_amd64.deb ...
Unpacking flatpak (1.14.10-1~flatpak1~20.04.1) over (1.6.5-0ubuntu0.5) ...
Setting up libostree-1-1:amd64 (2020.8-flatpak2~20.04) ...
Setting up flatpak (1.14.10-1~flatpak1~20.04.1) ...
Installing new version of config file /etc/X11/Xsession.d/20flatpak ...
Installing new version of config file /etc/profile.d/flatpak.sh ...
Processing triggers for libc-bin (2.31-0ubuntu9.16) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for dbus (1.12.16-2ubuntu2.3) ...
Processing triggers for doc-base (0.10.9) ...
Processing 1 changed doc-base file...
```

So now, the above install should work. Try it again:

> § flatpak install flathub cc.arduino.arduinoide


Have a great day! :)
