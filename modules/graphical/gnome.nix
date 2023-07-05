{ pkgs, username, ... }: {

  imports = [
    ../graphical
  ];

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    # TODO find name package automatically
    extraGSettingsOverrides = ''
      [org.gnome.shell]
      favorite-apps=['librewolf.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop']

      [org.gnome.desktop.peripherals.touchpad]
      tap-to-click=true
    '';
    extraGSettingsOverridePackages = [ 
      pkgs.gsettings-desktop-schemas 
    ]; 
  };

  # TODO
  # programs.gnupg.agent.enable = true;
  # security.pam.services.gdm.enableGnomeKeyring = true;

  # plymouth also for password
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.kernelParams = ["quiet"];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany
    yelp
  ]);
  
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";

    PATH = [ 
      "\${XDG_BIN_HOME}"
    ];
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    # TODO extensions tweaks boxes
  ];

  networking.networkmanager.enable = true;
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
}
