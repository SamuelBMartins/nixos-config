{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Ryan Yin";
    userEmail = "xiaoyin_c@qq.com";
  };
  
  home.packages = with pkgs; [
    neofetch
    tree
  ];
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
