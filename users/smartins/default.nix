{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";

  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = "s@smartins.ch";
  };
  
  home.packages = with pkgs; [
    neofetch
    tree
  ];
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
