{ config, pkgs, lib, options, systemConfig, ... }:

{
  a = bultins.trace  systemConfig "ciao"
  programs.librewolf = {
    enable = true;
    
    settings = {

    };
  };
}
