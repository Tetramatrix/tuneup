#!/bin/sh
tmp=/tmp/n900-tune-up
cat > $tmp <<EOF
This program will format (erase) and partition a 16GB SD-Card with 3 partitons: a 2GB Nitroid partition, a big FAT32 partition and a small 640 MB swap partition to offload the RAM. Please be cautious and don't forget to make a backup!
EOF
maemo-confirm-text "Performance Efficient Optimization Tune-Up Utilities" $tmp
res=$?
rm -f $tmp
dbus="run-standalone.sh dbus-send --type=method_call --dest=org.freedesktop.Notifications /org/freedesktop/Notifications"
dbusmsg () { $dbus org.freedesktop.Notifications.SystemNoteInfoprint string:"$1"; }
dbusbox () { $dbus org.freedesktop.Notifications.SystemNoteDialog string:"$1" uint32:0 string:OK; }

if test "$res" != 0; then
    dbusmsg "User has cancelled the installation. No changes were made."
    exit 1
fi

if pgrep -f /usr/bin/hildon-application-manager > /dev/null; then
    dbusbox "Error: Application Manager is running. Please close it before deinstallation."
    exit 1
fi
if pgrep -f apt-worker > /dev/null; then
    dbusbox "Error: apt is running. Please wait and try again later."
    exit 1
fi
sh /opt/n900-tune-up/swapspace.sh > $tmp
ok=$?
cat $tmp
if test $ok = 0; then
    dbusbox "Success: SD card format and partition."
else
    dbusbox "Warning: Could not format and partition."
fi
rm $tmp
exit $ok
