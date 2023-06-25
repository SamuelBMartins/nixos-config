{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    bottles
    heroic
    minecraft
    desmume
    ryujinx
  ];
}
