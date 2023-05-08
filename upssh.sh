#!/bin/bash

tar -xvf /root/openssh79.tar.gz
cd /root/openssh79
mkdir /bak
cp -ar /etc/ssh /bak
rpm -e `rpm -qa |grep openssh`

sleep 1

rm -rf /etc/ssh/*
rpm -iv --force --nodeps *.rpm

sleep 1

chkconfig sshd on

sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config

sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config

sleep 1

service sshd restart

