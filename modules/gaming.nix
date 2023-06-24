{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  networking.firewall = {
    allowedTCPPorts = [3000];
    allowedUDPPorts = [
      32410
      32412
      32413
      32414
    ];
  };
}
