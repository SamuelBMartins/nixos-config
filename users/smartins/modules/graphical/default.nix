{ config, lib, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{

  imports = [ 
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    bitwarden
  ];

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "${../../assets/walls/anime-wallpaper1.jpg}";
    };
  };

  home.file.".face".source = ../../assets/icon.png;
}
