########################
# Copyright(c) 2014-2017 DongGuan HeWei Communication Technologies Co. Ltd.
# file    udisk_remove.sh
# brief   
# author  Shi Kai
# version 1.0.0
# date    03Jun17
########################
#!/bin/sh
echo "/dev/$MDEV PLUG OUT" >> /dev/ttymxc0
umount -l /mnt/UPAN
killall ARMadb-driver
/script/start_accessory.sh
ARMadb-driver &

