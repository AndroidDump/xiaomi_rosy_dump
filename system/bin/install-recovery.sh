#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:32503118:7696e689dd1d3915220c82bddcbe37248eb0c6ee; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:28294474:1f3f7c5648731c25e35ab4d93606dbead10fcf8a EMMC:/dev/block/bootdevice/by-name/recovery 7696e689dd1d3915220c82bddcbe37248eb0c6ee 32503118 1f3f7c5648731c25e35ab4d93606dbead10fcf8a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
