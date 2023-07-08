{ config, pkgs, ... }:

{
 accounts.email.accounts = {
  "personal" = {
    address   = "samuel@smartins.ch";
    passwordCommand = "cat ${age.secrets.email_personal.path}";

    
  };
 };
}

