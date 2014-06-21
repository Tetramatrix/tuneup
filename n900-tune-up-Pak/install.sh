#!/bin/sh
tmp=/tmp/n900-tune-up
cat > $tmp <<EOF
This program will install additional Performance Efficient Optimization Tune-Up Utilities Packages.
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
dpkg -i /opt/n900-tune-up/libattr1_2.4.43-1_armel.deb /opt/n900-tune-up/libacl1_2.2.47-2_armel.deb /opt/n900-tune-up/iptables_1.4.6-5_armel.deb /opt/n900-tune-up/iproute_20091226-1maemo1_armel.deb > $tmp
dpkg -i /opt/n900-tune-up/coreutils-gnu_8.4-2maemo1_armel.deb >> $tmp
ok=$?
cat $tmp
if test $ok = 0; then
    ln -sf /opt/maemo/usr/bin/gnu/dircolors /usr/bin/dircolors
    dbusbox "Success: Additional libraries are installed."
else
    dbusbox "Warning: Could not install additional libraries."
fi
rm $tmp
exit $ok
