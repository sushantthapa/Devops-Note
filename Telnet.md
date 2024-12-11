

```
/app # telnet
/bin/sh: telnet: not found

/app # apk update
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
v3.7.0-243-gf26e75a186 [http://dl-cdn.alpinelinux.org/alpine/v3.7/main]
v3.7.0-229-g087f28e29d [http://dl-cdn.alpinelinux.org/alpine/v3.7/community]
OK: 9051 distinct packages available

/app # apk add busybox-extras
(1/1) Installing busybox-extras (1.27.2-r11)
Executing busybox-extras-1.27.2-r11.post-install
Executing busybox-1.27.2-r7.trigger
OK: 77 MiB in 64 packages

/app # busybox-extras telnet localhost 6900
```