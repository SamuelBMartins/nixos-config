{ pkgs, ... }: {

  imports = [
    ../commons
    ../audio.nix
  ];

  programs.gnupg.agent.enable = true;

  services.flatpak.enable = true;
  hardware.opengl.enable = true;

  # printers
  services.printing.enable = true;
  services.printing.drivers = [ 
    pkgs.gutenprint
    pkgs.gutenprintBin
    pkgs.hplip
  ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # Network
  environment.etc."NetworkManager/system-connections/VPN-SUPSI.nmconnection".source = ../../assets/network/vpn/SUPSI.nmconnection;

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
