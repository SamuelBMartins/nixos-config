{ config, username, ... }: {
  
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

    # Languages
    # jdk17
    # maven

    # cargo
    # rustc
    # rustfmt
  ];
}
