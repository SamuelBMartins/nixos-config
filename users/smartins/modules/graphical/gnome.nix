{ config, lib, pkgs, userConfig, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = userConfig.wall;
    };
    "org/gnome/desktop/input-sources" = {
      sources = [ ] ++ map (x: (mkTuple [ "xkb" x ])) userConfig.keyboardLayout;
    };
  };

  home.file.".face".source = ../../assets/icon.png;
}
