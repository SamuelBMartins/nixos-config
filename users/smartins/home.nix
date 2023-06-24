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

    shellAliases = {
      ls = "exa";
      cat = "bat";
      diff = "diff --color=auto";
      grep = "grep --color=auto";
      ip = "ip -color=auto";
      clip = "xclip -sel c <";
      lg = "lazygit";
      vim = "nvim";
    }
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
