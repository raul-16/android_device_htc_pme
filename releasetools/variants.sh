#!/sbin/sh
#
# Copyright (C) 2017 Pure Fusion OS
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Mount /system via shell script

export SYSDEV="/dev/block/bootdevice/by-name/system"
export SYSFS="ext4"
export SYSMOUNT="/system"

determine_system_mount() {
  if grep -q -e"^$SYSDEV" /proc/mounts; then
    umount $(grep -e"^$SYSDEV" /proc/mounts | cut -d" " -f2)
  fi

  if [ -d /mnt/system ]; then
    SYSMOUNT="/mnt/system"
  elif [ -d /system_root ]; then
    SYSMOUNT="/system_root"
  else
    SYSMOUNT="/system"
  fi

}

mount_system() {
  mount -t $SYSFS $SYSDEV $SYSMOUNT -o rw,discard
}

unmount_system() {
  umount $SYSMOUNT
}

# Detect variant and copy its specific-blobs/items

echo "enter variants.sh script ...."

modelid=`getprop ro.boot.cid`

case $modelid in
    "SPCS_001") variant="spr" ;;
esac

determine_system_mount
echo "sysmount point is: $SYSMOUNT"
mount_system
echo "******  /system mounted OK  ***********"
echo "***************************************"

if [ "$variant" == "spr" ]; then
	echo "you have a Sprint variant phone ...."
	cp -dp /system_root/system/vendor/etc/gps.conf.sprint /system_root/system/vendor/etc/gps.conf
else
	echo "you have a default variant phone ...."
	cp -dp /system_root/system/vendor/etc/gps.conf.default /system_root/system/vendor/etc/gps.conf
fi

# Clean-up
rm -rf /system_root/system/vendor/etc/gps.conf.sprint
rm -rf /system_root/system/vendor/etc/gps.conf.default

chmod 0644 /system_root/system/vendor/lib64/libril-qc-qmi-1-cdma.so
chmod 0644 /system_root/system/vendor/lib64/libril-qc-qmi-1-default.so
chmod 0644 /system_root/system/vendor/etc/gps.conf

echo "clean up done & lib file chmod set to 644 ......"

unmount_system
echo "******  /system unmounted OK  *********"
echo "***************************************"

echo "exit variants script ......"

exit 0

