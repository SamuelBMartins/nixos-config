{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";

  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = "s@smartins.ch";
  };

  programs.fish = {
    enable = true;
    # interactiveShellInit = ''
    #   set fish_greeting # Disable greeting
    # '';
    plugins = [
    
    ];
  };
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
