https://unix.stackexchange.com/questions/341564/vim-unable-to-copy-paste-in-debian-stretch

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=864074

# Problem

The mouse setting `mouse=a`, which seems to be default for vim on Debian-based distros for many years now (at least since 2015?), is problematic (for me) because it makes it impossible to quickly select+copy text from the terminal to the clipboard.

Vim switches to the VISUAL mode, allowing to use the mouse for select+copy+paste /in vim/ - but not into the system's clipboard.

So when inside vim, I type ":set mouse=" and all is good.

But this setting seems to be ignored when in vim's config files, such as `/etc/vimrc`, `/etc/vimrc.local`


# Solution

When putting the same line into `~/.vimrc` - it works as expected (Debian12):

```
" Disable mouse support (to allow regular clipboard in the terminal):
set mouse=
```

This is good, because now I can use vim like I want to - and: this is odd.
Why is `set mouse=` ignored in `/etc/vim/vimrc.local`, but all other settings from in there are loaded?

Interesting. And since it's all FOSS, it must be possible to find out why - and fix it.

Somehow.
