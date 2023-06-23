{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../hardware/efi.nix
    ];

  networking.hostName = "qemu-kvm";

  users.users.smartins = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
     git
     wget
   ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  
  system.stateVersion = "23.05";

}

