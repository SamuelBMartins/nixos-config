{ config, pkgs, lib, options, systemConfig, ... }:

lib.mkIf systemConfig.services.xserver.enable {
  programs.librewolf = {
    enable = true;
    
    # TODO look at arkenfox
    settings = {
      "identity.fxaccounts.enabled" = true;

      "clipboard.autocopy" = false;
      "middlemouse.paste" = false;
      "general.autoScroll" = true;

      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.sessions" = false;

      "webgl.disabled" = false;

      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.urlbar.update2.engineAliasRefresh" = true;
    };
  };
}
