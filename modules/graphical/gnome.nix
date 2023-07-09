{ pkgs, ... }: {

  imports = [
    ../graphical
  ];

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
      [org.gnome.desktop.peripherals.touchpad]
      tap-to-click=true
    '';
    extraGSettingsOverridePackages = [ 
      pkgs.gsettings-desktop-schemas 
    ]; 
  };

  programs.xwayland.enable = true;

  # plymouth also for password
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.kernelParams = ["quiet"];

  programs.dconf.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany
    yelp
  ]);

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    # TODO tweaks boxes
  ];
  
}
