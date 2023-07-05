{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  networking.hostName = "asus-laptop";

  console.keyMap = "fr_CH";

  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

