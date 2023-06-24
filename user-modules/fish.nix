{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-fish
  ];

  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "exa";
      cat = "bat";
      diff = "diff --color=auto";
      grep = "grep --color=auto";
      ip = "ip -color=auto";
      clip = "xclip -sel c <";
      lg = "lazygit";
    };
  };
}
