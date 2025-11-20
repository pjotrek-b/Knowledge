# Problem

So I wanted to use zsync to download/update my existing ISO file of MX-Linux from v23.6 to v25:

`$ zsync -i MX-23.6_x64.iso https://ftp.tu-chemnitz.de/pub/linux/MX/Linux/MX/Final/Xfce/MX-25_Xfce_x64.iso.zsync`

But got the following, cryptic error:

> failed on url 
> https://ftp.tu-chemnitz.de/pub/linux/MX/Linux/MX/Final/Xfce/MX-25_Xfce_x64.iso.zsync
> could not read control file from URL 
> https://ftp.tu-chemnitz.de/pub/linux/MX/Linux/MX/Final/Xfce/MX-25_Xfce_x64.iso.zsync

However, I've downloaded the checked the `.zsync file`, and its text-header looked proper:

```
zsync: 0.6.2
Filename: MX-25_Xfce_x64.iso
MTime: Sat, 08 Nov 2025 19:37:36 +0000
Blocksize: 4096
Length: 2788163584
Hash-Lengths: 2,3,5
URL: MX-25_Xfce_x64.iso
SHA-1: 2e6f0ce80ce6eb118b9c54b3f020bb7cca8f1e09
```

Hm...


# Solution

It's a known issue since at least 2021-05: [Feature request: Support 'https' links #14](https://github.com/cph6/zsync/issues/14).

In many cases, it /may/ work to simply remove the "s" from https - and go with plain `http://` prefix, like in my case:

`$ zsync -i MX-23.6_x64.iso https://ftp.tu-chemnitz.de/pub/linux/MX/Linux/MX/Final/Xfce/MX-25_Xfce_x64.iso.zsync`


However, nowadays many servers auto-redirect (`mod_rewrite` ;)) http to https, so whether this works or not depends on /the webserver/ hosting the zsync + files.

However: If anyone provides `.zsync` files, they should be (made) aware of if http:// is available or not for zsync to work.


Good luck and all the best! :sun:
