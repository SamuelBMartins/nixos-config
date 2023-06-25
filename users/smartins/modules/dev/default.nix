{ config, pkgs, ... }:

{
  imports = [ 
    "./nvim.nix"
  ];

  home.packages = with pkgs; [
    lazygit
    vscode
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion
  ];
}
