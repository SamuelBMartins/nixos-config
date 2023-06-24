{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    plex-media-player
    jellyfin-web
    mpv
  ];
}
