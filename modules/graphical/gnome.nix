{ pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
      # Change default background
      [org.gnome.desktop.background]
      picture-uri='file://${pkgs.nixos-artwork.wallpapers.mosaic-blue.gnomeFilePath}'

      # Favorite apps in gnome-shell
      [org.gnome.shell]
      favorite-apps=['org.gnome.Photos.desktop', 'org.gnome.Nautilus.desktop']
    '';
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany
    yelp
  ]);

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
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
    firefox
  ];

  networking.networkmanager.enable = true;
  users.users.smartins = {
    extraGroups = [ "networkmanager" ];
  };
}
