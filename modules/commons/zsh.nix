{ config, pkgs, username, ... }: {

  users.users.${username}.shell = pkgs.zsh;

  fonts = {
    fontconfig = {
    defaultFonts = {
      monospace = [ "Source Code Pro" ];
    };
  };

    fonts = with pkgs; [
      source-code-pro
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true; 

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };

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
