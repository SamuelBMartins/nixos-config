{ config, pkgs, home-manager, ... }:

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
  };
  
  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.ryan = import ./home.nix;
          }

  nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
     git
     wget
   ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  
  system.stateVersion = "23.05";

}

