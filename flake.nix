{
  description = "Smarty's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, ... }:
  let
    system = systemConfig: nixpkgs.lib.nixosSystem {
        system = systemConfig.system;

        modules = [
          (./. + "/users/${systemConfig.username}")

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users."${username}" = {
              imports = [ 
                (./. + "/users/${userName}/home.nix") 
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
        ];

        username = "smartins";
        userModules = [
          
        ];
      };
    };
  };
}
