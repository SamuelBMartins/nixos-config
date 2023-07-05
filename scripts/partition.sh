#!/bin/sh
cryptsetup luksFormat /dev/"$1"2 &&\
cryptsetup open /dev/"$1"2 nixos &&\
\
mkfs.vfat -n BOOT /dev/"$1"1 &&\
mkfs.btrfs -L root /dev/mapper/nixos &&\
\
mount -t btrfs /dev/mapper/nixos /mnt/ &&\
btrfs subvol create /mnt/@ &&\
btrfs subvol create /mnt/@home &&\
btrfs subvol create /mnt/@swap &&\
btrfs subvol create /mnt/@nix &&\
btrfs filesystem mkswapfile --size 20g --uuid clear /mnt/@swap/swapfile &&\
umount /mnt &&\
\
mount -t btrfs -o subvol=@ /dev/mapper/nixos /mnt &&\
mkdir /mnt/home &&\
mkdir /mnt/swap &&\
mkdir /mnt/nix &&\
mount -t btrfs -o subvol=@home /dev/mapper/nixos /mnt/home &&\
mount -t btrfs -o noatime,subvol=@swap /dev/mapper/nixos /mnt/swap &&\
mount -t btrfs -o noatime,subvol=@nix /dev/mapper/nixos /mnt/nix &&\
swapon /mnt/swap/swapfile &&\
mount /dev/"$1"1 /mnt/boot
