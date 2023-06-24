{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  home.packages = with pkgs; [
    discord
    bottles
    heroic
    minecraft
  ];
}
