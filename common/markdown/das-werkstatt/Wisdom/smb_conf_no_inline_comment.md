# in /etc/samba/smb.conf, DO NOT...

...Use in-line comments.
Yes, lines starting with "#" are comments, but DO NOT add a comment in a parameter line:

> log level = 7     # very noisy

This causes great havoc!
smbd service will not start anymore until you remove this part:

> # very noisy

Samba won't start and complain it cannot load smb.conf.
Yet, `testparm` says "all good"...

Very confusing.
So #wisdom: "**NO inline comments in smb.conf**"
