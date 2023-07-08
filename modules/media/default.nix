{ pkgs, ... }: {

  networking.firewall = {
    allowedTCPPorts = [3000];
    allowedUDPPorts = [
      32410
      32412
      32413
      32414
    ];
  };

  environment.systemPackages = with pkgs; [ 
    plex-mpv-shim 
    plex-media-player
    jellyfin-web
    celluloid
    spotify
    freetube
    # ffmpeg
    # spot
  ];
}
