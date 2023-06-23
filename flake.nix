{
  description = "Smarty's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };
  
  let
    version = "23.05";
  in
  {
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-${version}";
      home-manager = {
        url = "github:nix-community/home-manager/release-${version}";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
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
        ];

        username = "smartins";
        userModules = [
          
        ];
      };
    };
  };
}
