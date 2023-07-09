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
    # lutris
    mangohud

    # Emulator
    desmume
    ryujinx
    citra-nightly

    # Communication
    discord

    # Switch
    fusee-interfacee-tk
    
    # Not found: edo pro, MultiMC, genshin launcher, NS-USBLoader
  ];
}
