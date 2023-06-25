{ pkgs, ... }: 
let
  update = pkgs.writeShellScriptBin "update" ''
    nix flake update && sudo nixos-rebuild switch;
    flatpak update -y; yes | flatpak remove --unused;
  '';
in
{
  documentation.nixos.enable = false;

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  
  environment.systemPackages = with pkgs; [
    git
    wget
    exa
    bat
    update
    htop
  ];
}
