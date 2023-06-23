## BTRFS with luks encryption

```bash
gdisk /dev/vda
d #delete everythink
n # create +500M size partition in ef00
n # create 8300 partition with remaining space

cryptsetup luksFormat /dev/vda2
cryptsetup open /dev/vda2 nixos

mkfs.vfat -n BOOT /dev/vda1
mkfs.btrfs -L root /dev/mapper/nixos

mount -t btrfs /dev/mapper/nixos /mnt/
btrfs subvol create /mnt/@
btrfs subvol create /mnt/@home
btrfs subvol create /mnt/@swap
btrfs subvol create /mnt/@nix
btrfs filesystem mkswapfile --size 20g --uuid clear /mnt/@swap/swapfile
umount /mnt

mount -t btrfs -o subvol=@ /dev/mapper/nixos /mnt
mount -t btrfs -o subvol=@home /dev/mapper/nixos /mnt/home
mount -t btrfs -o noatime,subvol=@swap /dev/mapper/nixos /mnt/swap
mount -t btrfs -o noatime,subvol=@nix /dev/mapper/nixos /mnt/nix
swapon /mnt/swap/swapfile
mount /dev/vda1 /mnt/boot

nixos-generate-config --root /mnt
nixos-install
reboot
```

Add to hardware config.nix
```
swapDevices = [ { device = "/swap/swapfile"; } ];
```

Add noatime option:
```
fileSystems."/" =
    { device = "/dev/disk/by-uuid/f2ef73d8-bfd0-49ef-80c7-f470d86d1fc4";
      fsType = "btrfs";
      options = [ "subvol=nixos" "noatime ];
    };
```