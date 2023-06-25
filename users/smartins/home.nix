{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
