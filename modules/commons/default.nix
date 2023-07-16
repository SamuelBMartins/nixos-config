{ pkgs, ... }: {

  imports = [
    ../core
    ./zsh.nix
  ];
  
  services.fwupd.enable = true;

  fonts = {
    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
      };
    };

    fonts = with pkgs; [
      source-code-pro
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };

  environment.systemPackages = with pkgs; [
    exa
    bat
    neofetch
    xclip
    # whois
    # ntfs-3g
  ];
}
