/***************************************************************
* Copyright notice
*
* (c) 2011-2014 Chi Hoang (info@chihoang.de)
*  All rights reserved
*
***************************************************************/
#!/bin/bash
I=/home/user/n900-tune-up-Pak
rm -rf build/

# First, create the empty tree under a new "build" directory
# (the name "build" is completely arbitrary here)
mkdir -p build/opt/n900-tune-up
mkdir -p build/etc/event.d
mkdir -p build/etc/event.replace.d
mkdir -p build/usr/bin
mkdir -p build/usr/sbin
#mkdir -p build/home/user/.mozilla/microb
mkdir -p build/home/user
mkdir -p build/etc/default
mkdir -p build/usr/lib
mkdir -p build/usr/local/sbin
mkdir -p build/usr/share/policy/etc/rx51
mkdir -p build/root
mkdir -p build/usr/share/applications/hildon
mkdir -p build/usr/share/icons/hicolor/96x96/apps
mkdir -p build/bin
mkdir -p build/etc/sudoers.d
mkdir -p build/opt/maemo/usr/lib

cp -r $I/n900-tune-up/ build/opt/n900-tune-up/
cp $I/4lineshack2 build/etc/event.d/
cp $I/tune-up-startup build/etc/event.d/
cp $I/notify.sh build/etc/event.d/
cp $I/tune-up-startup build/opt/n900-tune-up
cp $I/read-ahead build/usr/bin/
#cp $I/user.js build/home/user/.mozilla/microb/
cp $I/dircolors build/home/user/.dircolors
cp $I/user.js build/opt/n900-tune-up/
cp $I/mount-opts build/etc/default/
cp $I/monitor.sh build/opt/n900-tune-up/
cp $I/swapspace.sh build/opt/n900-tune-up/
cp $I/swapinst.sh build/opt/n900-tune-up/
cp $I/xomap build/etc/event.d/
cp $I/xomap build/etc/event.replace.d/
cp $I/libmlockall/libmlockall.so.0.0 build/usr/lib/libmlockall.so
#cp $I/4lineshack build/etc/event.d/
cp $I/cgroup_clean build/usr/local/sbin/
cp $I/syspart.conf build/usr/share/policy/etc/rx51/
cp $I/bashrc build/home/user/.bashrc
cp $I/bashrc build/root/.bashrc
cp $I/dircolors build/root/.dircolors
cp $I/gainroot build/usr/sbin/
cp $I/java build/opt/n900-tune-up/
cp $I/schedtool build/usr/bin/
cp $I/n900-tune-up.desktop build/usr/share/applications/hildon/
cp $I/desktop/main build/opt/n900-tune-up/
cp $I/desktop/notify build/opt/n900-tune-up/
cp $I/deinstall.sh build/opt/n900-tune-up/
cp $I/install.sh build/opt/n900-tune-up/
cp $I/sqliteinst.sh build/opt/n900-tune-up/
cp $I/optimizesql.sh build/opt/n900-tune-up/
cp $I/n900-tune-up.png build/usr/share/icons/hicolor/96x96/apps/
cp $I/n900-tune-up.png build/opt/n900-tune-up/
cp $I/iproute_20091226-1maemo1_armel.deb build/opt/n900-tune-up/
cp $I/iptables_1.4.6-5_armel.deb build/opt/n900-tune-up/
cp $I/libnotifymm_0.6.2-2_armel.deb build/opt/n900-tune-up/
cp $I/libcairomm-1.0-1_1.6.4-2_armel.deb build/opt/n900-tune-up/
cp $I/libglibmm-2.4-1c2a_2.20.2-0maemo1_armel.deb build/opt/n900-tune-up/
cp $I/libgtkmm-2.4-1c2a_2.14.5-0maemo2_armel.deb build/opt/n900-tune-up/
cp $I/libsigc++-2.0-0c2a_2.2.4.2-0maemo0_armel.deb build/opt/n900-tune-up/
cp $I/libhildonnotifymm_0.6.1-1_armel.deb build/opt/n900-tune-up/
cp $I/libpangomm-1.4-1_2.24.0-3maemo1_armel.deb build/opt/n900-tune-up/
cp $I/coreutils-gnu_8.4-2maemo1_armel.deb build/opt/n900-tune-up/
cp $I/pulseaudio_0.9.15-1maemo43+0m5_armel.deb build/opt/n900-tune-up/
cp $I/libacl1_2.2.47-2_armel.deb build/opt/n900-tune-up/
cp $I/libattr1_2.4.43-1_armel.deb build/opt/n900-tune-up/
#cp $I/dbus-scripts_2.0_armel.deb build/opt/n900-tune-up
cp $I/bash build/bin/
cp $I/n900-tune-up.sudoers build/etc/sudoers.d/
cp $I/libs/* build/opt/maemo/usr/lib/
#cp $I/screen-lock-d $I/screen-lock.sh $I/screen-unlock.sh build/opt/n900-tune-up/

# move into the build directory, make a docs directory
cd build
mkdir -p usr/share/doc/n900-tune-up

# write the README file
cat > usr/share/doc/n900-tune-up/README <<END
This package provides tune-up utilities for Maemo.
END

# write the control file
cat > control <<END
Package: n900-tune-up
Version: 0.0.1
Section: user/hidden 
Priority: optional
Architecture: armel
Installed-Size: `du -ks usr|cut -f 1`
Maintainer: Chi Hoang <info@chihoang.de>
Description: Nokia N9000 Tune up
 
These tools can optimize the Nokia N900 and the internet. It can also protect against DDOS, DOS, Spoffing, MITM and Flooding attacks and it has a traffic-shapping script to group some http and ftp network. These tools also has colors for the terminal and it can optimize all Sqlite databases on Nokia N900.
 
 1. Installation
 1.1 Download the application
 1.2 Press the Tune-Up-Button in the homescreen menu
 1.3 Press the Install Libs-Button in the application Tune-Up mainmenu
 1.4 Then restart the device (i.e. reboot)
 
 2. Remove
 2.1 Press the Tune-Up-Button in the homescreen menu
 2.2 Press the Deinstall-Button in the application Tune-Up mainmenu
 2.3 Then restart the device (i.e. reboot)
END

# write the pre-installation script
cat > preinst <<END
#!/bin/sh
if [ ! -f "/usr/local/sbin" ] ; then
  mkdir -p /usr/local/sbin
fi
sed -i '/#DO NOT EDIT THIS BLOCK (WILL BREAK UNINSTALL OF 4lineshack)/,/###/d'  /etc/profile
if [ `grep 4lineshack -c /etc/profile` == 0 ]; then
  echo '#DO NOT EDIT THIS BLOCK (WILL BREAK UNINSTALL OF 4lineshack)
  if [ "\$PS1" ] ; then
    if [ $USER != "root" ] ; then
      sudo /opt/n900-tune-up/n900-tune-up/4lineshack.sh
    else 
      sh /opt/n900-tune-up/n900-tune-up/4lineshack.sh
    fi
  fi
  bash
  ###' >> /etc/profile
fi
if [ ! -f "/opt/maemo/usr/lib" ] ; then
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libcairomm-1.0.so.1.2.0
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libgdkmm-2.4.so.1.0.30
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libgiomm-2.4.so.1.2.0
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libglibmm-2.4.so.1.2.0
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libgtkmm-2.4.so.1.0.30
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libhildon-fmmm-1.0.so
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libhildonmm-1.0.so
  dpkg-divert --package n900-tune-up --rename --add /opt/maemo/usr/lib/libpangomm-1.4.so.1.0.30
fi 
if [ ! -f "/opt/maemo/usr/lib" ] ; then
 mkdir -p /opt/maemo/usr/lib
fi
if [ ! -f "/etc/event.d/tune-up-startup" ] ; then #File that you are looking for isn't there
  dpkg-divert --package n900-tune-up --divert /etc/xomap.event.d.distrib --rename --add /etc/event.d/xomap
  dpkg-divert --package n900-tune-up --divert /etc/xomap.event.replace.d.distrib --rename --add /etc/event.replace.d/xomap
  dpkg-divert --package n900-tune-up --rename --add /etc/default/mount-opts
  dpkg-divert --package n900-tune-up --rename --add /usr/share/policy/etc/rx51/syspart.conf
  dpkg-divert --package n900-tune-up --rename --add /home/user/.bashrc
  dpkg-divert --package n900-tune-up --rename --add /root/.bashrc
  dpkg-divert --package n900-tune-up --rename --add /usr/sbin/gainroot
fi
if [ ! -f "/usr/bin/schedtool" ] ; then
 dpkg-divert --package n900-tune-up --rename --add /usr/bin/schedtool
fi
dpkg-divert --package n900-tune-up --rename --add /bin/bash
END

cat > postinst <<END
#!/bin/sh
sed -i '/#DO NOT EDIT THIS BLOCK (WILL BREAK UNINSTALL OF 4lineshack)/,/###/d' /etc/profile
if [ `grep 4lineshack -c /etc/profile` == 0 ]; then
  echo '#DO NOT EDIT THIS BLOCK (WILL BREAK UNINSTALL OF 4lineshack)
  if [ "\$PS1" ] ; then
    if [ $USER != "root" ] ; then
      sudo /opt/n900-tune-up/n900-tune-up/4lineshack.sh
    else 
      sh /opt/n900-tune-up/n900-tune-up/4lineshack.sh
    fi
  fi
  bash
  ###' >> /etc/profile
fi
#if [ ! -f "/home/user/.mozila/microb/prefs.js" ] ; then
#  cp /opt/n900-tune-up/user.js /home/user/.mozilla/microb/
#fi
cp /opt/n900-tune-up/tune-up-startup /etc/event.d/tune-up-startup
chmod +x /opt/n900-tune-up/main
ln -sf /opt/maemo/usr/lib/libhildon-fmmm-1.0.so /usr/lib/libhildon-fmmm-1.0.so.1
ln -sf /opt/maemo/usr/lib/libhildonmm-1.0.so /usr/lib/libhildonmm-1.0.so.5
ln -sf /opt/maemo/usr/lib/libsigc-2.0.so.0.0.0 /usr/lib/libsigc-2.0.so.0
ln -sf /opt/maemo/usr/lib/libcairomm-1.0.so.1.2.0 /usr/lib/libcairomm-1.0.so.1
ln -sf /opt/maemo/usr/lib/libgdkmm-2.4.so.1.0.30 /usr/lib/libgdkmm-2.4.so.1
ln -sf /opt/maemo/usr/lib/libgiomm-2.4.so.1.2.0 /usr/lib/libgiomm-2.4.so.1
ln -sf /opt/maemo/usr/lib/libglibmm-2.4.so.1.2.0 /usr/lib/libglibmm-2.4.so.1
ln -sf /opt/maemo/usr/lib/libgtkmm-2.4.so.1.0.30 /usr/lib//libgtkmm-2.4.so.1
ln -sf /opt/maemo/usr/lib/libpangomm-1.4.so.1.0.30 /usr/lib/libpangomm-1.4.so.1
update-sudoers
chmod -R 777 /syspart/
END

# write the post-removal script
cat > postrm <<END
#!/bin/sh
if [ ! -f "/etc/event.d/tune-up-startup" ] ; then #File that you are looking for isn't there
 sed -i '/#DO NOT EDIT THIS BLOCK (WILL BREAK UNINSTALL OF 4lineshack)/,/###/d' /etc/profile
 dpkg-divert --package n900-tune-up --rename --remove /usr/share/policy/etc/rx51/syspart.conf
 dpkg-divert --package n900-tune-up --rename --remove /etc/default/mount-opts
 dpkg-divert --package n900-tune-up --rename --remove /etc/event.d/xomap
 dpkg-divert --package n900-tune-up --rename --remove /etc/event.replace.d/xomap
 dpkg-divert --package n900-tune-up --rename --remove /home/user/.bashrc
 dpkg-divert --package n900-tune-up --rename --remove /root/.bashrc
fi
if [ ! -f "/usr/bin/schedtool" ] ; then
 dpkg-divert --package n900-tune-up --rename --remove /usr/bin/schedtool
fi
if [ ! -f "/usr/sbin/gainroot" ] ; then
 dpkg-divert --package n900-tune-up --rename --remove /usr/sbin/gainroot
fi
if [ ! -f "/bin/bash" ] ; then
 dpkg-divert --package n900-tune-up --rename --remove /bin/bash
fi
iptables --flush
update-sudoers
END

# Setting this environment variable fixes Apple's modified GNU tar so that
# it won't make dot-underscore AppleDouble files. Google it for details...
export COPY_EXTENDED_ATTRIBUTES_DISABLE=1

# create the data tarball
# (the tar options "czvf" mean create, zip, verbose, and filename.)
tar czvf data.tar.gz root/ home/user/ opt/maemo/usr/lib/ etc/sudoers.d/ bin/ usr/share/icons/hicolor/96x96/apps/ usr/share/applications/hildon/n900-tune-up.desktop opt/n900-tune-up/ usr/local/sbin/cgroup_clean usr/lib/libmlockall.so etc/event.replace.d/xomap etc/default/mount-opts usr/bin/ usr/share/doc/ etc/event.d/ usr/share/policy/etc/rx51/syspart.conf home/user/.bashrc root/.bashrc usr/sbin/gainroot 

# create the control tarball
tar czvf control.tar.gz control preinst postinst postrm

# create the debian-binary file
echo 2.0 > debian-binary

# create the ar (deb) archive
ar -r n900-tune-up.deb debian-binary control.tar.gz data.tar.gz

# move the new deb up a directory
mv n900-tune-up.deb ..

# remove the tarballs, and cd back up to where we started
rm data.tar.gz control.tar.gz
cd ..
cp n900-tune-up.deb MyDocs/n900-tune-up_0.0.1.deb
tar cvvzf n900-tune-up-Pak.tgz n900-tune-up-Pak/
cp n900-tune-up-Pak.tgz MyDocs/
cp Package.sh MyDocs/
cp n900-tune-up.deb /media/mmc1/n900-tune-up_0.0.1.deb
cp n900-tune-up-Pak.tgz /media/mmc1
cp Package.sh /media/mmc1
