{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";

  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = "s@smartins.ch";
    signing.key = null; # GPG decides appropriate key to use based on email
    signing.signByDefault = true;
  };

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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    coc = {
      enable = true;

      settings = {
	      "suggest.noselect" = true;
      };
    };

    plugins = with pkgs.vimPlugins; [
      nerdtree
      lightline-vim
      vim-devicons
      vim-startify
    ];

    extraConfig = ''
      set relativenumber
      set ignorecase
      set tabstop=4
      set softtabstop=4
      set expandtab
      set shiftwidth=4
      set autoindent
      set cc=80
      set mouse=a
      set cursorline
    '';
  };
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
