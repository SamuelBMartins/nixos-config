{ config, pkgs, userConfig, ... }:
let
  work = userConfig.work ? false;
in
{
  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = if work 
      then "s@smartins.ch" 
      else "samuel.debabomartins@supsi.ch";
    signing.key = null; # GPG decides appropriate key to use based on email
    signing.signByDefault = true;
  };
}
