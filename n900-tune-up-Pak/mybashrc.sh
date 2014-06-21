#!/bin/sh
cp bashrc /etc
cp /root/.bashrc /root/.bashrc-bak
rm /root/.bashrc
ln -s /etc/bashrc /root/.bashrc
rm /home/user/.bashrc
ln -s /etc/bashrc /home/user/.bashrc
echo "bash" >> /home/user/.profile
echo "bash" >> /root/.profile
