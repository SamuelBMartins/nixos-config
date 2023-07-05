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

              specialArgs = { userConfig = systemConfig.user.config };
            };
          }
        ] 
        ++ systemConfig.modules

        specialArgs = { username = systemConfig.user.name; };
      };
  in
  {
    nixosConfigurations = {
      "qemu-kvm" = system {
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            keyboardLayout = [
              "us+altgr-intl"
              "ch+fr"
            ];
          }
        }

        modules = [
          ./hosts/qemu-kvm

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

      "asus-laptop" = system {
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            wall = ./. + "/users/smartins/assets/walls/anime-wallpaper1.jpg";
            keyboardLayout = [
              "ch+fr"
            ];
          }
        }

        modules = [
          ./hosts/asus-laptop

          # HW
          ./modules/hardware/efi.nix
          ./hosts/asus-laptop/nvidia-offload.nix
          ./modules/hardware/tpm2.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev
          ./modules/media
          ./modules/gaming
          ./modules/work

          # Services
          ./modules/ssh.nix
        ];
      };

      "work" = system {
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            keyboardLayout = [
              "gb"
              "ch+fr"
            ];
            autoStart = [
              "org.gnome.Evolution"
              "slack"
              "chromium"
            ];
          }
        }

        modules = [
          ./hosts/work

          # HW
          ./modules/hardware/efi.nix

          # DE 
          ./modules/graphical/gnome.nix

          # Categories
          ./modules/dev
          ./modules/work
        ];
      };

      "desktop" = system {
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            wall = ./. + "/users/smartins/assets/walls/anime-wallpaper1.jpg";
            keyboardLayout = [
              "us+altgr-intl"
            ];
            autoStart = [
              "discord"
            ];
          }
        }

        modules = [
          ./hosts/dektop

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
        system = "x86_64-linux";

        user = {
          name = "smartins";
          config = {
            wall = ./. + "/users/smartins/assets/walls/anime-wallpaper1.jpg";
            keyboardLayout = [
              "us+altgr-intl"
            ];
          }
        }

        modules = [
          ./hosts/thinkpad

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

    };
  };
}
