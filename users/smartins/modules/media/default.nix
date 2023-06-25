{ config, pkgs, ... }:

{
  imports = [ 
    ./mpv
  ];

  home.packages = with pkgs; [
    plex-media-player
    jellyfin-web
    spotify
  ];
}
