{
  description = "Smarty's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = systemConfig: nixpkgs.lib.nixosSystem {
        system = systemConfig.system;

        modules = [
          sops-nix.nixosModules.sops
          (./. + "/users/${systemConfig.username}")

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users."${systemConfig.username}" = {
              imports = [ 
                (./. + "/users/${systemConfig.username}/home.nix") 
              ] ++ systemConfig.userModules;
            };
          }
        ] ++ systemConfig.modules;
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
          ./modules/core.nix
          ./modules/graphical/gnome.nix
        ];

        username = "smartins";
        userModules = [
          ./user-modules/graphical.nix
        ];
      };
    };
  };
}
