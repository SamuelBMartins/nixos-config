{ pkgs, ... }: {

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  environment.systemPackages = with pkgs; [
    # Games
    minecraft

    # Launcher
    heroic

    # Wine
    bottles

    # Emulator
    desmume
    ryujinx

    # Communication
    discord
  ];
}
