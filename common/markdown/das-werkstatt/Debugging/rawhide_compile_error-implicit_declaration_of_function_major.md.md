# rawhide: error while trying to build on Xubuntu 20.04

```
rhcmds.c:477:41: warning: implicit declaration of function ‘major’; did you mean ‘c_major’? [-Wimplicit-function-declaration]
  477 | void c_major(llong i)   { Stack[SP++] = major(attr.statbuf->st_dev); }
      |                                         ^~~~~
      |                                         c_major
```


Here's the complete, uncut commandline and console output:


```
git clone https://codeberg.org/raforg/rawhide.git

Cloning into 'rawhide'...
remote: Enumerating objects: 1242, done.
remote: Counting objects: 100% (456/456), done.
remote: Compressing objects: 100% (173/173), done.
remote: Total 1242 (delta 353), reused 349 (delta 281), pack-reused 786 (from 1)
Receiving objects: 100% (1242/1242), 739.65 KiB | 2.80 MiB/s, done.
Resolving deltas: 100% (938/938), done.
```

```
§ cd rawhide/
```

```
§ make

cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhcmds.c
rhcmds.c: In function ‘c_major’:
rhcmds.c:477:41: warning: implicit declaration of function ‘major’; did you mean ‘c_major’? [-Wimplicit-function-declaration]
  477 | void c_major(llong i)   { Stack[SP++] = major(attr.statbuf->st_dev); }
      |                                         ^~~~~
      |                                         c_major
rhcmds.c: In function ‘c_minor’:
rhcmds.c:478:41: warning: implicit declaration of function ‘minor’; did you mean ‘c_minor’? [-Wimplicit-function-declaration]
  478 | void c_minor(llong i)   { Stack[SP++] = minor(attr.statbuf->st_dev); }
      |                                         ^~~~~
      |                                         c_minor
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rh.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhparse.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhdir.c
rhdir.c: In function ‘visitf_long’:
rhdir.c:1333:97: warning: implicit declaration of function ‘major’; did you mean ‘t_major’? [-Wimplicit-function-declaration]
 1333 | ssnprintf(buf + pos, CMDBUFSIZE - pos, "%*llu", attr.dev_major_column_width, (ullong)major(attr.statbuf->st_dev))) > attr.dev_major_column_width)
      |                                                                                      ^~~~~
      |                                                                                      t_major
rhdir.c:1340:97: warning: implicit declaration of function ‘minor’; did you mean ‘t_minor’? [-Wimplicit-function-declaration]
 1340 | ssnprintf(buf + pos, CMDBUFSIZE - pos, "%*llu", attr.dev_minor_column_width, (ullong)minor(attr.statbuf->st_dev))) > attr.dev_minor_column_width)
      |                                                                                      ^~~~~
      |                                                                                      t_minor
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhdata.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhstr.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rherr.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhfnmatch.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -c rhgetopt.c
cc -O3 -g -Wall -pedantic   -DETCDIR=\"/etc\" -DRAWHIDE_NAME=\"rawhide\" -DRAWHIDE_PROG_NAME=\"rh\" -DRAWHIDE_VERSION=\"3.3\" -DRAWHIDE_DATE=\"20231013\"                            -o rh rhcmds.o rh.o rhparse.o rhdir.o rhdata.o rhstr.o rherr.o rhfnmatch.o rhgetopt.o           
/usr/bin/ld: rhcmds.o: in function `c_major':
/home/myuser/DELME/rawhide/rhcmds.c:477: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `c_rmajor':
/home/myuser/DELME/rawhide/rhcmds.c:485: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `c_minor':
/home/myuser/DELME/rawhide/rhcmds.c:478: undefined reference to `minor'
/usr/bin/ld: rhcmds.o: in function `c_rminor':
/home/myuser/DELME/rawhide/rhcmds.c:486: undefined reference to `minor'
/usr/bin/ld: rhcmds.o: in function `r_minor':
/home/myuser/DELME/rawhide/rhcmds.c:1785: undefined reference to `minor'
/usr/bin/ld: rhcmds.o: in function `r_major':
/home/myuser/DELME/rawhide/rhcmds.c:1784: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `r_rmajor':
/home/myuser/DELME/rawhide/rhcmds.c:1792: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `r_rminor':
/home/myuser/DELME/rawhide/rhcmds.c:1793: undefined reference to `minor'
/usr/bin/ld: rhcmds.o: in function `t_rmajor':
/home/myuser/DELME/rawhide/rhcmds.c:1913: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `t_major':
/home/myuser/DELME/rawhide/rhcmds.c:1905: undefined reference to `major'
/usr/bin/ld: rhcmds.o: in function `t_minor':
/home/myuser/DELME/rawhide/rhcmds.c:1906: undefined reference to `minor'
/usr/bin/ld: rhcmds.o: in function `t_rminor':
/home/myuser/DELME/rawhide/rhcmds.c:1914: undefined reference to `minor'
/usr/bin/ld: rhdir.o: in function `visitf_long':
/home/myuser/DELME/rawhide/rhdir.c:1333: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:1340: undefined reference to `minor'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:1520: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:1527: undefined reference to `minor'
/usr/bin/ld: rhdir.o: in function `visitf_format':
/home/myuser/DELME/rawhide/rhdir.c:3815: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3977: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3976: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3966: undefined reference to `minor'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3967: undefined reference to `minor'
/usr/bin/ld: rhdir.o: in function `json':
/home/myuser/DELME/rawhide/rhdir.c:3084: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3085: undefined reference to `minor'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3104: undefined reference to `major'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3105: undefined reference to `minor'
/usr/bin/ld: rhdir.o: in function `visitf_format':
/home/myuser/DELME/rawhide/rhdir.c:3805: undefined reference to `minor'
/usr/bin/ld: /home/myuser/DELME/rawhide/rhdir.c:3806: undefined reference to `minor'
collect2: error: ld returned 1 exit status
make: *** [Makefile:183: rh] Error 1
```

