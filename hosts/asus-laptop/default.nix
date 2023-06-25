{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/hardware/efi.nix
      ./nvidia-offload.nix
    ];

  networking.hostName = "asus-laptop";

  services.xserver = {
    layout = "ch";
    xkbVariant = "fr";
  };

  console.keyMap = "fr_CH";

  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

