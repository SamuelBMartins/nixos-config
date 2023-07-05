{ config, pkgs, userConfig, ... }:
let
  autostart = userConfig.autostart ? [ ];
in
{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  imports = [ 
    ./modules/core/git.nix
    ./modules/common/nvim.nix

    lib.mkIf config.services.xserver.desktopManager.gnome.enable ./modules/graphical/gnome.nix
    lib.mkIf config.services.xserver.enable ./modules/media/mpv
  ];

  map (x: 
  
  home.file.".config/autostart/${x}.desktop".source 
  = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/applications/${x}.desktop";
  
  ) autostart

}
