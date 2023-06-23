{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/hardware/efi.nix
    ];

  networking.hostName = "qemu-kvm";

  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

