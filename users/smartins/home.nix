{ config, pkgs, lib, userConfig, ... }:
let
  autostart = userConfig.autostart or [ ];
in
{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  imports = [ 
    ./modules/core/git.nix
    ./modules/commons/email.nix
    ./modules/common/nvim.nix
    ./modules/graphical/gnome.nix
    ./modules/graphical/librewolf.nix
    ./modules/media/mpv
  ]; 

  home.file = with lib;
    mkMerge (map (x: {
      ".config/autostart/${x}.desktop".source 
        = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/applications/${x}.desktop";
    }) autostart);

}
