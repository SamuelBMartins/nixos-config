{
  description = "Smarty's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, arkenfox, ... }:
  let
    system = systemConfig: nixpkgs.lib.nixosSystem {
        system = systemConfig.system;

        modules = [
          (./. + "/users/${systemConfig.username}")

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users."${systemConfig.username}" = {
              imports = [ 
                (./. + "/users/${systemConfig.username}/home.nix") 
              ] ++ systemConfig.userModules ;
            };
          }
        ] ++ systemConfig.modules;

        specialArgs = { username = systemConfig.username; };
      };
  in
  {
    nixosConfigurations = {
      "qemu-kvm" = system {
        system = "x86_64-linux";
        modules = [
          ./hosts/qemu-kvm
          ./modules/core.nix
          ./modules/qemu-guest.nix
          ./modules/graphical/gnome.nix
        ];

        username = "smartins";
        userModules = [
          
        ];
      };

      "asus-laptop" = system {
        system = "x86_64-linux";
        modules = [
          ./hosts/asus-laptop
          ./modules/hardware/tpm2.nix
          ./modules/graphical/gnome.nix
          ./modules/gaming.nix
          ./modules/media.nix
          ./modules/dev.nix
          ./modules/ssh.nix
        ];

        username = "smartins";
        userModules = [
          ./users/smartins/modules/core
          ./users/smartins/modules/dev
          ./users/smartins/modules/gaming
          ./users/smartins/modules/work
          ./users/smartins/modules/media
          ./users/smartins/modules/graphical
        ];
      };
    };
  };
}
