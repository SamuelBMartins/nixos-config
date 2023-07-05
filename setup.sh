#!/bin/sh
mv /etc/nixos /etc/nixos-old
chown -R 1000 *
ln -s $(pwd) /etc/nixos
