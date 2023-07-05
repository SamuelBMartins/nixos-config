{ config, lib, pkgs, userConfig, systemConfig, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
lib.mkIf systemConfig.services.xserver.desktopManager.gnome.enable {
  # TODO name packages auto
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "${userConfig.wall}";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [ ] ++ map (x: (mkTuple [ "xkb" x ])) userConfig.keyboardLayout;
    };
    "org/gnome/shell" = {
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" ];
      disabled-extensions = [];
      favorite-apps = [
        "librewolf.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
    };
  };

  home.file.".face".source = ../../assets/icon.png;
}
