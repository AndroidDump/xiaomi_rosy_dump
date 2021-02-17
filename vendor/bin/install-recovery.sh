#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):21784576:310da0ff1ac427bb66b937f2f566f2ea12872383; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot$(getprop ro.boot.slot_suffix):14338048:d4cd5c32e86487e7fcf4fdfaeae95a32060f4146 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):21784576:310da0ff1ac427bb66b937f2f566f2ea12872383 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
