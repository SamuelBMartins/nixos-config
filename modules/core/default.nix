{ config, pkgs, lib, host, ... }: 
let
  update = pkgs.writeShellScriptBin "update" ''
    nix flake update && sudo nixos-rebuild switch;
  '' + 
  lib.optionalString config.services.flatpak.enable ''
    flatpak update -y; yes | flatpak remove --unused;
  '' + 
  lib.optionalString config.services.fwupd.enable ''
    fwupdmgr get-updates;
  '';
in
{
  imports =
    [ 
      ../../hosts/${host}/hardware-configuration.nix
      ./local.nix
    ];

  networking.hostName = host;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    update
    wget
    htop
    tree
    unzip
    file
  ];

  documentation.nixos.enable = false;

  system.stateVersion = "23.05";
}
