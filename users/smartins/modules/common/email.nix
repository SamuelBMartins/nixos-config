{ config, pkgs, ... }:

{
 accounts.email.accounts = {
  "personal" = {
    primary = true;
    address   = "samuel@smartins.ch";
    realName = "Samuel Martins";
    passwordCommand = "cat ${config.age.secrets.email_personal.path}";
    smtp = {
      host = "mail.infomaniak.ch";
      port = 993;
    };
    # gpg.key =
    imap.host = "mail.infomaniak.ch";
    
  };

  "work" = {
    flavor = "outlook.office365.com";
    address   = "samuel.debabomartins@supsi.ch";
    passwordCommand = "cat ${config.age.secrets.email_work.path}";
  };
 };
}

