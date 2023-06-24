{ config, pkgs, ... }:

{
  home.username = "smartins";
  home.homeDirectory = "/home/smartins";

  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = "s@smartins.ch";
  };

  programs.fish = {
    enable = true;
    # interactiveShellInit = ''
    #   set fish_greeting # Disable greeting
    # '';
    # plugins = [
    #   # Enable a plugin (here grc for colorized command output) from nixpkgs
    #   { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    #   # Manually packaging and enable a plugin
    #   {
    #     name = "z";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "jethrokuan";
    #       repo = "z";
    #       rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
    #       sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
    #     };
    #   }
    # ];
  };
 
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
