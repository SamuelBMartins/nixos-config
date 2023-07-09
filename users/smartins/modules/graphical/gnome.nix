{ config, lib, pkgs, userConfig, systemConfig, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
  work = userConfig.work or false;
in
lib.mkIf systemConfig.services.xserver.desktopManager.gnome.enable {

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" ];
    };
  };

  # TODO name packages auto
  dconf.settings = lib.mkMerge [
    {
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
      "org/gnome/desktop/interface" = {
        gtk-enable-primary-paste = false;
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
      };
      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };
      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "small-plus";
      };
    }

    (lib.mkIf (userConfig ? wall) {
    "org/gnome/desktop/background" = {
        picture-uri = "${userConfig.wall}";
      };
    })
  ];

  home.file = lib.mkMerge [
    {
      "Templates/text.txt".text = "";
      "Templates/writer.odt".source = ../../../../assets/templates/writer.odt;
      "Templates/calc.ods".source = ../../../../assets/templates/calc.ods;
      "Templates/impress.odp".source = ../../../../assets/templates/impress.odp;
      "Templates/draw.odg".source = ../../../../assets/templates/draw.odg;
    }
    (lib.mkIf (!work) {
      ".face".source = ../../../../assets/icon.png;
    })
  ];
  
}
