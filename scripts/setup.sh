#!/bin/sh
cd ..
mv /etc/nixos /etc/nixos-old
ln -s $(pwd) /etc/nixos
chown -R 1000 /etc/nixos
chown -R 1000 $(pwd)
