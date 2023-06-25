{ config, pkgs, ... }:

{
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
      set encoding=UTF-8
    '';
  };
}

