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
  services.xserver.desktopManager.gnome = { 
    extraGSettingsOverrides = '' 
      [org.gnome.desktop.input-sources] 
      sources=[('xkb', 'fr_CH')]
    ''; 
  };

  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "23.05";
}

