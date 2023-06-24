{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    plex-media-player
    jellyfin-web
    mpv
    spotify
    plex-mpv-shim
    jellyfin-mpv-shim
  ];
}
