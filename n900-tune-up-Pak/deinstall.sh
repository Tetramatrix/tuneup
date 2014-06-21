#!/bin/sh
tmp=/tmp/n900-tune-up
cat > $tmp <<EOF
This program will remove the Performance Efficient Optimization Tune-Up Utilities.
EOF
maemo-confirm-text "Performance Efficient Optimization Tune-Up Utilities" $tmp
res=$?
rm -f $tmp
dbus="run-standalone.sh dbus-send --type=method_call --dest=org.freedesktop.Notifications /org/freedesktop/Notifications"
dbusmsg () { $dbus org.freedesktop.Notifications.SystemNoteInfoprint string:"$1"; }
dbusbox () { $dbus org.freedesktop.Notifications.SystemNoteDialog string:"$1" uint32:0 string:OK; }

if test "$res" != 0; then
    dbusmsg "User has cancelled the deinstallation. No changes were made."
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
apt-get remove -y n900-tune-up > $tmp
ok=$?
cat $tmp
if test $ok = 0; then
    dbusbox "Tune-Up Utilities deinstalled."
else
    dbusbox "Warning: Could not remove Tune-Up Utilities."
fi
rm $tmp
exit $ok
