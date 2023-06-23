{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/efi.nix
    ];

  networking.hostName = "qemu-kvm";

  # home-manager.users.smartins = import ../../users/smartins;

  nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
     git
     wget
   ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  
  system.stateVersion = "23.05";

}

