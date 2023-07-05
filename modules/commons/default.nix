{ pkgs, ... }: {

  imports = [
    ../core
    ./zsh.nix
  ];
  
  environment.systemPackages = with pkgs; [
    exa
    bat
    neofetch
  ];
}
