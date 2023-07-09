{ pkgs, username, ... }: {

  imports = [
    ../commons
    ../audio.nix
  ];

  programs.gnupg.agent.enable = true;

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
    };
  };
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

  # Network - requires restart NetworkManager
  networking.networkmanager.enable = true;
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
  
  environment.etc."NetworkManager/system-connections/VPN-SUPSI.nmconnection" = {
    source = ../../assets/network/vpn/SUPSI.nmconnection;
    mode = "0600";
  };

  environment.etc."librewolf/policies/policies.json".source = ../../assets/dotfiles/firefox/policies.json;

  environment.systemPackages = with pkgs; [
    scrcpy
    bitwarden
    ungoogled-chromium
    filezilla
    qbittorrent
    element-desktop
    gimp
    calibre
    synology-drive-client
    celluloid
    element-desktop

    # Office
    libreoffice
    pdfslicer
    foliate
    evolution
    evolution-ews

    # monero-gui
    # wasabiwallet
    # gparted
    # tigervnc
    # komikku
    # quasselClient
  ];

}
