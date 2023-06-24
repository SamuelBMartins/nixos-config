{ pkgs, username, ... }: {

  services.openssh = {
    enable = true;
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAdk8ny9myBiMiSOJsaIXWV2FlwhEyT7WmbCLnipVN3S s@smartins.ch"
  ];
}
