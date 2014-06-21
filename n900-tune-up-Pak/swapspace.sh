#!/bin/sh
umount /media/mmc1
swapoff /dev/mmcblk1p3
sfdisk /dev/mmcblk1 << EOF
0,381230,0c
381231,84481,0b
465712,,S
EOF
mkswap /dev/mmcblk1p3
mkdosfs /dev/mmcblk1p2
mkdosfs /dev/mmcblk1p1


