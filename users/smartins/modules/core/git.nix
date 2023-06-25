{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = "s@smartins.ch";
    signing.key = null; # GPG decides appropriate key to use based on email
    signing.signByDefault = true;
  };
}
