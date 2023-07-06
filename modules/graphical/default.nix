{ pkgs, ... }: {

  imports = [
    ../commons
    ../audio.nix
  ];

  programs.gnupg.agent.enable = true;

  services.flatpak.enable = true;
  hardware.opengl.enable = true;

  services.printing.enable = true;
  services.printing.drivers = [ 
    pkgs.gutenprint
    pkgs.gutenprintBin
    pkgs.hplip
  ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  environment.systemPackages = with pkgs; [
    evolution
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
  ];

}
