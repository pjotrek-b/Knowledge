# Installing MegaRAID tools on Proxmox 9

https://wiki.nethserver.org/doku.php?id=howto_megaraid
https://hwraid.le-vert.net/wiki/DebianPackages


## Import keyring for `hwraid.le-vert.net`

NOTE "apt-key" is deprecated (security reasons)

So the public GPG key needs to be converted from ASCII and saved in `/usr/share/keyrings`:

`wget https://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key -O - | gpg --dearmor -o /usr/share/keyrings/hwraid-archive-keyring.gpg`

Will put the file in your keyring:

`ls -la /usr/share/keyrings/hwraid-archive-keyring.gpg`

> -rw-r--r-- 1 root root 2287 Sep 28 10:32 /usr/share/keyrings/hwraid-archive-keyring.gpg


## Add APT sources

`cat /etc/apt/sources.list.d/hwraid.sources`

```
# https://hwraid.le-vert.net/wiki/DebianPackages
# https://wiki.nethserver.org/doku.php?id=howto_megaraid
#deb http://hwraid.le-vert.net/debian trixie main

Types: deb
URIs: http://hwraid.le-vert.net/debian
Suites: trixie
Components: main
Signed-By: /usr/share/keyrings/hwraid-archive-keyring.gpg
```


## Reload sources and install the tools

```
apt update
apt install megacli megactl megaclisas-status
```



# Enable JBOD to pass-thru disks (eg for ZFS)

## Check if all disks are "visible"

`megaclisas-status`

```
-- Controller information --
-- ID | H/W Model         | RAM    | Temp | BBU    | Firmware
c0    | LSI MegaRAID ROMB | 1024MB | 63C  | Absent | FW: 23.18.0-0013

-- Array information --

-- Disk information --

-- Unconfigured Disk information --
-- ID   | Type | Drive Model                      | Size     | Status                          | Speed    | Temp | Slot ID  | LSI ID | Path
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY88842 | 3.637 TB | Unconfigured(good), Spun down   | 6.0Gb/s  | 31C  | [252:0]  | 27     | N/A
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY85WWY | 3.637 TB | Unconfigured(good), Spun down   | 6.0Gb/s  | 32C  | [252:1]  | 26     | N/A
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY87TJN | 3.637 TB | Unconfigured(good), Spun down   | 6.0Gb/s  | 32C  | [252:2]  | 25     | N/A
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY85X9F | 3.637 TB | Unconfigured(good), Spun down   | 6.0Gb/s  | 32C  | [252:3]  | 24     | N/A
```

Notice the "Status: Unconfigured(good), Spun down".


## Enable pass-thru as JBOD (Just a Bunch Of Disks)

`$ megacli -AdpSetProp -enableJBOD 1 -a0`

```
Adapter 0: Set JBOD to Enable success.

Exit Code: 0x00
```

## List again to check `Status: JBOD`

`megaclisas-status`

```
-- Controller information --
-- ID | H/W Model         | RAM    | Temp | BBU    | Firmware
c0    | LSI MegaRAID ROMB | 1024MB | 63C  | Absent | FW: 23.18.0-0013

-- Array information --

-- Disk information --

-- Unconfigured Disk information --
-- ID   | Type | Drive Model                      | Size     | Status | Speed    | Temp | Slot ID  | LSI ID | Path
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY88842 | 3.637 TB | JBOD   | 6.0Gb/s  | 31C  | [252:0]  | 27     | /dev/sdg
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY85WWY | 3.637 TB | JBOD   | 6.0Gb/s  | 32C  | [252:1]  | 26     | /dev/sdf
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY87TJN | 3.637 TB | JBOD   | 6.0Gb/s  | 32C  | [252:2]  | 25     | /dev/sde
c0uXpY  | HDD  | ST4000VN008-2DR166 SC60 ZGY85X9F | 3.637 TB | JBOD   | 6.0Gb/s  | 32C  | [252:3]  | 24     | /dev/sdd
```

Now the disks will show up as `/dev/disk/` as normally expected :)

