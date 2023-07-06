{ config, pkgs, username, ... }: {
  
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    # IDE
    vscode
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion

    # Tools
    lazygit
    postman
    apostrophe
    # meld

    # CLI
    awscli2

    # Languages
    # jdk17
    # maven

    # cargo
    # rustc
    # rustfmt
  ];
}
