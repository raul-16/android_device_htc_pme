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

set -e

better_copy()
{
  cp -dp "$1" "$2"
  # symlinks don't have a context
  if [ ! -L "$1" ]; then
    # it is assumed that every label starts with 'u:object_r' and has no white-spaces
    local context=`ls -Z "$1" | grep -o 'u:object_r:[^ ]*' | head -1`
    chcon -v "$context" "$2"
  fi
}

# Detect variant and copy its specific-blobs/items
modelid=`getprop ro.boot.cid`

case $modelid in
    "VZW__001") variant="vzw" ;;
    "SPCS_001") variant="spr" ;;
esac

if [ "$variant" == "vzw" ] || [ "$variant" == "spr" ]; then
   better_copy "/system/vendor/lib64/libril-qc-qmi-1-cdma.so" "/system/vendor/lib64/libril-qc-qmi-1.so"
else
   better_copy "/system/vendor/lib64/libril-qc-qmi-1-default.so" "/system/vendor/lib64/libril-qc-qmi-1.so"
fi

if [ "$variant" == "spr" ]; then
   better_copy "/system/vendor/etc/gps.conf.sprint" "/system/vendor/etc/gps.conf"
else
   better_copy "/system/vendor/etc/gps.conf.default" "/system/vendor/etc/gps.conf"
fi

# Clean-up
rm -rf "/system/vendor/etc/gps.conf.sprint"
rm -rf "/system/vendor/etc/gps.conf.default"

chmod 0644 /system/vendor/lib64/libril-qc-qmi-1.so
chmod 0644 /system/vendor/etc/gps.conf

done
