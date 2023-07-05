{ config, pkgs, lib, options, systemConfig, ... }:

lib.mkIf systemConfig.services.xserver.enable {
  programs.librewolf = {
    enable = true;
    
    settings = {

    };
  };
}
