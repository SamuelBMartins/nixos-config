{
  description = "Smarty's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, flatpaks, ... }:
  let
    system = systemConfig: nixpkgs.lib.nixosSystem {
        system = systemConfig.system;

        modules = [
          flatpaks.nixosModules.default

          (./. + "/users/${systemConfig.user.name}")

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users."${systemConfig.user.name}" = {
              imports = [ 
                (./. + "/users/${systemConfig.user.name}/home.nix") 
              ];
            };
            
            home-manager.extraSpecialArgs = { 
              userConfig = systemConfig.user.config;
              systemConfig = self.nixosConfigurations.${systemConfig.name}.config;
            };
          }
        ] ++ systemConfig.modules;

        specialArgs = { 
          username = systemConfig.user.name;
          host = systemConfig.name;
          system = systemConfig.system;
          inputs = inputs;
        };
      };

    systems = hosts: builtins.listToAttrs (map (x: {
        name = x;
        value = system (import ./hosts/${x}/configuration.nix);
    }) hosts);
  in
  {
    nixosConfigurations = systems (builtins.attrNames (builtins.readDir ./hosts));
  };
}
