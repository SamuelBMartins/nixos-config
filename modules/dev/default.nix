{ config, pkgs, lib, username, ... }: {
  
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  systemd.user.services.xhost-docker = {
    script = ''
      ${lib.getExe pkgs.xorg.xhost} +"local:docker@"
    '';
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
  };

  environment.systemPackages = with pkgs; [
    # IDE
    vscode
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion
    # android-studio
    # gnome-builder

    # Tools
    lazygit
    postman
    apostrophe
    # meld

    # CLI
    awscli2
    xorg.xhost
    git-crypt

    # Languages
    # jdk17
    # maven

    # cargo
    # rustc
    # rustfmt
  ];
}
