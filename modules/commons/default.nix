{ pkgs, ... }: {

  imports = [
    ../core
    ./zsh.nix
  ];
  
  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    exa
    bat
    neofetch
    xclip
    # whois
    # ntfs-3g
  ];
}
