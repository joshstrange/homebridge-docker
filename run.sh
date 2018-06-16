#!/bin/sh

rm /var/run/dbus/pid #incase shutdown abruptly

until [ -f /root/.homebridge/config.json ]
do
     sleep 5
     echo "Waiting for config.json"
done
echo "Config file found"

until [ -f /root/.homebridge/package.json ]
do
     sleep 5
     echo "Waiting for package.json"
done
echo "Package file found"



sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

dbus-daemon --system
avahi-daemon -D

cd /root/.homebridge
yarn install

./node_modules/homebridge/bin/homebridge
