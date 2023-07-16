{ config, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  imports = [ 
    ./modules/core/git.nix
    ./modules/core/keys.nix

    ./modules/common/nvim.nix

    ./modules/graphical/graphical.nix
    ./modules/graphical/gnome.nix
    ./modules/graphical/librewolf.nix

    ./modules/media/mpv
  ]; 

}
