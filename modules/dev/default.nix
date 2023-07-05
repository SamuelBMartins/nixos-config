{ config, username, ... }: {
  
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    lazygit
    vscode
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion
    postman
    apostrophe
    neofetch
  ];
}
