# Samba shows 8 random chars with tilde before the dot?

If you see a filename like `AKIY4A~P.MP4`, when opening a Samba (smb/cifs) share over the network, it's most likely that the filename on the (Linux?) server is fine, BUT contains one of the following special characters:

`> : " / \ | ?  *`

If you don't mind losing the original file/foldername, but simply want things to get working again, you may use [detox](https://github.com/dharple/detox):

`apt install detox` (on Debian-based GNU/Linux OS distributions)

Then clean the filenames on the server side, and you should see things "okay" again over the network.
