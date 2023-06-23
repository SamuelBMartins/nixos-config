{ config, lib, pkgs, home-manager, impermanence, lanzaboote, nix-index-database, stylix, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
  ];
}
