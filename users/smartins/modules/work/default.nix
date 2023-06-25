{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    teams
    zoom-us
    scrcpy
    slack
  ];
}
