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
    wasabiwallet
    ungoogled-chromium
    filezilla
    qbittorrent
    element-desktop
    gimp
    calibre
    synology-drive-client
    libreoffice
    celluloid
    # gparted
    # file-roller
    # geary
  ];

}
