#!/bin/rc
bind -a /overlay/386/bin /bin
bind -b /overlay/sys/include /sys/include
bind -a /overlay/lib/acid /lib/acid
zc -h

reboot
