{ config, lib, userConfig, systemConfig, ... }:

let
  autostart = userConfig.autostart or [ ];
in
lib.mkIf systemConfig.services.xserver.enable {

  home.file = with lib;
    mkMerge (map (x: {
      ".config/autostart/${x}.desktop".source
        = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/applications/${x}.desktop";
    }) autostart);

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" ];
      "application/x-shellscript" = [ "org.gnome.TextEditor.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" ];
      "x-scheme-handler/msteams" = [ "teams.desktop" ];
      "application/x-shellscript" = [ "org.gnome.TextEditor.desktop" ];
    };
  };
}
