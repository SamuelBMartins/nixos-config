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
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = systemConfig: nixpkgs.lib.nixosSystem {
        system = systemConfig.system;

        modules = [
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
        };
      };
  in
  {
    nixosConfigurations = {
      "qemu-kvm" = system {
        name = "qemu-kvm";
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            keyboardLayout = [
              "us+altgr-intl"
              "ch+fr"
            ];
          };
        };

        modules = [
          # HW
          ./modules/hardware/efi.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev

          # Services
          ./modules/qemu-guest.nix
        ];
      };

      "asus-laptop" = system (import ./hosts/asus-laptop/configuration.nix);

      "work" = system {
        name = "work";
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            work = true;
            keyboardLayout = [
              "gb"
              "ch+fr"
            ];
            # TODO find name package automatically
            autostart = [
              "org.gnome.Calendar"
              "org.gnome.Geary"
              "slack"
              "teams"
            ];
          };
        };

        modules = [
          # HW
          ./modules/hardware/efi.nix
          ./modules/hardware/tpm2.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev
          ./modules/work
        ];
      };

      "desktop" = system {
        name = "desktop";
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            wall = ./. + "assets/walls/hololive.jpg";
            keyboardLayout = [
              "us+altgr-intl"
            ];
            autostart = [
              "discord"
            ];
          };
        };

        modules = [
          # HW
          ./modules/hardware/efi.nix
          ./modules/hardware/tpm2.nix
          ./modules/hardware/nvidia.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev
          ./modules/media
          ./modules/gaming
          ./modules/work
        ];
      };

      "thinkpad" = system {
        name = "thinkpad";
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            wall = ./. + "assets/walls/anime1.jpg";
            keyboardLayout = [
              "us+altgr-intl"
            ];
          };
        };

        modules = [
          # HW
          ./modules/hardware/efi.nix
          ./modules/hardware/tpm2.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev
          ./modules/media
          ./modules/gaming
          ./modules/work
        ];
      };

      "raspberry" = system {
        name = "raspberry";
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            keyboardLayout = [
              "us+altgr-intl"
            ];
          };
        };

        modules = [
          # Categories
          ./modules/core

          # Services
          ./modules/ssh.nix
        ];
      };

    };
  };
}
