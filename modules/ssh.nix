{ pkgs, username, ... }: {

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    builtins.readFile ../assets/ssh/personal.pub
  ];
}
