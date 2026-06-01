# Honey, I froze my XFCE!

So `xfwm --replace` for some yet unknown reason randomly eats ~20-25% of my CPU. I wouldn't notice it if I hadn't my cpu graph on a panel.

What is it doing?

`strace -p $(pgrep xfwm)`

shows that something's going awry with some resources being unavailable:

`recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)`



There seem to be dangling socket links?

`ls -l /proc/$(pgrep xfwm)/fd/`

Showing up "red" as broken symlinks to inexisting sockets.

I have no clue what causes this or how to fix it.
This has been borken for more than 1h now. I will try logout/login - then reboot.


# Raw copy/past fragment of strace output:

```
writev(3, [{iov_base="\212\5\2\0\254\256\221\0\217\3\4\0\0\306\210\0\0\0\0\0\254\256\221\0\212\21\3\0\254\256\221\0"..., iov_len=252}, {iov_base=NULL, iov_len=0}, {iov_base="", iov_len=0}], 3) = 252
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
poll([{fd=3, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=3, revents=POLLOUT}])
writev(3, [{iov_base="\212\r\4\0\212\256\221\0\252\256\221\0\212\256\221\0\212\5\2\0\255\256\221\0\212\f\3\0\212\256\221\0"..., iov_len=1040}, {iov_base=NULL, iov_len=0}, {iov_base="", iov_len=0}], 3) = 1040
poll([{fd=3, events=POLLIN}], 1, -1)    = 1 ([{fd=3, revents=POLLIN}])
recvmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\1\0#v\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 32
poll([{fd=3, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=3, revents=POLLOUT}])
writev(3, [{iov_base="\212\16\4\0\302\256\221\0\240\216\213\0\302\256\221\0\212\26\4\0\5\340\217\0\302\256\221\0\0\0\0\0"..., iov_len=3208}, {iov_base=NULL, iov_len=0}, {iov_base="", iov_len=0}], 3) = 3208
poll([{fd=3, events=POLLIN}], 1, -1)    = 1 ([{fd=3, revents=POLLIN}])
recvmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\1\2\262v\0\0\0\0006\217m\10\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 32
poll([{fd=3, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=3, revents=POLLOUT}])
writev(3, [{iov_base="\212\n\2\0\255\256\221\0\212\n\2\0\212\256\221\0", iov_len=16}, {iov_base=NULL, iov_len=0}, {iov_base="", iov_len=0}], 3) = 16
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
poll([{fd=3, events=POLLIN}, {fd=4, events=POLLIN}, {fd=5, events=POLLIN}, {fd=15, events=POLLIN|POLLPRI}], 4, 0) = 0 (Timeout)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Resource temporarily unavailable)
poll([{fd=3, events=POLLIN}, {fd=4, events=POLLIN}, {fd=5, events=POLLIN}, {fd=15, events=POLLIN|POLLPRI}], 4, -1) = 1 ([{fd=3, revents=POLLIN}])
recvmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="[\3\264v\216\5\200\0\277\5\200\0\203\260\300\r\0\0\0\0\340\4\30\0\361\330\361\330\340\4\30\0", iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 32
```

