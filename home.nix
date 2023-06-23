{ config, pkgs, ... }:

{
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Ryan Yin";
    userEmail = "xiaoyin_c@qq.com";
  };
  
  home.packages = [
    neofetch
  ];
 
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
