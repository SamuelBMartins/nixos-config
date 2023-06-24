{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    vscode
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion
  ];
}
