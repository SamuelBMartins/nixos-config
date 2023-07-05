{ pkgs, ... }: {

  imports = [
    ../commons
    ../audio.nix
  ];

  services.flatpak.enable = true;
  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    evolutions
    evolution-ews
    scrcpy
    bitwarden
    ungoogled-chromium
    filezilla
    qbittorrent
    element-desktop
    gimp
    calibre
    synology-drive-client
    libreoffice
    celluloid
    # monero-gui
    # wasabiwallet
    # gparted
    # file-roller
    # geary
  ];

}
