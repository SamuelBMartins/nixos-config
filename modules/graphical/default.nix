{ pkgs, ... }: {

  imports = [
    ../commons
    ../audio.nix
  ];

  services.flatpak.enable = true;
  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    exa
    bat
    scrcpy
    bitwarden
    wasabiwallet
    ungoogled-chromium
    filezilla
    qbittorrent
    element-desktop
    gimp
    calibre
    synology-drive-client
    gparted
    libreoffice
    celluloid
  ];

}
