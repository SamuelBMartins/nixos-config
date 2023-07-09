{ config, pkgs, ... }:

{
  services.xserver.displayManager.gdm.wayland = false;
}

