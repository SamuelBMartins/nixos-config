{ config, pkgs, home-manager, ... }:

{
  imports =
    [ 
      home-manager.nixosModules.home-manager
      ./hardware-configuration.nix
      ../../hardware/efi.nix
      # ../../core
    ];

  networking.hostName = "qemu-kvm";

  users.users.smartins = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.smartins = import ../../users/smartins;

  nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
     git
     wget
   ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  
  system.stateVersion = "23.05";

}

