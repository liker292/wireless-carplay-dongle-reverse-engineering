########################
# Copyright(c) 2014-2017 DongGuan HeWei Communication Technologies Co. Ltd.
# file    udisk_insert.sh
# brief   
# author  Shi Kai
# version 1.0.0
# date    03Jun17
########################
#!/bin/sh
echo "/dev/$MDEV $ACTION" >> /dev/ttymxc0
case $ACTION in
	add)
		if [ ! -d /sys/block/*/$MDEV[0-9] ] ; then
			echo "no sda[0-9]" >> /dev/ttymxc0
			mkdir -p /mnt/UPAN
			mount /dev/$MDEV /mnt/UPAN -t vfat -o utf8=1
			blkid /dev/$MDEV | awk '{print $3}' > /tmp/udisk_uuid
			/script/update_box.sh /dev/$MDEV &
		fi
		;;
	remove)
		umount -l /mnt/UPAN
		rm -f /tmp/update_status
		killall ARMadb-driver
		/script/start_accessory.sh
		ARMadb-driver &
		;;
esac



