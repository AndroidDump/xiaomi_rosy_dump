#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:32505166:07b92e17f0165ff837dfe3b246e9852f60f076c6; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:28296522:352b8e51658f85c0ecabb3f9ddf74c056cd0be5e EMMC:/dev/block/bootdevice/by-name/recovery 07b92e17f0165ff837dfe3b246e9852f60f076c6 32505166 352b8e51658f85c0ecabb3f9ddf74c056cd0be5e:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
