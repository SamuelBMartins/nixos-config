{ config, pkgs, ... }:

{

  config.networking.firewall = {
    allowedTCPPorts = [3000];
    allowedUDPPorts = [
      32410
      32412
      32413
      32414
    ];
  };

  config.home.packages = with pkgs; [
    plex-media-player
    jellyfin-web
    mpv
    spotify
    plex-mpv-shim
    jellyfin-mpv-shim
  ];
}
