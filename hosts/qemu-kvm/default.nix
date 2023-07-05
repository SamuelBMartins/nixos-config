{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  networking.hostName = "qemu-kvm";

  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

