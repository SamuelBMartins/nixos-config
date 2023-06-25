{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/hardware/efi.nix
      ./nvidia-offload.nix
    ];

  networking.hostName = "asus-laptop";

  console.keyMap = "fr_CH";

 services.xserver = {
    layout = "ch";
    xkbVariant = "fr";
  };
  
  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

